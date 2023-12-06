<?php
namespace Controllers\Songauthorss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songauthorss\Songauthorss as DAOSongauthors;
use Utilities\Site;
use Utilities\Validators;
class Songauthorss extends PrivateController {
  private $artist_id;
  private $song_id;
  private $song_author_created_at;
  private $song_author_last_update_at;
  private $songauthors = [
	"artist_id" => "", 
		"song_id" => "", 
		"song_author_created_at" => "", 
		"song_author_last_update_at" => ""
];
	 private $listUrl = "index.php?page=Songauthorss_Songauthors";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_songauthors = '';
private $modes = [
            "INS" => "Creando nueva songauthors",
            "UPD" => "Editando songauthors",
            "DEL" => "Eliminando songauthors",
            "DSP" => "Detalle songauthors"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->songauthors['artist_id'] = $_POST['artist_id'];
						     $this->songauthors['song_id'] = $_POST['song_id'];
						     $this->songauthors['song_author_created_at'] = $_POST['song_author_created_at'];
						     $this->songauthors['song_author_last_update_at'] = $_POST['song_author_last_update_at'];
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
                        if (isset($_GET[""])){
                            $this->songauthors = DAOSongauthors::obtenerPorId(strval($_GET[""]));
                          
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
        if(isset($_POST["xss_token_songauthors"])) {
            $this->xss_token_songauthors = $_POST["xss_token_songauthors"];
            if( $_SESSION["xss_token_songauthors"] !== $this->xss_token_songauthors) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["artist_id"])){
                 $this->error["artist_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["song_id"])){
                 $this->error["song_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["song_author_created_at"])){
                 $this->error["song_author_created_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["song_author_last_update_at"])){
                 $this->error["song_author_last_update_at_error"] = "Campo es requerido";
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
               if ( DAOSongauthors::insertSongauthors(
                       $this -> songauthors["artist_id"],
$this -> songauthors["song_id"],
$this -> songauthors["song_author_created_at"],
$this -> songauthors["song_author_last_update_at"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Songauthors creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOSongauthors::updateSongauthors(
                    $this -> songauthors["artist_id"],
$this -> songauthors["song_id"],
$this -> songauthors["song_author_created_at"],
$this -> songauthors["song_author_last_update_at"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Songauthors actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOSongauthors::deleteSongauthors(
                    $this->songauthors[""]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Songauthors eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["songauthors"] = $this->songauthors;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["songauthors"][$this->songauthors["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["songauthors"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_songauthors = md5("songauthorss_songauthors".date('Ymdhisu'));
            $_SESSION["xss_token_songauthors"] = $this->xss_token_songauthors;
            $this->viewData["xss_token_songauthors"] = $this->xss_token_songauthors; 
        }
        

	private function render(){
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
            Renderer::render("songauthorss/songauthorsform", $this->viewData);
        }
}