<?php

namespace Controllers\Store;

use Controllers\PrivateController;
use Utilities\Site;
use Views\Renderer;
use Utilities\Secur\Crypt as sec; 
use DAO\Productss\Productss as Products;
use DAO\Carretillas\Carretillas as Carretilla;
use DAO\Subscriptions\Subscriptions as Subscription;
use Utilities\Validators;

class Store extends PrivateController
{
    private $id_subscription;
    private $subscription_description;
    private $subscription_duration;
    private $subscription_price;
    private $productId;
    private $productName;
    private $productDescription;
    private $productPrice;
    private $productImgUrl;
    private $productStock;
    private $productStatus;
    private $viewData = [];
    private $error = [];
    private $subscription = [
        "id_subscription" => "",
        "subscription_description" => "",
        "subscription_duration" => "",
        "subscription_price" => ""
    ];
    private $products = [
        "productid" => "",
        "productname" => "",
        "productdescription" => "",
        "productprice" => "",
        "productimgurl" => "",
        "productstock" => "",
        "productstatus" => ""
    ];
    private $carretilla = [
        "usercod" => "",
        "productid" => "",
        "crrctd" => "",
        "crrprc" => "",
        "crrfching" => ""
    ];
    private $listUrl = "index.php?page=Store_Store";
     
    public function run(): void
    {
        self::cart(); 
        $viewData['Products'] = Products::getProducts();
        $phrase = "Conscious shopping is more than just a transaction; it's a mindful choice. It's about making informed decisions that go beyond price tags and brands. It involves supporting ethical practices, sustainable production, and considering the social and environmental impact of our purchases. Every buying decision we make has the power to shape a better world. Let's embrace conscious shopping to create a positive difference, one thoughtful purchase at a time.";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }
      
        $this->viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $viewData['Subscription'] = Subscription::getSubscription();

        $_SESSION['token'] = $this->viewData['token'];
        $this->viewData['tokenSub'] = md5($phrase . 'subscription' . date('Ymdhisu') . 'subscriptio');
        Renderer::render("store\store", $viewData);
    }

    static private function cart()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["token"] == $_POST["xsx"]) {
                if (isset($_POST['addToCart'])) {
                    $xls = sec::decryptDatum($_SESSION[]);
                    if(!isset($_SESSION['cart'.''])){
                        $product = [
                            "usercod" => $xls,
                            "productid" => $_POST['productId'],
                            "productName" => $_POST['productName'],
                            "crrctd" => $_POST['productQuantity'],
                            "crrprc" =>$_POST['productPrice'],
                            "crrfching" => date("Y-m-d H:i:s")
                        ]; 
                        $_SESSION['cart'][0] = $product;
                        echo '<script>alert("Producto Agregado");</script>';
                    }else{
                        $carrito = count($_SESSION['cart'])+1; 
                        $product = [
                            "usercod" => $xls,
                            "productid" => $_POST['productId'],
                            "productName" => $_POST['productName'],
                            "crrctd" => $_POST['productQuantity'],
                            "crrprc" =>$_POST['productPrice'],
                            "crrfching" => date("Y-m-d H:i:s")
                        ]; 
                        $_SESSION['cart'][$carrito] =$product;
                        echo '<script>alert("Producto Agregado");</script>';
                    }
                
                }
                if (isset($_POST['removeFromCart'])) {
    
                
                }
            } else{
                
            }
           
        }
    }
}