<?php

namespace Controllers\Subscriptionusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptionusers\Subscriptionusers as DAOSubscriptionuser;
use Utilities\Site;
use Utilities\Validators;

class Subscriptionusers extends PrivateController
{
    private $usercod;
    private $id_subscription;
    private $purchase_date_subscription;
    private $purchase_date_end;
    private $status_subscription;
    private $subscriptionuser = [
        "usercod" => "",
        "id_subscription" => "",
        "purchase_date_subscription" => "",
        "purchase_date_end" => "",
        "status_subscription" => ""
    ];
    private $listUrl = "index.php?page=Subscriptionusers_Subscriptionuser";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_subscriptionuser = '';
    private $modes = [
        "INS" => "Creando nueva subscriptionuser",
        "UPD" => "Editando subscriptionuser",
        "DEL" => "Eliminando subscriptionuser",
        "DSP" => "Detalle subscriptionuser"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->subscriptionuser['usercod'] = $_POST['usercod'];
                $this->subscriptionuser['id_subscription'] = $_POST['id_subscription'];
                $this->subscriptionuser['purchase_date_subscription'] = $_POST['purchase_date_subscription'];
                $this->subscriptionuser['purchase_date_end'] = $_POST['purchase_date_end'];
                $this->subscriptionuser['status_subscription'] = $_POST['status_subscription'];
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
                    if (isset($_GET["usercod"])) {
                        $this->subscriptionuser = DAOSubscriptionuser::obtenerPorId(strval($_GET["usercod"]));
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
        if (isset($_POST["xss_token_subscriptionuser"])) {
            $this->xss_token_subscriptionuser = $_POST["xss_token_subscriptionuser"];
            if ($_SESSION["xss_token_subscriptionuser"] !== $this->xss_token_subscriptionuser) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["usercod"])) {
            $this->error["usercod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_subscription"])) {
            $this->error["id_subscription_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["purchase_date_subscription"])) {
            $this->error["purchase_date_subscription_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["purchase_date_end"])) {
            $this->error["purchase_date_end_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["status_subscription"])) {
            $this->error["status_subscription_error"] = "Campo es requerido";
        }
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
        // $this->error["status_error"] = "Estado es inválido.";
        // } else {
        //  $this->error["status_error"] = ""; 
        //}

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOSubscriptionuser::insertSubscriptionuser(
                    $this->subscriptionuser["usercod"],
                    $this->subscriptionuser["id_subscription"],
                    $this->subscriptionuser["purchase_date_subscription"],
                    $this->subscriptionuser["purchase_date_end"],
                    $this->subscriptionuser["status_subscription"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscriptionuser creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOSubscriptionuser::updateSubscriptionuser(
                    $this->subscriptionuser["usercod"],
                    $this->subscriptionuser["id_subscription"],
                    $this->subscriptionuser["purchase_date_subscription"],
                    $this->subscriptionuser["purchase_date_end"],
                    $this->subscriptionuser["status_subscription"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscriptionuser actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOSubscriptionuser::deleteSubscriptionuser(
                    $this->subscriptionuser["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Subscriptionuser eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["subscriptionuser"] = $this->subscriptionuser;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        }

        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["subscriptionuser"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_subscriptionuser = md5("subscriptionusers_subscriptionuser" . date('Ymdhisu'));
        $_SESSION["xss_token_subscriptionuser"] = $this->xss_token_subscriptionuser;
        $this->viewData["xss_token_subscriptionuser"] = $this->xss_token_subscriptionuser;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("subscriptionusers/subscriptionuserform", $this->viewData);
    }
}
