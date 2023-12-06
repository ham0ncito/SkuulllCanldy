<?php
namespace Controllers\Purchases;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchases\Purchases as DAOPurchase;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Purchase extends PublicController {
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
		$viewData['purchase']= DAOPurchase::getPurchase();
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        Renderer::render("purchases/purchaselist", $viewData);
    }
}