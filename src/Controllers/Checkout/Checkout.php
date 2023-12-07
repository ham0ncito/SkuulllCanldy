<?php

namespace Controllers\Checkout;

use Dao\Carretillas\Carretillas as Carrito;
use Controllers\PublicController;
use Dao\Purchases\Purchases as purchase; 
use Dao\Purchasedetails\Purchasedetails as detail;  


class Checkout extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_error",
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_accept"
            );
            $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
            self::getSession($PayPalOrder);
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');

        \Views\Renderer::render("paypal/checkout", $viewData);
    }

    public static function getData()
    {
        $data = Carrito::getCarretillaByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        return $data;
    }
    public static function getSession($PayPalOrder)
    {
        $xls = $_SESSION['xls'];
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $PayPalOrder->addItem(strval($productName), strval($productName) , strval($productId), floatval($productPrice),round(floatval($productPrice*0.15),2) , intval($productQuantity), "DIGITAL GOODS");                
            }
        }
       
    }
    public function addToDB(){
        $xls = $_SESSION['xls'];
        $total = 0.00; 
        $detail= "Purchased: ";  
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $total += $productPrice * $productQuantity; 
                $detail .= " {{$productName}} || {{$productQuantity}} || {{$productPrice}} || "; 
                Carrito::insertCarretilla($usercod, $productId, $productQuantity, $productPrice, Date('Y-M-D-H-i-s'));     
            }
        }
        return $total; 
        
    }

    public function addPurchase($payment){
        $xls = $_SESSION['xls'];
        $idFor = \Utilities\Functions::generateId("purchase");
        purchase::insertPurchase($idFor,Date('Y-m-d H:mm:ss'),self::addToDb(),"Purchase on skuull2canldy", $payment);
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                detail::insertPurchasedetail($idFor, $productId,$productQuantity, $productPrice); 
                 
            }
            
        }
       
    }
    
    public static function generateAddItem($data)
    {
        if (!\Utilities\Functions::isAnEmptyArray(($data))) {
            $data = implode("", $data);
            echo $data;
        } else {
            echo '<script>alert("NO data"); </script>';
        }
    }
}