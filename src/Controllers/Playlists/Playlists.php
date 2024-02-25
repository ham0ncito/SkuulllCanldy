<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Playlists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlists\Playlists as DAOPlaylist;
use Utilities\Site;
use Utilities\Validators;

class Playlists extends PrivateController
{
    private $id_playlist;
    private $playlist_name;
    private $playlist_description;
    private $playlist_image;
    private $playlist_create_at;
    private $playlist_status;
    private $usercod;
    private $playlist = [
        "id_playlist" => "",
        "playlist_name" => "",
        "playlist_description" => "",
        "playlist_image" => "",
        "playlist_create_at" => "",
        "playlist_status" => "",
        "usercod" => ""
    ];
    private $listUrl = "index.php?page=Playlists_Playlist";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_playlist = '';
    private $modes = [
        "INS" => "Creando nueva playlist",
        "UPD" => "Editando playlist",
        "DEL" => "Eliminando playlist",
        "DSP" => "Detalle playlist"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->playlist['id_playlist'] = $_POST['id_playlist'];
                $this->playlist['playlist_name'] = $_POST['playlist_name'];
                $this->playlist['playlist_description'] = $_POST['playlist_description'];
                $this->playlist['playlist_image'] = $_POST['playlist_image'];
                $this->playlist['playlist_create_at'] = $_POST['playlist_create_at'];
                $this->playlist['playlist_status'] = $_POST['playlist_status'];
                $this->playlist['usercod'] = $_POST['usercod'];
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
                    if (isset($_GET["id_playlist"])) {
                        $this->playlist = DAOPlaylist::obtenerPorId(strval($_GET["id_playlist"]));
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
        if (isset($_POST["xss_token_playlist"])) {
            $this->xss_token_playlist = $_POST["xss_token_playlist"];
            if ($_SESSION["xss_token_playlist"] !== $this->xss_token_playlist) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_playlist"])) {
            $this->error["id_playlist_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_name"])) {
            $this->error["playlist_name_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_description"])) {
            $this->error["playlist_description_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_image"])) {
            $this->error["playlist_image_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_create_at"])) {
            $this->error["playlist_create_at_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_status"])) {
            $this->error["playlist_status_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["usercod"])) {
            $this->error["usercod_error"] = "Campo es requerido";
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
                if (DAOPlaylist::insertPlaylist(
                    $this->playlist["id_playlist"],
                    $this->playlist["playlist_name"],
                    $this->playlist["playlist_description"],
                    $this->playlist["playlist_image"],
                    $this->playlist["playlist_create_at"],
                    $this->playlist["playlist_status"],
                    $this->playlist["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlist creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOPlaylist::updatePlaylist(
                    $this->playlist["id_playlist"],
                    $this->playlist["playlist_name"],
                    $this->playlist["playlist_description"],
                    $this->playlist["playlist_image"],
                    $this->playlist["playlist_create_at"],
                    $this->playlist["playlist_status"],
                    $this->playlist["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlist actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOPlaylist::deletePlaylist(
                    $this->playlist["id_playlist"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlist eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["playlist"] = $this->playlist;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }

        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["playlist"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_playlist = md5("playlists_playlist" . date('Ymdhisu'));
        $_SESSION["xss_token_playlist"] = $this->xss_token_playlist;
        $this->viewData["xss_token_playlist"] = $this->xss_token_playlist;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("playlists/playlistform", $this->viewData);
    }
}