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

namespace Controllers\Lognonusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Lognonusers\Lognonusers as DAOLognonuser;
use Utilities\Site;
use Utilities\Validators;
/*Este fragmento de código PHP define un controlador llamado Lognonusers dentro del espacio de nombres Controllers\Lognonusers. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Lognonusers, lo que sugiere que se ocupa de la gestión de registros de usuarios no logueados.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Lognonusers del espacio de nombres Dao\Lognonusers para acceder a los registros de usuarios no logueados. También utiliza la clase PrivateController del mismo espacio de nombres y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar, procesar y preparar los datos para la vista, así como de renderizar la vista.

Inicialización y validación de datos: El método init() se encarga de inicializar el estado del controlador, mientras que el método validateFormData() valida los datos enviados a través del formulario.

Procesamiento de acciones: El método processAction() determina la acción a realizar */
class Lognonusers extends PrivateController
{
    private $id_logNonUser;
    private $log_date;
    private $id_cookie;
    private $log_cod;
    private $lognonuser = [
        "id_lognonuser" => "",
        "log_date" => "",
        "id_cookie" => "",
        "log_cod" => ""
    ];
    private $listUrl = "index.php?page=Lognonusers_Lognonuser";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_lognonuser = '';
    private $modes = [
        "INS" => "Creando nueva lognonuser",
        "UPD" => "Editando lognonuser",
        "DEL" => "Eliminando lognonuser",
        "DSP" => "Detalle lognonuser"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->lognonuser['id_lognonuser'] = $_POST['id_lognonuser'];
                $this->lognonuser['log_date'] = $_POST['log_date'];
                $this->lognonuser['id_cookie'] = $_POST['id_cookie'];
                $this->lognonuser['log_cod'] = $_POST['log_cod'];
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
                    if (isset($_GET["id_logNonUser"])) {
                        $this->lognonuser = DAOLognonuser::obtenerPorId(strval($_GET["id_logNonUser"]));
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
        if (isset($_POST["xss_token_lognonuser"])) {
            $this->xss_token_lognonuser = $_POST["xss_token_lognonuser"];
            if ($_SESSION["xss_token_lognonuser"] !== $this->xss_token_lognonuser) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_lognonuser"])) {
            $this->error["id_lognonuser_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["log_date"])) {
            $this->error["log_date_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_cookie"])) {
            $this->error["id_cookie_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["log_cod"])) {
            $this->error["log_cod_error"] = "Campo es requerido";
        }
       

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOLognonuser::insertLognonuser(
                    $this->lognonuser["id_lognonuser"],
                    $this->lognonuser["log_date"],
                    $this->lognonuser["id_cookie"],
                    $this->lognonuser["log_cod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Lognonuser creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOLognonuser::updateLognonuser(
                    $this->lognonuser["id_lognonuser"],
                    $this->lognonuser["log_date"],
                    $this->lognonuser["id_cookie"],
                    $this->lognonuser["log_cod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Lognonuser actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOLognonuser::deleteLognonuser(
                    $this->lognonuser["id_logNonUser"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Lognonuser eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["lognonuser"] = $this->lognonuser;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
        
        
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["lognonuser"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_lognonuser = md5("lognonusers_lognonuser" . date('Ymdhisu'));
        $_SESSION["xss_token_lognonuser"] = $this->xss_token_lognonuser;
        $this->viewData["xss_token_lognonuser"] = $this->xss_token_lognonuser;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("lognonusers/lognonuserform", $this->viewData);
    }
}