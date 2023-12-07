<?php

namespace Controllers\Songs;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songs\Songs as DAOSong;
use Utilities\Site;
use Utilities\Validators;

class Songs extends PrivateController
{
    private $id_song;
    private $title_song;
    private $duration;
    private $id_genre;
    private $song_cover;
    private $album_id;
    private $status_song;
    private $link_song;
    private $song = [
        "id_song" => "",
        "title_song" => "",
        "duration" => "",
        "id_genre" => "",
        "song_cover" => "",
        "album_id" => "",
        "status_song" => "",
        "link_song" => ""
    ];
    private $listUrl = "index.php?page=Songs_Song";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_song = '';
    private $modes = [
        "INS" => "Creando nueva song",
        "UPD" => "Editando song",
        "DEL" => "Eliminando song",
        "DSP" => "Detalle song"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->song['id_song'] = $_POST['id_song'];
                $this->song['title_song'] = $_POST['title_song'];
                $this->song['duration'] = $_POST['duration'];
                $this->song['id_genre'] = $_POST['id_genre'];
                $this->song['song_cover'] = $_POST['song_cover'];
                $this->song['album_id'] = $_POST['album_id'];
                $this->song['status_song'] = $_POST['status_song'];
                $this->song['link_song'] = $_POST['link_song'];
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
                if ($this->mode !== "INS") {
                    if (isset($_GET["id_song"])) {
                        $this->song = DAOSong::obtenerPorId(strval($_GET["id_song"]));
                    }
                }
            } else {
                $this->handleError("Oops, el programa no encuentra el modo solicitado, intente de nuevo");
            }
        } else {
            $this->handleError("Oops, el programa falló, intente de nuevo.");
        }
    }
    private function handleError($errMsg)
    {
        Site::redirectToWithMsg($this->listUrl, $errMsg);
    }

    private function validateFormData()
    {
        if (isset($_POST["xss_token_song"])) {
            $this->xss_token_song = $_POST["xss_token_song"];
            if ($_SESSION["xss_token_song"] !== $this->xss_token_song) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_song"])) {
            $this->error["id_song_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["title_song"])) {
            $this->error["title_song_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["duration"])) {
            $this->error["duration_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_genre"])) {
            $this->error["id_genre_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["song_cover"])) {
            $this->error["song_cover_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["album_id"])) {
            $this->error["album_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["status_song"])) {
            $this->error["status_song_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["link_song"])) {
            $this->error["link_song_error"] = "Campo es requerido";
        }
        //if (!in_array($_POST["status"], ["INA", "ACT"])) {
        // $this->error["status_error"] = "Estado es inválido.";
        // } else {
        //  $this->error["status_error"] = ""; 
        //}

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOSong::insertSong(
                    $this->song["id_song"],
                    $this->song["title_song"],
                    $this->song["duration"],
                    $this->song["id_genre"],
                    $this->song["song_cover"],
                    $this->song["album_id"],
                    $this->song["status_song"],
                    $this->song["link_song"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Song creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOSong::updateSong(
                    $this->song["id_song"],
                    $this->song["title_song"],
                    $this->song["duration"],
                    $this->song["id_genre"],
                    $this->song["song_cover"],
                    $this->song["album_id"],
                    $this->song["status_song"],
                    $this->song["link_song"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Song actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOSong::deleteSong(
                    $this->song["id_song"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Song eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["song"] = $this->song;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
         
        }
        
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["song"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_song = md5("songs_song" . date('Ymdhisu'));
        $_SESSION["xss_token_song"] = $this->xss_token_song;
        $this->viewData["xss_token_song"] = $this->xss_token_song;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("songs/songform", $this->viewData);
    }
}