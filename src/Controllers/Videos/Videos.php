<?php

namespace Controllers\Videos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Videos\Videos as DAOVideo;
use Utilities\Site;

use Utilities\Validators;

class Videos extends PrivateController
{
    private $id_video;
    private $title_video;
    private $description_video;
    private $duration;
    private $video_cover;
    private $artist_id;
    private $status_video;
    private $link_song;
    private $video = [
        "id_video" => "",
        "title_video" => "",
        "description_video" => "",
        "duration" => "",
        "video_cover" => "",
        "artist_id" => "",
        "status_video" => "",
        "link_song" => ""
    ];
    private $listUrl = "index.php?page=Videos_Video";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_video = '';
    private $modes = [
        "INS" => "Creando nueva video",
        "UPD" => "Editando video",
        "DEL" => "Eliminando video",
        "DSP" => "Detalle video"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->video['id_video'] = $_POST['id_video'];
                $this->video['title_video'] = $_POST['title_video'];
                $this->video['description_video'] = $_POST['description_video'];
                $this->video['duration'] = $_POST['duration'];
                $this->video['video_cover'] = $_POST['video_cover'];
                $this->video['artist_id'] = $_POST['artist_id'];
                $this->video['status_video'] = $_POST['status_video'];
                $this->video['link_song'] = $_POST['link_song'];
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
                    if (isset($_GET["id_video"])) {
                        $this->video = DAOVideo::obtenerPorId(strval($_GET["id_video"]));
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
        if (isset($_POST["xss_token_video"])) {
            $this->xss_token_video = $_POST["xss_token_video"];
            if ($_SESSION["xss_token_video"] !== $this->xss_token_video) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_video"])) {
            $this->error["id_video_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["title_video"])) {
            $this->error["title_video_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["description_video"])) {
            $this->error["description_video_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["duration"])) {
            $this->error["duration_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["video_cover"])) {
            $this->error["video_cover_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["artist_id"])) {
            $this->error["artist_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["status_video"])) {
            $this->error["status_video_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["link_song"])) {
            $this->error["link_song_error"] = "Campo es requerido";
        }
 
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOVideo::insertVideo(
                    $this->video["id_video"],
                    $this->video["title_video"],
                    $this->video["description_video"],
                    $this->video["duration"],
                    $this->video["video_cover"],
                    $this->video["artist_id"],
                    $this->video["status_video"],
                    $this->video["link_song"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Video creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOVideo::updateVideo(
                    $this->video["id_video"],
                    $this->video["title_video"],
                    $this->video["description_video"],
                    $this->video["duration"],
                    $this->video["video_cover"],
                    $this->video["artist_id"],
                    $this->video["status_video"],
                    $this->video["link_song"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Video actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOVideo::deleteVideo(
                    $this->video["id_video"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Video eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["video"] = $this->video;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["video"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_video = md5("videos_video" . date('Ymdhisu'));
        $_SESSION["xss_token_video"] = $this->xss_token_video;
        $this->viewData["xss_token_video"] = $this->xss_token_video;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("videos/videoform", $this->viewData);
    }
}