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
                $PayPalOrder->addItem(strval($productName), strval($productName." purchased on  ".Date('HH-mm-ss')) , strval($productId), floatval($productPrice),round(floatval($productPrice*0.15),2) , intval($productQuantity), "DIGITAL_GOODS");                
            }
        }
       
    }
    public static function addToDB(){
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
                self::addToDetail($detail); 
               // Carrito::insertCarretilla($usercod, $productId, $productQuantity, $productPrice, Date('Y-M-D-H-i-s'));     
            }
        }
        $_SESSION['detailofPurchase'] = $detail;
        return $total; 
        
    }
    public static function getDetail()
    {
        $data = $_SESSION['detailofPurchase']; 
        unset($_SESSION['detailofPurchase']);
        return $data ;
    }
    public static function addToDetail($detail){
        return $detail.= $detail ."\n";  
    }


    public static function addPurchase($payment){
        $xls = $_SESSION['xls'];
        $idFor = \Utilities\Functions::generateId("purchase");
        purchase::insertPurchase($idFor,Date('Y-m-d H:mm:ss'),self::addToDb(),"Purchase on skuull2canldy", $payment,\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $type = $product['type'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                if (strval($type) == "subscription") {
                    $data = \Dao\Subscriptionusers\Subscriptionusers::getSubscriptionuserExist(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
                    if (!$data) {
                        $duration = \Dao\Subscriptions\Subscriptions::getDuration($productId);
                        $timestampActual = time();
                        $timestampResultado = $timestampActual + (intval($duration) * 24 * 60 * 60);                   
                        $dateend = date('Y-m-d', $timestampResultado); 
                        \Dao\Subscriptionusers\Subscriptionusers::insertSubscriptionuser(
                            \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']),
                            $productId,
                            $timestampActual,
                            $dateend,
                            'ACT'
                        );
                    }else{
                        $duration = \Dao\Subscriptions\Subscriptions::getDuration($productId);
                        $timestampActual = time();
                        $timestampGuardado = \Dao\Subscriptionusers\Subscriptionusers::getSubscriptionuserEnds(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        
                        $duracionEnSegundos = intval($duration) * 24 * 60 * 60; 
                        $nuevoTimestamp = intval($timestampGuardado) + $duracionEnSegundos;
        
                        $fechaResultado = date('Y-m-d H:i:s', $nuevoTimestamp);
                        
                        
                        \Dao\Subscriptionusers\Subscriptionusers::updateSubscriptionuser(
                            \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']),
                            $productId,
                            $timestampActual,
                            $fechaResultado,
                            'ACT'                 
                        );
                    }
                } else {
                    detail::insertPurchasedetail($idFor, $productId, $productQuantity, $productPrice); 
                }
                
            
            }}
       
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