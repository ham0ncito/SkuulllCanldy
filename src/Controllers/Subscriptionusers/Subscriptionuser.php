<?php

namespace Controllers\Subscriptionusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptionusers\Subscriptionusers as DAOSubscriptionuser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Subscriptionuser extends PrivateController
{
    private $usercod;
    private $id_subscription;
    private $purchase_date_subscription;
    private $purchase_date_end;
    private $status_subscription;

    public function run(): void
    {
        Site::addLink('subscriptionuser_style');
        $viewData['usercod'] = 'usercod';
        $viewData['id_subscription'] = 'id_subscription';
        $viewData['purchase_date_subscription'] = 'purchase_date_subscription';
        $viewData['purchase_date_end'] = 'purchase_date_end';
        $viewData['status_subscription'] = 'status_subscription';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['subscriptionuser'] = DAOSubscriptionuser::getSubscriptionuser())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }



        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("subscriptionusers/subscriptionuserlist", $viewData);
    }
}