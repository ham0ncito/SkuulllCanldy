<?php

namespace Controllers\Checkout;
Use Controllers\Checkout\Checkout as check; 
use Controllers\PublicController;
class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $_SESSION["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            check::addPurchase(json_encode($result, JSON_PRETTY_PRINT));
            $dataview['purchasedetails'] = check::getDetail(); 
            unset($_SESSION['cart'.$_SESSION['xls']]);
            unset($_SESSION['xls']);
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}

?>