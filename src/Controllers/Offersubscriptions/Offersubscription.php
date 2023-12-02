<?php
namespace Controllers\Offersubscriptions;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offersubscriptions\Offersubscriptions as DAOOffersubscription;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Offersubscription extends PrivateController {
  private $id_offer;
  private $id_subscription;
  private $price_offer;

    public function run(): void
    {
        Site::addLink('offersubscription_style');
        $viewData['id_offer'] = 'id_offer';
		$viewData['id_subscription'] = 'id_subscription';
		$viewData['price_offer'] = 'price_offer';
		$viewData['offersubscription']= DAOOffersubscription::getOffersubscription();
        Renderer::render("offersubscriptions/offersubscriptionlist", $viewData);
    }
}