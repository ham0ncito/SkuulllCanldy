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
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        $productData = array();
        $totalCrrprc = 0;
        $totalcrrctd = 0;
        $early = "";
        self::carrito();
        $fecha_mas_reciente_timestamp = 0;
        $viewData['products'] = Carretilla::obtenerPorId(sec::decryptDatum($_SESSION['sesionId'][count($_SESSION['sesionId'])]));
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
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["tokenShopping"] == $_POST["token"]) {
                if (isset($_POST['deleteButton'])) {
                    if (!isset($_SESSION['cart'])) {
                        unset($_SESSION['cart']);
                        echo '<script>alert("Carrito was removed");</script>';
                    } 
                }
                if (isset($_POST['buyButton'])) {
                    if (!isset($_SESSION['cart'])) {
                        $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                            "test" . (time() - 10000000),
                            "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_error",
                            "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_accept"
                        );
                        foreach ($_SESSION['cart'] as $product) {
                            $usercod = $product['usercod'];
                            $productId = $product['productid'];
                            $productName = $product['productName'];
                            $productQuantity = $product['crrctd'];
                            $productPrice = $product['crrprc'];
                            $crrfching = $product['crrfching'];
            
                            $PayPalOrder->addItem($productName,$productName.' purchased in Skull2canldy',$product,$productPrice,$productPrice *0.15, $productQuantity, "DIGITAL GOODS" );
                            $viewData['products'] = Carretilla::deleteCarretilla(sec::decryptDatum($_SESSION['sesionId'][count($_SESSION['sesionId'])]));
                        }
                        $response = $PayPalOrder->createOrder();
                        unset($_SESSION['cart']);
                        $_SESSION["orderid"] = $response[1]->result->id;
                        \Utilities\Site::redirectTo($response[0]->href);
                        die();
                      
                    }
                }
            } 
        }
    }
    private function createCarrito()
    {
    }
}