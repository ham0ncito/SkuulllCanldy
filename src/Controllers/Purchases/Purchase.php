<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
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

namespace Controllers\Purchases;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as detail; 
use Dao\Purchases\Purchases as DAOPurchase;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Purchase extends PrivateController
{
    private $id_purchase;
    private $purchase_date;
    private $total;
    private $details;
    private $payments;

    public function run(): void
    {
        Site::addLink('purchase_style');
        $viewData['id_purchase'] = 'id_purchase';
        $viewData['purchase_date'] = 'purchase_date';
        $viewData['total'] = 'total';
        $viewData['details'] = 'details';
        $viewData['payments'] = 'payments';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['purchase'] = DAOPurchase::getPurchase())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
            if (\Utilities\Functions::isAnEmptyArray( $viewData['purchase'] = DAOPurchase::getPurchaseByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail'])))) {
                $viewData['isEmpty'] = true;
            } else {
             
                $viewData['isEmpty'] = false;
            }
           
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("purchases/purchaselist", $viewData);
    }
}