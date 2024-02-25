<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Offersubscriptions;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offersubscriptions\Offersubscriptions as DAOOffersubscription;
use Utilities\Site;
use Utilities\Validators;

class Offersubscriptions extends PrivateController
{
    private $id_offer;
    private $id_subscription;
    private $price_offer;
    private $offersubscription = [
        "id_offer" => "",
        "id_subscription" => "",
        "price_offer" => ""
    ];
    private $listUrl = "index.php?page=Offersubscriptions_Offersubscription";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_offersubscription = '';
    private $modes = [
        "INS" => "Creando nueva offersubscription",
        "UPD" => "Editando offersubscription",
        "DEL" => "Eliminando offersubscription",
        "DSP" => "Detalle offersubscription"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->offersubscription['id_offer'] = $_POST['id_offer'];
                $this->offersubscription['id_subscription'] = $_POST['id_subscription'];
                $this->offersubscription['price_offer'] = $_POST['price_offer'];
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
                    if (isset($_GET["id_offer"])) {
                        $this->offersubscription = DAOOffersubscription::obtenerPorId(strval($_GET["id_offer"]));
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
        if (isset($_POST["xss_token_offersubscription"])) {
            $this->xss_token_offersubscription = $_POST["xss_token_offersubscription"];
            if ($_SESSION["xss_token_offersubscription"] !== $this->xss_token_offersubscription) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_offer"])) {
            $this->error["id_offer_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_subscription"])) {
            $this->error["id_subscription_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["price_offer"])) {
            $this->error["price_offer_error"] = "Campo es requerido";
        }
       
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOOffersubscription::insertOffersubscription(
                    $this->offersubscription["id_offer"],
                    $this->offersubscription["id_subscription"],
                    $this->offersubscription["price_offer"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Offersubscription creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOOffersubscription::updateOffersubscription(
                    $this->offersubscription["id_offer"],
                    $this->offersubscription["id_subscription"],
                    $this->offersubscription["price_offer"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Offersubscription actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOOffersubscription::deleteOffersubscription(
                    $this->offersubscription["id_offer"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Offersubscription eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["offersubscription"] = $this->offersubscription;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
       
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["offersubscription"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_offersubscription = md5("offersubscriptions_offersubscription" . date('Ymdhisu'));
        $_SESSION["xss_token_offersubscription"] = $this->xss_token_offersubscription;
        $this->viewData["xss_token_offersubscription"] = $this->xss_token_offersubscription;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("offersubscriptions/offersubscriptionform", $this->viewData);
    }
}