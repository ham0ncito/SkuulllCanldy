<?php
namespace Controllers\Highligthsplaylists;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthsplaylists\Highligthsplaylists as DAOHighligthsplaylist;
use Utilities\Site;
use Utilities\Validators;
class Highligthsplaylists extends PrivateController {
  private $highligths_id;
  private $playlist_id;
  private $highligths_description;
  private $highligthsplaylist = [
	"highligths_id" => "", 
		"playlist_id" => "", 
		"highligths_description" => ""
];
	 private $listUrl = "index.php?page=Highligthsplaylists_Highligthsplaylist";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_highligthsplaylist = '';
private $modes = [
            "INS" => "Creando nueva highligthsplaylist",
            "UPD" => "Editando highligthsplaylist",
            "DEL" => "Eliminando highligthsplaylist",
            "DSP" => "Detalle highligthsplaylist"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->highligthsplaylist['highligths_id'] = $_POST['highligths_id'];
						     $this->highligthsplaylist['playlist_id'] = $_POST['playlist_id'];
						     $this->highligthsplaylist['highligths_description'] = $_POST['highligths_description'];
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
                            $this->highligthsplaylist = DAOHighligthsplaylist::obtenerPorId(strval($_GET["highligths_id"]));
                          
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
        if(isset($_POST["xss_token_highligthsplaylist"])) {
            $this->xss_token_highligthsplaylist = $_POST["xss_token_highligthsplaylist"];
            if( $_SESSION["xss_token_highligthsplaylist"] !== $this->xss_token_highligthsplaylist) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["highligths_id"])){
                 $this->error["highligths_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["playlist_id"])){
                 $this->error["playlist_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["highligths_description"])){
                 $this->error["highligths_description_error"] = "Campo es requerido";
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
               if ( DAOHighligthsplaylist::insertHighligthsplaylist(
                       $this -> highligthsplaylist["highligths_id"],
$this -> highligthsplaylist["playlist_id"],
$this -> highligthsplaylist["highligths_description"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOHighligthsplaylist::updateHighligthsplaylist(
                    $this -> highligthsplaylist["highligths_id"],
$this -> highligthsplaylist["playlist_id"],
$this -> highligthsplaylist["highligths_description"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOHighligthsplaylist::deleteHighligthsplaylist(
                    $this->highligthsplaylist["highligths_id"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["highligthsplaylist"] = $this->highligthsplaylist;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["highligthsplaylist"][$this->highligthsplaylist["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["highligthsplaylist"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_highligthsplaylist = md5("highligthsplaylists_highligthsplaylist".date('Ymdhisu'));
            $_SESSION["xss_token_highligthsplaylist"] = $this->xss_token_highligthsplaylist;
            $this->viewData["xss_token_highligthsplaylist"] = $this->xss_token_highligthsplaylist; 
        }
        

	private function render(){
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
            Renderer::render("highligthsplaylists/highligthsplaylistform", $this->viewData);
        }
}