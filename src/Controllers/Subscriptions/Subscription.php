<?php
namespace Controllers\Subscriptions;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptions\Subscriptions as DAOSubscription;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Subscription extends PrivateController {
  private $id_subscription;
  private $subscription_description;
  private $subscription_duration;
  private $subscription_price;

    public function run(): void
    {
        Site::addLink('subscription_style');
        $viewData['id_subscription'] = 'id_subscription';
		$viewData['subscription_description'] = 'subscription_description';
		$viewData['subscription_duration'] = 'subscription_duration';
		$viewData['subscription_price'] = 'subscription_price';
		$viewData['subscription']= DAOSubscription::getSubscription();
        Renderer::render("subscriptions/subscriptionlist", $viewData);
    }
}