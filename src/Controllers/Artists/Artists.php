<?php
namespace Controllers\Artists;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Artists\Artists as DAOArtist;
use Utilities\Site;
use Utilities\Validators;
class Artists extends PublicController {
  private $id_artist;
  private $name_artist;
  private $image_artist;
  private $date_of_birth_artist;
  private $country_artist;
  private $status_artist;
  private $artist_bio;
  private $artist = [
	"id_artist" => "", 
		"name_artist" => "", 
		"image_artist" => "", 
		"date_of_birth_artist" => "", 
		"country_artist" => "", 
		"status_artist" => "", 
		"artist_bio" => ""
];
	 private $listUrl = "index.php?page=Artists_Artist";
	 private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_artist = '';
private $modes = [
            "INS" => "Creando nueva artist",
            "UPD" => "Editando artist",
            "DEL" => "Eliminando artist",
            "DSP" => "Detalle artist"
        ];

        public function run(): void
        {
            $this->init();
             if ($this->isPostBack()){
                 if($this->validateFormData()){
						     $this->artist['id_artist'] = $_POST['id_artist'];
						     $this->artist['name_artist'] = $_POST['name_artist'];
						     $this->artist['image_artist'] = $_POST['image_artist'];
						     $this->artist['date_of_birth_artist'] = $_POST['date_of_birth_artist'];
						     $this->artist['country_artist'] = $_POST['country_artist'];
						     $this->artist['status_artist'] = $_POST['status_artist'];
						     $this->artist['artist_bio'] = $_POST['artist_bio'];
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
                        if (isset($_GET["id_artist"])){
                            $this->artist = DAOArtist::obtenerPorId(strval($_GET["id_artist"]));
                            if (!$this->artist) {
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
        if(isset($_POST["xss_token_artist"])) {
            $this->xss_token_artist = $_POST["xss_token_artist"];
            if( $_SESSION["xss_token_artist"] !== $this->xss_token_artist) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }if(Validators::IsEmpty($_POST["id_artist"])){
                 $this->error["id_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["name_artist"])){
                 $this->error["name_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["image_artist"])){
                 $this->error["image_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["date_of_birth_artist"])){
                 $this->error["date_of_birth_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["country_artist"])){
                 $this->error["country_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["status_artist"])){
                 $this->error["status_artist_error"] = "Campo es requerido";
                }if(Validators::IsEmpty($_POST["artist_bio"])){
                 $this->error["artist_bio_error"] = "Campo es requerido";
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
               if ( DAOArtist::insertArtist(
                       $this -> artist["id_artist"],
$this -> artist["name_artist"],
$this -> artist["image_artist"],
$this -> artist["date_of_birth_artist"],
$this -> artist["country_artist"],
$this -> artist["status_artist"],
$this -> artist["artist_bio"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Artist creada exitosamente.");
                } else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if ( DAOArtist::updateArtist(
                    $this -> artist["id_artist"],
$this -> artist["name_artist"],
$this -> artist["image_artist"],
$this -> artist["date_of_birth_artist"],
$this -> artist["country_artist"],
$this -> artist["status_artist"],
$this -> artist["artist_bio"]
                    )
                ) {
                    Site::redirectToWithMsg($this->listUrl, "Artist actualizada exitosamente.");
                }else
                {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if ( DAOArtist::deleteArtist(
                    $this->artist["id_artist"]
                )
            ) {
                Site::redirectToWithMsg($this->listUrl, "Artist eliminada exitosamente.");
            }else
            {
                Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
            }
                break;
        }
    }
      

	 private function prepareViewData(){
            $this->viewData["mode"] = $this->mode;
            $this->viewData["artist"] = $this->artist;
            if ($this->mode == "INS") {
                $this->viewData["modedsc"] = $this->modes[$this->mode];
            } else {
                //$this->viewData["modedsc"] = sprintf(
                   // $this->modes[$this->mode], 
                //);
            }
            //$this->viewData["artist"][$this->artist["status"]."_selected"] = 'selected';
            foreach ($this->error as $key => $error) {
                if ($error !== null) {
                    $this->viewData["artist"][$key] = $error;
                }
            }
            $this->viewData["readonly"] = in_array($this->mode, ["DSP","DEL"]) ? 'readonly': '';
            $this->viewData["showConfirm"] = $this->mode !== "DSP"; 
            $this->xss_token_artist = md5("artists_artist".date('Ymdhisu'));
            $_SESSION["xss_token_artist"] = $this->xss_token_artist;
            $this->viewData["xss_token_artist"] = $this->xss_token_artist; 
        }
        

	private function render(){
            Renderer::render("artists/artistform", $this->viewData);
        }
}
