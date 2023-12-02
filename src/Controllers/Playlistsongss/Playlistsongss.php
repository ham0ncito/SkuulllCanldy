<?php
namespace Controllers\Playlistsongss;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlistsongss\Playlistsongss as DAOPlaylistsongs;
use Utilities\Site;
use Utilities\Validators;
class Playlistsongss extends PrivateController {
  private $playlist_id;
  private $song_id;
  private $playlistSong_added_at;
  private $playlistSong_status;
  private $playlistsongs = [
	"playlist_id" => "", 
		"song_id" => "", 
		"playlistsong_added_at" => "", 
		"playlistsong_status" => ""
];
	 private $listUrl = "index.php?page=Playlistsongss_Playlistsongs";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_playlistsongs = '';
private $modes = [
            "INS" => "Creando nueva playlistsongs",
            "UPD" => "Editando playlistsongs",
            "DEL" => "Eliminando playlistsongs",
            "DSP" => "Detalle playlistsongs"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->playlistsongs['playlist_id'] = $_POST['playlist_id'];
						     $this->playlistsongs['song_id'] = $_POST['song_id'];
						     $this->playlistsongs['playlistsong_added_at'] = $_POST['playlistsong_added_at'];
						     $this->playlistsongs['playlistsong_status'] = $_POST['playlistsong_status'];
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
                        if (isset($_GET["playlist_id"])){
                            $this->playlistsongs = DAOPlaylistsongs::obtenerPorId(strval($_GET["playlist_id"]));
                            if (!$this->playlistsongs) {
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
        if(isset($_POST["xss_token_playlistsongs"])) {
            $this->xss_token_playlistsongs = $_POST["xss_token_playlistsongs"];
            if( $_SESSION["xss_token_playlistsongs"] !== $this->xss_token_playlistsongs) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["playlist_id"])){
                 $this->error["playlist_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["song_id"])){
                 $this->error["song_id_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["playlistsong_added_at"])){
                 $this->error["playlistsong_added_at_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["playlistsong_status"])){
                 $this->error["playlistsong_status_error"] = "Campo es requerido";
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
               if ( DAOPlaylistsongs::insertPlaylistsongs(
                       $this -> playlistsongs["playlist_id"],
$this -> playlistsongs["song_id"],
$this -> playlistsongs["playlistsong_added_at"],
$this -> playlistsongs["playlistsong_status"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Playlistsongs creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOPlaylistsongs::updatePlaylistsongs(
                    $this -> playlistsongs["playlist_id"],
$this -> playlistsongs["song_id"],
$this -> playlistsongs["playlistsong_added_at"],
$this -> playlistsongs["playlistsong_status"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Playlistsongs actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOPlaylistsongs::deletePlaylistsongs(
                    $this->playlistsongs["playlist_id"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Playlistsongs eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["playlistsongs"] = $this->playlistsongs;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["playlistsongs"][$this->playlistsongs["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["playlistsongs"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_playlistsongs = md5("playlistsongss_playlistsongs".date('Ymdhisu'));
            $_SESSION["xss_token_playlistsongs"] = $this->xss_token_playlistsongs;
            $this->viewData["xss_token_playlistsongs"] = $this->xss_token_playlistsongs; 
        }
        

	private function render(){
            Renderer::render("playlistsongss/playlistsongsform", $this->viewData);
        }
}