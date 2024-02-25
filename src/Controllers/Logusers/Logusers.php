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

namespace Controllers\Logusers;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logusers\Logusers as DAOLoguser;
use Utilities\Site;
use Utilities\Validators;

class Logusers extends PrivateController
{
    private $user_cod;
    private $log_cod;
    private $date;
    private $loguser = [
        "user_cod" => "",
        "log_cod" => "",
        "date" => ""
    ];
    private $listUrl = "index.php?page=Logusers_Loguser";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_loguser = '';
    private $modes = [
        "INS" => "Creando nueva loguser",
        "UPD" => "Editando loguser",
        "DEL" => "Eliminando loguser",
        "DSP" => "Detalle loguser"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->loguser['user_cod'] = $_POST['user_cod'];
                $this->loguser['log_cod'] = $_POST['log_cod'];
                $this->loguser['date'] = $_POST['date'];
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
                    if (isset($_GET["user_cod"])) {
                        $this->loguser = DAOLoguser::obtenerPorId(strval($_GET["user_cod"]));
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
        if (isset($_POST["xss_token_loguser"])) {
            $this->xss_token_loguser = $_POST["xss_token_loguser"];
            if ($_SESSION["xss_token_loguser"] !== $this->xss_token_loguser) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["user_cod"])) {
            $this->error["user_cod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["log_cod"])) {
            $this->error["log_cod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["date"])) {
            $this->error["date_error"] = "Campo es requerido";
        }
   
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOLoguser::insertLoguser(
                    $this->loguser["user_cod"],
                    $this->loguser["log_cod"],
                    $this->loguser["date"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Loguser creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOLoguser::updateLoguser(
                    $this->loguser["user_cod"],
                    $this->loguser["log_cod"],
                    $this->loguser["date"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Loguser actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOLoguser::deleteLoguser(
                    $this->loguser["user_cod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Loguser eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["loguser"] = $this->loguser;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
      
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["loguser"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_loguser = md5("logusers_loguser" . date('Ymdhisu'));
        $_SESSION["xss_token_loguser"] = $this->xss_token_loguser;
        $this->viewData["xss_token_loguser"] = $this->xss_token_loguser;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("logusers/loguserform", $this->viewData);
    }
}