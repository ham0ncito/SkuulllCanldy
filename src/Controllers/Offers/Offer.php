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

namespace Controllers\Offers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offers\Offers as DAOOffer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Offer extends PrivateController
{
    private $id_offer;
    private $offer_description;
    private $offer_starts_at;
    private $offer_ends_at;
    private $offer_status;

    public function run(): void
    {
        Site::addLink('offer_style');
        $viewData['id_offer'] = 'id_offer';
        $viewData['offer_description'] = 'offer_description';
        $viewData['offer_starts_at'] = 'offer_starts_at';
        $viewData['offer_ends_at'] = 'offer_ends_at';
        $viewData['offer_status'] = 'offer_status';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['offer'] = DAOOffer::getOffer())) {
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
        Renderer::render("offers/offerlist", $viewData);
    }
}