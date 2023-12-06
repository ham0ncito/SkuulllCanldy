<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Error extends PublicController
{
    public function run(): void
    {
        echo "error";
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        die();
    }
}

?>