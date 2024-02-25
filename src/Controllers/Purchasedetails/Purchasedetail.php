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
namespace Controllers\Purchasedetails;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as DAOPurchasedetail;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Purchasedetail extends PrivateController {
  private $id_purchase;
  private $id_item_reference;
  private $quantity;
  private $unitary_price;

    public function run(): void
    {
        Site::addLink('purchasedetail_style');
        $viewData['id_purchase'] = 'id_purchase';
		$viewData['id_item_reference'] = 'id_item_reference';
		$viewData['quantity'] = 'quantity';
		$viewData['unitary_price'] = 'unitary_price';
		$viewData['purchasedetail']= DAOPurchasedetail::getPurchasedetail();
        Renderer::render("purchasedetails/purchasedetaillist", $viewData);
    }
}