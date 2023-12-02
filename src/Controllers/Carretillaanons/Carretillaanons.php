<?php
namespace Controllers\Carretillaanons;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillaanons\Carretillaanons as DAOCarretillaanon;
use Utilities\Site;
use Utilities\Validators;
class Carretillaanons extends PrivateController {
  private $anoncod;
  private $productId;
  private $crrctd;
  private $crrprc;
  private $crrfching;
  private $carretillaanon = [
	"anoncod" => "", 
		"productid" => "", 
		"crrctd" => "", 
		"crrprc" => "", 
		"crrfching" => ""
];
	 private $listUrl = "index.php?page=Carretillaanons_Carretillaanon";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_carretillaanon = '';
private $modes = [
            "INS" => "Creando nueva carretillaanon",
            "UPD" => "Editando carretillaanon",
            "DEL" => "Eliminando carretillaanon",
            "DSP" => "Detalle carretillaanon"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->carretillaanon['anoncod'] = $_POST['anoncod'];
						     $this->carretillaanon['productid'] = $_POST['productid'];
						     $this->carretillaanon['crrctd'] = $_POST['crrctd'];
						     $this->carretillaanon['crrprc'] = $_POST['crrprc'];
						     $this->carretillaanon['crrfching'] = $_POST['crrfching'];
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
                        if (isset($_GET["anoncod"])){
                            $this->carretillaanon = DAOCarretillaanon::obtenerPorId(strval($_GET["anoncod"]));
                            if (!$this->carretillaanon) {
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
        if(isset($_POST["xss_token_carretillaanon"])) {
            $this->xss_token_carretillaanon = $_POST["xss_token_carretillaanon"];
            if( $_SESSION["xss_token_carretillaanon"] !== $this->xss_token_carretillaanon) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["anoncod"])){
                 $this->error["anoncod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["productid"])){
                 $this->error["productid_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["crrctd"])){
                 $this->error["crrctd_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["crrprc"])){
                 $this->error["crrprc_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["crrfching"])){
                 $this->error["crrfching_error"] = "Campo es requerido";
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
               if ( DAOCarretillaanon::insertCarretillaanon(
                       $this -> carretillaanon["anoncod"],
$this -> carretillaanon["productid"],
$this -> carretillaanon["crrctd"],
$this -> carretillaanon["crrprc"],
$this -> carretillaanon["crrfching"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Carretillaanon creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOCarretillaanon::updateCarretillaanon(
                    $this -> carretillaanon["anoncod"],
$this -> carretillaanon["productid"],
$this -> carretillaanon["crrctd"],
$this -> carretillaanon["crrprc"],
$this -> carretillaanon["crrfching"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Carretillaanon actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOCarretillaanon::deleteCarretillaanon(
                    $this->carretillaanon["anoncod"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Carretillaanon eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["carretillaanon"] = $this->carretillaanon;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["carretillaanon"][$this->carretillaanon["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["carretillaanon"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_carretillaanon = md5("carretillaanons_carretillaanon".date('Ymdhisu'));
            $_SESSION["xss_token_carretillaanon"] = $this->xss_token_carretillaanon;
            $this->viewData["xss_token_carretillaanon"] = $this->xss_token_carretillaanon; 
        }
        

	private function render(){
            Renderer::render("carretillaanons/carretillaanonform", $this->viewData);
        }
}