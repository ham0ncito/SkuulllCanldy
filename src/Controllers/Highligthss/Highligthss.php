<?php
namespace Controllers\Highligthss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthss\Highligthss as DAOHighligths;
use Utilities\Site;
use Utilities\Validators;
class Highligthss extends PrivateController {
  private $highligths_id;
  private $highligths_starts_at;
  private $highligths_ends_at;
  private $highligths_time;
  private $highligths = [
	"highligths_id" => "", 
		"highligths_starts_at" => "", 
		"highligths_ends_at" => "", 
		"highligths_time" => ""
];
	 private $listUrl = "index.php?page=Highligthss_Highligths";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_highligths = '';
private $modes = [
            "INS" => "Creando nueva highligths",
            "UPD" => "Editando highligths",
            "DEL" => "Eliminando highligths",
            "DSP" => "Detalle highligths"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->highligths['highligths_id'] = $_POST['highligths_id'];
						     $this->highligths['highligths_starts_at'] = $_POST['highligths_starts_at'];
						     $this->highligths['highligths_ends_at'] = $_POST['highligths_ends_at'];
						     $this->highligths['highligths_time'] = $_POST['highligths_time'];
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
                        if (isset($_GET["highligths_id"])){
                            $this->highligths = DAOHighligths::obtenerPorId(strval($_GET["highligths_id"]));
                           
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
        if(isset($_POST["xss_token_highligths"])) {
            $this->xss_token_highligths = $_POST["xss_token_highligths"];
            if( $_SESSION["xss_token_highligths"] !== $this->xss_token_highligths) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["highligths_id"])){
                 $this->error["highligths_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["highligths_starts_at"])){
                 $this->error["highligths_starts_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["highligths_ends_at"])){
                 $this->error["highligths_ends_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["highligths_time"])){
                 $this->error["highligths_time_error"] = "Campo es requerido";
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
               if ( DAOHighligths::insertHighligths(
                       $this -> highligths["highligths_id"],
$this -> highligths["highligths_starts_at"],
$this -> highligths["highligths_ends_at"],
$this -> highligths["highligths_time"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Highligths creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOHighligths::updateHighligths(
                    $this -> highligths["highligths_id"],
$this -> highligths["highligths_starts_at"],
$this -> highligths["highligths_ends_at"],
$this -> highligths["highligths_time"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Highligths actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOHighligths::deleteHighligths(
                    $this->highligths["highligths_id"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Highligths eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["highligths"] = $this->highligths;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["highligths"][$this->highligths["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["highligths"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_highligths = md5("highligthss_highligths".date('Ymdhisu'));
            $_SESSION["xss_token_highligths"] = $this->xss_token_highligths;
            $this->viewData["xss_token_highligths"] = $this->xss_token_highligths; 
        }
        

	private function render(){
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
            Renderer::render("highligthss/highligthsform", $this->viewData);
        }
}