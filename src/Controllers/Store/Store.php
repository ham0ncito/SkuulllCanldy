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
use Utilities\Context;
use Utilities\Paging;

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
    private $productsSearch = [];
    private $productCount = 0;
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
    private $partialName = "";
    private $orderBy = "";
    private $orderDescending = false;
    private $pageNumber = 1;
    private $itemsPerPage = 10;
    private $pages = 0;
    private $listUrl = "index.php?page=Store_Store";
     
    public function run(): void
    {
        self::cart(); 
        $this->getParamsFromContext();//
        $this->getParams();//
        $tmpProducts = Products::getProductsBySearch(
            $this->partialName,
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );
        $this->productsSearch = $tmpProducts["productsSearch"];
        $this->productCount = $tmpProducts["total"];
        $this->setParamsToContext();
        $this->setParamsToDataView();
        $viewData["productsSearch"] = $this->productsSearch;
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'],'ADMIN'); 
        $viewData['Products'] = Products::getProducts();
        $phrase = "Conscious shopping is more than just a transaction; it's a mindful choice. It's about making informed decisions that go beyond price tags and brands. It involves supporting ethical practices, sustainable production, and considering the social and environmental impact of our purchases. Every buying decision we make has the power to shape a better world. Let's embrace conscious shopping to create a positive difference, one thoughtful purchase at a time.";
        for ($x = 0; $x < 100; $x++) {
            $random_number = mt_rand(0, 25);
            $phrase .= chr($random_number + ord('A'));
        }
      
        $this->viewData['token'] = md5($phrase . '' . date('Ymdhisu') . '');
        $viewData['Subscription'] = Subscription::getSubscription();

        $_SESSION['token'] = $this->viewData['token'];
        $this->viewData['tokenSub'] = md5($phrase . 'subscription' . date('Ymdhisu') . 'subscription');
        Renderer::render("store\store", $viewData);
    }

    static private function cart()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if ($_SESSION["token"] == $_POST["xsxtoken"]) {
                if (isset($_POST['addToCart'])) {
                    $xls = sec::decryptDatum($_SESSION['sesionId'][count($_SESSION['sesionId'])-1]);
                    if(!isset($_SESSION['cart'.$xls])){
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
                        $carrito = count($_SESSION['cart'.$xls])+1; 
                        $product = [
                            "usercod" => $xls,
                            "productid" => $_POST['productId'],
                            "productName" => $_POST['productName'],
                            "crrctd" => $_POST['productQuantity'],
                            "crrprc" =>$_POST['productPrice'],
                            "crrfching" => date("Y-m-d H:i:s")
                        ]; 
                        $_SESSION['cart'][$carrito] =$product;
                        Carretilla::insertCarretilla(sec::decryptDatum($_SESSION['sxnsjfnuVn']), $_POST['productId'],$_POST['productQuantity'],$_POST['productPrice'], date("Y-m-d H:i:s"));
                        echo '<script>alert("Producto Agregado");</script>';
                    }
                
                }
                if (isset($_POST['removeFromCart'])) {
    
                
                }
            } else{
                
            }
           
        }
    }

    private function getParams(): void
  {
    $this->partialName = isset($_GET["partialName"]) ? $_GET["partialName"] : $this->partialName;
    $this->orderBy = isset($_GET["orderBy"]) && in_array($_GET["orderBy"], [ "title_song", "duration", "clear"]) ? $_GET["orderBy"] : $this->orderBy;
    if ($this->orderBy === "clear") {
      $this->orderBy = "";
    }
    $this->orderDescending = isset($_GET["orderDescending"]) ? boolval($_GET["orderDescending"]) : $this->orderDescending;
    $this->pageNumber = isset($_GET["pageNum"]) ? intval($_GET["pageNum"]) : $this->pageNumber;
    $this->itemsPerPage = isset($_GET["itemsPerPage"]) ? intval($_GET["itemsPerPage"]) : $this->itemsPerPage;
  }

  private function getParamsFromContext(): void
  {
    $this->partialName = Context::getContextByKey("products_partialName");
    $this->orderBy = Context::getContextByKey("products_orderBy");
    $this->orderDescending = boolval(Context::getContextByKey("products_orderDescending"));
    $this->pageNumber = intval(Context::getContextByKey("products_page"));
    $this->itemsPerPage = intval(Context::getContextByKey("products_itemsPerPage"));
    if ($this->pageNumber < 1) $this->pageNumber = 1;
    if ($this->itemsPerPage < 1) $this->itemsPerPage = 10;
  }

  private function setParamsToContext(): void
  {
    Context::setContext("products_partialName", $this->partialName, true);
    Context::setContext("products_orderBy", $this->orderBy, true);
    Context::setContext("products_orderDescending", $this->orderDescending, true);
    Context::setContext("products_page", $this->pageNumber, true);
    Context::setContext("products_itemsPerPage", $this->productCount, true);
  }

  private function setParamsToDataView(): void
  {
    $this->viewData["partialName"] = $this->partialName;
    $this->viewData["orderBy"] = $this->orderBy;
    $this->viewData["orderDescending"] = $this->orderDescending;
    $this->viewData["pageNum"] = $this->pageNumber;
    $this->viewData["itemsPerPage"] = $this->productCount;
    $this->viewData["productCount"] = $this->productCount;
    $this->viewData["pages"] = $this->pages;
    $this->viewData["productsSearch"] = $this->productsSearch;
    if ($this->orderBy !== "") {
      $orderByKey = "Order" . ucfirst($this->orderBy);
      $orderByKeyNoOrder = "OrderBy" . ucfirst($this->orderBy);
      $this->viewData[$orderByKeyNoOrder] = true;
      if ($this->orderDescending) {
        $orderByKey .= "Desc";
      }
      $this->viewData[$orderByKey] = true;
    }
    $pagination = Paging::getPagination(
      $this->productCount,
      $this->itemsPerPage,
      $this->pageNumber,
      "index.php?page=Store_Store",
      "Store_Store"
    );
    $this->viewData["pagination"] = $pagination;
  }
}
