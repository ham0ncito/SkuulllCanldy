<?php

namespace Controllers\Store;

use Controllers\PrivateController;
use Controllers\PublicController;
use Utilities\Secur\Crypt as sec;
use Utilities\Site;
use Views\Renderer;
use DAO\Carretillas\Carretillas as Carretilla;

class ShoppingCart extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'], 'ADMIN');
        $productData = array();
        $totalCrrprc = 0;
        $totalcrrctd = 0;
        $early = "";
        self::carrito();
        $fecha_mas_reciente_timestamp = 0;
        $xls = sec::decryptDatum($_SESSION['sesionId']);
        $cart = $_SESSION["cart" . $xls];
        // foreach($cart as $product){
        //     var_dump($product);
        // }
        $viewData['products'] = $cart;
        foreach ($viewData['products'] as $product) {
            if (isset($product['crrprc'])) {
                $totalCrrprc += $product['crrprc'];
            }
            if (isset($product['crrctd'])) {
                $totalcrrctd += $product['crrctd'];
            }
            if (isset($product['crrctd'])) {

                $timestamp = strtotime($product['crrfching']);
                if ($timestamp > $fecha_mas_reciente_timestamp) {
                    $fecha_mas_reciente_timestamp = $timestamp;
                }
            }
        }
        $viewData['total_products'] = $totalCrrprc;
        $viewData['quantity'] = $totalcrrctd;
        $viewData['crrfching'] =  date('Y-m-d', $fecha_mas_reciente_timestamp);
        $nuevaFecha = strtotime($viewData['crrfching'] . ' +30 days');
        $viewData['crrfchingRemove'] = date('Y-m-d', $nuevaFecha);
        $phrase = "C";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }

        $viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $_SESSION['tokenShopping'] = $viewData['token'];
        Renderer::render("store\cart", $viewData);
    }

    private function Carrito()
    {
        $xls = sec::decryptDatum($_SESSION['sesionId']);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["tokenShopping"] == $_POST["xsx"]) {
                if (isset($_POST['deleteButton'])) {
                    if (!isset($_SESSION['cart'])) {
                        unset($_SESSION['cart']);
                        echo '<script>alert("Carrito was removed");</script>';
                    }
                }
               
            }
        }
    }
    private function createCarrito()
    {
    }
}