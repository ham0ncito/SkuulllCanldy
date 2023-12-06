<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_error",
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_accept"
            );
            $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
            $PayPalOrder->addItem("Test 2", "TestItem2", "PRD2", 50, 7.5, 2, "DIGITAL_GOODS");
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>