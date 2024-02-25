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

namespace Controllers\Logs;
/*Este fragmento de código PHP define un controlador llamado Logs dentro del espacio de nombres Controllers\Logs. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Logs, lo que sugiere que se ocupa de la gestión de logs.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Logs del espacio de nombres Dao\Logs para acceder a los logs. También utiliza la clase PrivateController del espacio de nombres Controllers y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar, procesar y preparar los datos para la vista, así como de renderizar la vista.

Inicialización de datos: El método init() inicializa los datos necesarios para la vista, como los códigos y descripciones de los logs.

Preparación de datos para la vista: Prepara los datos necesarios para renderizar la vista, incluyendo los datos de los logs y la información sobre los permisos de los usuarios.

Renderización de la vista: El método render() renderiza la plantilla de formulario de logs con los datos preparados para la vista. */
use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logs\Logs as DAOLog;
use Utilities\Site;
use Utilities\Validators;

class Logs extends PrivateController
{
    private $log_cod;
    private $log_description;
    private $log = [
        "log_cod" => "",
        "log_description" => ""
    ];
    private $listUrl = "index.php?page=Logs_Log";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_log = '';
    private $modes = [
        "INS" => "Creando nueva log",
        "UPD" => "Editando log",
        "DEL" => "Eliminando log",
        "DSP" => "Detalle log"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->log['log_cod'] = $_POST['log_cod'];
                $this->log['log_description'] = $_POST['log_description'];
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
                    if (isset($_GET[""])) {
                        $this->log = DAOLog::obtenerPorId(strval($_GET[""]));
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
        if (isset($_POST["xss_token_log"])) {
            $this->xss_token_log = $_POST["xss_token_log"];
            if ($_SESSION["xss_token_log"] !== $this->xss_token_log) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["log_cod"])) {
            $this->error["log_cod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["log_description"])) {
            $this->error["log_description_error"] = "Campo es requerido";
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
                if (DAOLog::insertLog(
                    $this->log["log_cod"],
                    $this->log["log_description"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Log creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOLog::updateLog(
                    $this->log["log_cod"],
                    $this->log["log_description"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Log actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOLog::deleteLog(
                    $this->log[""]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Log eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["log"] = $this->log;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
 
        
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["log"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_log = md5("logs_log" . date('Ymdhisu'));
        $_SESSION["xss_token_log"] = $this->xss_token_log;
        $this->viewData["xss_token_log"] = $this->xss_token_log;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("logs/logform", $this->viewData);
    }
}