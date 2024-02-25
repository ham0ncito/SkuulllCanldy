<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Productss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Productss\Productss as DAOProducts;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Products extends PrivateController
{
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
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['products'] = DAOProducts::getProducts())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("productss/productslist", $viewData);
    }
}