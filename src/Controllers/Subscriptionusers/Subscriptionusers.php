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
Este fragmento de código PHP define una clase llamada Subscriptionusers dentro del espacio de nombres Controllers\Subscriptionusers. Aquí hay una descripción de lo que hace esta clase:
Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Subscriptionusers, lo que sugiere que esta clase se encarga de la lógica relacionada con los usuarios de suscripción en el sistema.

Clase Subscriptionusers: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accedidas solo por usuarios autenticados.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la clase, procesar los datos del formulario si se envía y preparar los datos de la vista antes de renderizarla.

Métodos init() y handleError(): init() inicializa la clase y maneja los posibles errores, redirigiendo al usuario a la URL especificada con un mensaje de error.

Método validateFormData(): Este método se encarga de validar los datos enviados a través del formulario. Comprueba si los campos obligatorios están vacíos y establece mensajes de error en consecuencia.

Método processAction(): Este método procesa la acción según el modo en el que se encuentra la clase (INS, UPD, DEL). Realiza operaciones como inserción, actualización o eliminación de usuarios de suscripción en la base de datos.

Método prepareViewData(): Este método prepara los datos de vista necesarios para renderizar el formulario de usuario de suscripción. Establece el modo, los datos del usuario de suscripción, mensajes de error, y tokens XSS para protección contra ataques CSRF.

Método render(): Este método renderiza la vista del formulario de usuario de suscripción utilizando el objeto Renderer. */
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
