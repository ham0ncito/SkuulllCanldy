<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

/*
Este fragmento de código PHP define una clase llamada ShoppingCart dentro del espacio de nombres Controllers\Store. Aquí está una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Store, lo que sugiere que esta clase se encarga de la lógica relacionada con la tienda en el sistema.

Clase ShoppingCart: Esta clase extiende la clase PublicController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles públicamente.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye obtener información del carrito de compras, calcular el total de productos y su cantidad, establecer tokens de seguridad, y renderizar la vista del carrito de compras.

Método privado deleteCarrito(): Este método maneja la lógica para eliminar el carrito de compras. Verifica si se ha enviado un formulario para eliminar el carrito y elimina los datos del carrito de la sesión.

Método privado Carrito(): Este método maneja la lógica para modificar el carrito de compras. Verifica si se ha enviado un formulario para eliminar un ítem del carrito y elimina el ítem correspondiente de la sesión del carrito. */

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
       
            $xls = \DAO\Security\Security::getCodigoByEmail($_SESSION["login"]['userEmail']); 
        
        if (isset($_SESSION["cart" . $xls])) {
            $cart = $_SESSION["cart" . $xls];
            $viewData['products'] = $cart;
            if (self::deleteCarrito($xls)) {
                $cart = "";
                if (isset($viewData['products'])) {
                    unset($viewData['products']);
                }
                $viewData['isEmpty'] = true;
            }
            if(isset($viewData['products'])){
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
                $viewData['isEmpty'] = false;
            }
           
        } else {
            $viewData['isEmpty'] = true;
        }

        $phrase = "C";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }

        $viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $_SESSION['tokenShopping'] = $viewData['token'];
       
        Renderer::render("store\cart", $viewData);
    }
    private static function deleteCarrito($xls)
    {
        $data = 'cart' . strval($xls);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["tokenShopping"] == $_POST["xsx"]) {
                if (isset($_POST['deleteButton'])) {
                    if (isset($_SESSION[$data])) {
                        unset($_SESSION[$data]);
                        echo '<script>alert("Carrito was removed");</script>';
                        return true;
                    } else {
                        echo '<script>alert("Couldnt find carrito");</script>';
                        return false;
                    }
                }
            }
        }
    }

    private function Carrito()
    {
        $xls = \DAO\Security\Security::getCodigoByEmail($_SESSION["login"]['userEmail']);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["tokenShopping"] == $_POST["xsx"]) {
                if (isset($_POST['deleteButton'])) {
                    if (!isset($_SESSION['cart'.$xls])) {
                        unset($_SESSION['cart'.$xls]);
                        echo '<script>alert("Carrito was removed");</script>';
                    }
                }
                if(isset($_POST['deleteItem'])){
                    $crrfching = $_POST['deleteItem'];
                    foreach ($_SESSION['cart'. $xls] as $key =>$product) {
                        if ($product['crrfching'] === $crrfching) {
                            unset($_SESSION['cart'.$xls][$key]);
                            break; 
                        }
                    }
                }
            }
        }
    }
    
}