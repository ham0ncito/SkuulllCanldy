<?php
namespace Controllers\Store;

use Controllers\PublicController;
use Utilities\Site; 
use Views\Renderer;
use DAO\Productss\Productss as Products;
use DAO\Subscriptions\Subscriptions as Subscription;


class Store extends PublicController{
    public function run(): void
    {
        $viewData['Products'] = Products::getProducts();
        $viewData['Subscription'] = Subscription::getSubscription();
        Renderer::render("store\store", $viewData);
    }
}