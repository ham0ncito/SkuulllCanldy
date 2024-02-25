<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Subscriptions;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptions\Subscriptions as DAOSubscription;
use Utilities\Site;
use Utilities\Validators;

class Subscriptions extends PrivateController
{
    private $id_subscription;
    private $subscription_description;
    private $subscription_duration;
    private $subscription_price;
    private $subscription = [
        "id_subscription" => "",
        "subscription_description" => "",
        "subscription_duration" => "",
        "subscription_price" => ""
    ];
    private $listUrl = "index.php?page=Subscriptions_Subscription";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_subscription = '';
    private $modes = [
        "INS" => "Creando nueva subscription",
        "UPD" => "Editando subscription",
        "DEL" => "Eliminando subscription",
        "DSP" => "Detalle subscription"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->subscription['id_subscription'] = $_POST['id_subscription'];
                $this->subscription['subscription_description'] = $_POST['subscription_description'];
                $this->subscription['subscription_duration'] = $_POST['subscription_duration'];
                $this->subscription['subscription_price'] = $_POST['subscription_price'];
                $this->processAction();
            }
        }
        $this->prepareViewData();
        $this->render();
    }
    private function init()
    {
        if (isset($_GET["mode"])) {
            if (isset($this->modes[$_GET["mode"]])) {
                $this->mode = $_GET["mode"];
                if ($this->mode !== "INS") {
                    if (isset($_GET["id_subscription"])) {
                        $this->subscription = DAOSubscription::obtenerPorId(strval($_GET["id_subscription"]));
                    }
                }
            } else {
                $this->handleError("Oops, el programa no encuentra el modo solicitado, intente de nuevo");
            }
        } else {
            $this->handleError("Oops, el programa falló, intente de nuevo.");
        }
    }
    private function handleError($errMsg)
    {
        Site::redirectToWithMsg($this->listUrl, $errMsg);
    }

    private function validateFormData()
    {
        if (isset($_POST["xss_token_subscription"])) {
            $this->xss_token_subscription = $_POST["xss_token_subscription"];
            if ($_SESSION["xss_token_subscription"] !== $this->xss_token_subscription) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_subscription"])) {
            $this->error["id_subscription_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["subscription_description"])) {
            $this->error["subscription_description_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["subscription_duration"])) {
            $this->error["subscription_duration_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["subscription_price"])) {
            $this->error["subscription_price_error"] = "Campo es requerido";
        }


        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOSubscription::insertSubscription(
                    $this->subscription["id_subscription"],
                    $this->subscription["subscription_description"],
                    $this->subscription["subscription_duration"],
                    $this->subscription["subscription_price"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscription creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOSubscription::updateSubscription(
                    $this->subscription["id_subscription"],
                    $this->subscription["subscription_description"],
                    $this->subscription["subscription_duration"],
                    $this->subscription["subscription_price"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscription actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOSubscription::deleteSubscription(
                    $this->subscription["id_subscription"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscription eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["subscription"] = $this->subscription;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        }

        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["subscription"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_subscription = md5("subscriptions_subscription" . date('Ymdhisu'));
        $_SESSION["xss_token_subscription"] = $this->xss_token_subscription;
        $this->viewData["xss_token_subscription"] = $this->xss_token_subscription;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("subscriptions/subscriptionform", $this->viewData);
    }
}