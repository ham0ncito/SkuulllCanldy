<?php
namespace Controllers\Offers;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offers\Offers as DAOOffer;
use Utilities\Site;
use Utilities\Validators;
class Offers extends PrivateController {
  private $id_offer;
  private $offer_description;
  private $offer_starts_at;
  private $offer_ends_at;
  private $offer_status;
  private $offer = [
	"id_offer" => "", 
		"offer_description" => "", 
		"offer_starts_at" => "", 
		"offer_ends_at" => "", 
		"offer_status" => ""
];
	 private $listUrl = "index.php?page=Offers_Offer";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_offer = '';
private $modes = [
            "INS" => "Creando nueva offer",
            "UPD" => "Editando offer",
            "DEL" => "Eliminando offer",
            "DSP" => "Detalle offer"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->offer['id_offer'] = $_POST['id_offer'];
						     $this->offer['offer_description'] = $_POST['offer_description'];
						     $this->offer['offer_starts_at'] = $_POST['offer_starts_at'];
						     $this->offer['offer_ends_at'] = $_POST['offer_ends_at'];
						     $this->offer['offer_status'] = $_POST['offer_status'];
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
                        if (isset($_GET["id_offer"])){
                            $this->offer = DAOOffer::obtenerPorId(strval($_GET["id_offer"]));
                          
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
        if(isset($_POST["xss_token_offer"])) {
            $this->xss_token_offer = $_POST["xss_token_offer"];
            if( $_SESSION["xss_token_offer"] !== $this->xss_token_offer) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["id_offer"])){
                 $this->error["id_offer_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["offer_description"])){
                 $this->error["offer_description_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["offer_starts_at"])){
                 $this->error["offer_starts_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["offer_ends_at"])){
                 $this->error["offer_ends_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["offer_status"])){
                 $this->error["offer_status_error"] = "Campo es requerido";
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
               if ( DAOOffer::insertOffer(
                       $this -> offer["id_offer"],
$this -> offer["offer_description"],
$this -> offer["offer_starts_at"],
$this -> offer["offer_ends_at"],
$this -> offer["offer_status"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Offer creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOOffer::updateOffer(
                    $this -> offer["id_offer"],
$this -> offer["offer_description"],
$this -> offer["offer_starts_at"],
$this -> offer["offer_ends_at"],
$this -> offer["offer_status"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Offer actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOOffer::deleteOffer(
                    $this->offer["id_offer"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Offer eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["offer"] = $this->offer;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["offer"][$this->offer["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["offer"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_offer = md5("offers_offer".date('Ymdhisu'));
            $_SESSION["xss_token_offer"] = $this->xss_token_offer;
            $this->viewData["xss_token_offer"] = $this->xss_token_offer; 
        }
        

	private function render(){
            Renderer::render("offers/offerform", $this->viewData);
        }
}