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
Este fragmento de código PHP define una clase llamada Subscriptions dentro del espacio de nombres Controllers\Subscriptions. Aquí tienes una descripción de lo que hace esta clase:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Subscriptions, lo que sugiere que esta clase se encarga de la lógica relacionada con las suscripciones en el sistema.

Clase Subscriptions: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accedidas solo por usuarios autenticados.

Propiedades de la clase:

$id_subscription, $subscription_description, $subscription_duration y $subscription_price: Son propiedades privadas que almacenan información sobre una suscripción.
$subscription: Es un array que contiene los datos de una suscripción, inicialmente vacío.
$listUrl: Es una cadena que representa la URL de la lista de suscripciones.
$mode: Es una cadena que indica el modo de operación actual (por defecto es "INS" para inserción).
$viewData: Es un array que almacenará los datos necesarios para renderizar la vista.
$error: Es un array que almacenará mensajes de error de validación de datos.
$xss_token_subscription: Es una cadena que contendrá un token para prevenir ataques XSS.
$modes: Es un array que mapea los modos de operación con sus descripciones.
Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase. Dentro de este método, se inicializan las propiedades, se procesa el envío del formulario, se preparan los datos de vista y se renderiza la vista.

Método init(): Este método privado se encarga de inicializar la clase, verificando el modo de operación y obteniendo los datos de la suscripción si es necesario.

Método handleError(): Este método privado redirige a la URL de la lista de suscripciones con un mensaje de error en caso de algún problema.

Método validateFormData(): Este método privado valida los datos enviados a través del formulario, verificando que los campos obligatorios no estén vacíos.

Método processAction(): Este método privado procesa la acción según el modo de operación actual (inserción, actualización o eliminación) utilizando los datos de la suscripción.

Método prepareViewData(): Este método privado prepara los datos necesarios para renderizar la vista, incluyendo los datos de la suscripción, mensajes de error, token XSS, etc.

Método render(): Este método privado renderiza la vista correspondiente utilizando el objeto Renderer. */
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