<?php

namespace Controllers\Subscriptions;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptions\Subscriptions as DAOSubscription;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Subscription extends PrivateController
{
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
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['subscription'] = DAOSubscription::getSubscription())) {
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
        Renderer::render("subscriptions/subscriptionlist", $viewData);
    }
}