<?php
namespace Controllers\Productss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Productss\Productss as DAOProducts;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Products extends PrivateController {
  private $productId;
  private $productName;
  private $productDescription;
  private $productPrice;
  private $productImgUrl;
  private $productStock;
  private $productStatus;

    public function run(): void
    {
        Site::addLink('products_style');
        $viewData['productId'] = 'productId';
		$viewData['productName'] = 'productName';
		$viewData['productDescription'] = 'productDescription';
		$viewData['productPrice'] = 'productPrice';
		$viewData['productImgUrl'] = 'productImgUrl';
		$viewData['productStock'] = 'productStock';
		$viewData['productStatus'] = 'productStatus';
		$viewData['products']= DAOProducts::getProducts();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        Renderer::render("productss/productslist", $viewData);
    }
}