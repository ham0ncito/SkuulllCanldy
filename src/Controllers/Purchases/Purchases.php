<?php

namespace Controllers\Purchases;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchases\Purchases as DAOPurchase;
use Utilities\Site;
use Utilities\Validators;

class Purchases extends PrivateController
{
    private $id_purchase;
    private $purchase_date;
    private $total;
    private $details;
    private $payments;
    private $purchase = [
        "id_purchase" => "",
        "purchase_date" => "",
        "total" => "",
        "details" => "",
        "payments" => ""
    ];
    private $listUrl = "index.php?page=Purchases_Purchase";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_purchase = '';
    private $modes = [
        "INS" => "Creando nueva purchase",
        "UPD" => "Editando purchase",
        "DEL" => "Eliminando purchase",
        "DSP" => "Detalle purchase"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->purchase['id_purchase'] = $_POST['id_purchase'];
                $this->purchase['purchase_date'] = $_POST['purchase_date'];
                $this->purchase['total'] = $_POST['total'];
                $this->purchase['details'] = $_POST['details'];
                $this->purchase['payments'] = $_POST['payments'];
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
                    if (isset($_GET["id_purchase"])) {
                        $this->purchase = DAOPurchase::obtenerPorId(strval($_GET["id_purchase"]));
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
        if (isset($_POST["xss_token_purchase"])) {
            $this->xss_token_purchase = $_POST["xss_token_purchase"];
            if ($_SESSION["xss_token_purchase"] !== $this->xss_token_purchase) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_purchase"])) {
            $this->error["id_purchase_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["purchase_date"])) {
            $this->error["purchase_date_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["total"])) {
            $this->error["total_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["details"])) {
            $this->error["details_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["payments"])) {
            $this->error["payments_error"] = "Campo es requerido";
        }
     
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOPurchase::insertPurchase(
                    $this->purchase["id_purchase"],
                    $this->purchase["purchase_date"],
                    $this->purchase["total"],
                    $this->purchase["details"],
                    $this->purchase["payments"], 
                    \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail'])
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Purchase creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOPurchase::updatePurchase(
                    $this->purchase["id_purchase"],
                    $this->purchase["purchase_date"],
                    $this->purchase["total"],
                    $this->purchase["details"],
                    $this->purchase["payments"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Purchase actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOPurchase::deletePurchase(
                    $this->purchase["id_purchase"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Purchase eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["purchase"] = $this->purchase;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["purchase"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_purchase = md5("purchases_purchase" . date('Ymdhisu'));
        $_SESSION["xss_token_purchase"] = $this->xss_token_purchase;
        $this->viewData["xss_token_purchase"] = $this->xss_token_purchase;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("purchases/purchaseform", $this->viewData);
    }
}