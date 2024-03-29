<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/*
Este archivo PHP define una clase llamada Purchases dentro del espacio de nombres Controllers\Purchases. Aquí está un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Purchases, lo que sugiere que esta clase se encarga de la lógica relacionada con las compras.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Controllers\PublicController, Views\Renderer, Dao\Purchases\Purchases, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con una compra, como el ID de compra (id_purchase), la fecha de compra (purchase_date), el total (total), los detalles (details) y los pagos (payments).

Inicialización y validación de datos: El método run() se encarga de inicializar la acción, validar los datos del formulario y procesar la acción correspondiente (insertar, actualizar o eliminar una compra).

Preparación de datos para la vista: Se preparan los datos necesarios para la vista, como el ID de compra, la fecha de compra, el total, los detalles y los pagos, así como indicadores de modos de operación y errores de validación.

Procesamiento de la acción: Dependiendo del modo de operación (INS, UPD, DEL), se realiza la acción correspondiente utilizando los métodos proporcionados por la clase DAOPurchase.

Renderización de la vista: Se renderiza la vista purchases/purchaseform con los datos preparados. */
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
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("purchases/purchaseform", $this->viewData);
    }
}