<?php
namespace Controllers\Favoritess;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Favoritess\Favoritess as DAOFavorites;
use Utilities\Site;
use Utilities\Validators;
class Favoritess extends PrivateController {
  private $id_favorite;
  private $usercod;
  private $id_reference;
  private $type_favorite;
  private $favorites = [
	"id_favorite" => "", 
		"usercod" => "", 
		"id_reference" => "", 
		"type_favorite" => ""
];
	 private $listUrl = "index.php?page=Favoritess_Favorites";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_favorites = '';
private $modes = [
            "INS" => "Creando nueva favorites",
            "UPD" => "Editando favorites",
            "DEL" => "Eliminando favorites",
            "DSP" => "Detalle favorites"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->favorites['id_favorite'] = $_POST['id_favorite'];
						     $this->favorites['usercod'] = $_POST['usercod'];
						     $this->favorites['id_reference'] = $_POST['id_reference'];
						     $this->favorites['type_favorite'] = $_POST['type_favorite'];
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
                        if (isset($_GET["id_favorite"])){
                            $this->favorites = DAOFavorites::obtenerPorId(strval($_GET["id_favorite"]));
                            if (!$this->favorites) {
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
        if(isset($_POST["xss_token_favorites"])) {
            $this->xss_token_favorites = $_POST["xss_token_favorites"];
            if( $_SESSION["xss_token_favorites"] !== $this->xss_token_favorites) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["id_favorite"])){
                 $this->error["id_favorite_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["usercod"])){
                 $this->error["usercod_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["id_reference"])){
                 $this->error["id_reference_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["type_favorite"])){
                 $this->error["type_favorite_error"] = "Campo es requerido";
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
               if ( DAOFavorites::insertFavorites(
                       $this -> favorites["id_favorite"],
$this -> favorites["usercod"],
$this -> favorites["id_reference"],
$this -> favorites["type_favorite"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Favorites creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOFavorites::updateFavorites(
                    $this -> favorites["id_favorite"],
$this -> favorites["usercod"],
$this -> favorites["id_reference"],
$this -> favorites["type_favorite"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Favorites actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOFavorites::deleteFavorites(
                    $this->favorites["id_favorite"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Favorites eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["favorites"] = $this->favorites;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["favorites"][$this->favorites["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["favorites"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_favorites = md5("favoritess_favorites".date('Ymdhisu'));
            $_SESSION["xss_token_favorites"] = $this->xss_token_favorites;
            $this->viewData["xss_token_favorites"] = $this->xss_token_favorites; 
        }
        

	private function render(){
            Renderer::render("favoritess/favoritesform", $this->viewData);
        }
}