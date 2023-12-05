<?php
namespace Controllers\Logusers;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logusers\Logusers as DAOLoguser;
use Utilities\Site;
use Utilities\Validators;
class Logusers extends PrivateController {
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
             if ($this->isPostBack()){
                 if($this->validateFormData()){
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
                    if($this->mode !== "INS") {
                        if (isset($_GET["user_cod"])){
                            $this->loguser = DAOLoguser::obtenerPorId(strval($_GET["user_cod"]));
                            if (!$this->loguser) {
                                $this->handleError("Oops, no sé encontro");
                              }
                        }
                    }
                } else {
                    $this->handleError("Oops, el programa no encuentra el modo solicitado, intente de nuevo");
                }
            } else {
                $this->handleError("Oops, el programa falló, intente de nuevo.");
            }
        }
		private function handleError($errMsg){
            Site::redirectToWithMsg($this->listUrl, $errMsg);
        }

		private function validateFormData(){
        if(isset($_POST["xss_token_loguser"])) {
            $this->xss_token_loguser = $_POST["xss_token_loguser"];
            if( $_SESSION["xss_token_loguser"] !== $this->xss_token_loguser) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["user_cod"])){
                 $this->error["user_cod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["log_cod"])){
                 $this->error["log_cod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["date"])){
                 $this->error["date_error"] = "Campo es requerido";
                }
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
           // $this->error["status_error"] = "Estado es inválido.";
       // } else {
          //  $this->error["status_error"] = ""; 
        //}
        
        return count($this->error) == 0;
    }

	private function processAction(){
        switch ($this->mode) {
            case 'INS':
               if ( DAOLoguser::insertLoguser(
                       $this -> loguser["user_cod"],
$this -> loguser["log_cod"],
$this -> loguser["date"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Loguser creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOLoguser::updateLoguser(
                    $this -> loguser["user_cod"],
$this -> loguser["log_cod"],
$this -> loguser["date"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Loguser actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOLoguser::deleteLoguser(
                    $this->loguser["user_cod"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Loguser eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["loguser"] = $this->loguser;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["loguser"][$this->loguser["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["loguser"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_loguser = md5("logusers_loguser".date('Ymdhisu'));
            $_SESSION["xss_token_loguser"] = $this->xss_token_loguser;
            $this->viewData["xss_token_loguser"] = $this->xss_token_loguser; 
        }
        

	private function render(){
            Renderer::render("logusers/loguserform", $this->viewData);
        }
}