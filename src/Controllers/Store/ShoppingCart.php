<?php
namespace Controllers\Store;

use Controllers\PrivateController;
use Controllers\PublicController;
use Utilities\Site; 
use Views\Renderer;
use DAO\Carretillas\Carretillas as Carretilla; 

class ShoppingCart extends PrivateController{
    public function run(): void
    {
        $viewData = array(); 
        Renderer::render("store\cart", $viewData);
    }
}