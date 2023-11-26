<?php
namespace Controllers\Offers;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Offers\Offers as DAOOffer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Offer extends PublicController {
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
		$viewData['offer']= DAOOffer::getOffer();
        Renderer::render("offers/offerlist", $viewData);
    }
}
