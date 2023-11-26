<?php
namespace Controllers\Offersubscriptions;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Offersubscriptions\Offersubscriptions as DAOOffersubscription;
use Utilities\Site;
use Utilities\Validators;
class Offersubscriptions extends PublicController {
  private $id_offer;
  private $id_subscription;
  private $price_offer;
  private $offersubscription = [
	"id_offer" => "", 
		"id_subscription" => "", 
		"price_offer" => ""
];
	 private $listUrl = "index.php?page=Offersubscriptions_Offersubscription";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_offersubscription = '';
private $modes = [
            "INS" => "Creando nueva offersubscription",
            "UPD" => "Editando offersubscription",
            "DEL" => "Eliminando offersubscription",
            "DSP" => "Detalle offersubscription"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->offersubscription['id_offer'] = $_POST['id_offer'];
						     $this->offersubscription['id_subscription'] = $_POST['id_subscription'];
						     $this->offersubscription['price_offer'] = $_POST['price_offer'];
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
                            $this->offersubscription = DAOOffersubscription::obtenerPorId(strval($_GET["id_offer"]));
                            if (!$this->offersubscription) {
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
        if(isset($_POST["xss_token_offersubscription"])) {
            $this->xss_token_offersubscription = $_POST["xss_token_offersubscription"];
            if( $_SESSION["xss_token_offersubscription"] !== $this->xss_token_offersubscription) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["id_offer"])){
                 $this->error["id_offer_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["id_subscription"])){
                 $this->error["id_subscription_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["price_offer"])){
                 $this->error["price_offer_error"] = "Campo es requerido";
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
               if ( DAOOffersubscription::insertOffersubscription(
                       $this -> offersubscription["id_offer"],
$this -> offersubscription["id_subscription"],
$this -> offersubscription["price_offer"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Offersubscription creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOOffersubscription::updateOffersubscription(
                    $this -> offersubscription["id_offer"],
$this -> offersubscription["id_subscription"],
$this -> offersubscription["price_offer"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Offersubscription actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOOffersubscription::deleteOffersubscription(
                    $this->offersubscription["id_offer"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Offersubscription eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["offersubscription"] = $this->offersubscription;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["offersubscription"][$this->offersubscription["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["offersubscription"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_offersubscription = md5("offersubscriptions_offersubscription".date('Ymdhisu'));
            $_SESSION["xss_token_offersubscription"] = $this->xss_token_offersubscription;
            $this->viewData["xss_token_offersubscription"] = $this->xss_token_offersubscription; 
        }
        

	private function render(){
            Renderer::render("offersubscriptions/offersubscriptionform", $this->viewData);
        }
}