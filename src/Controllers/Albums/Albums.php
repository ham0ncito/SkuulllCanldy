<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

/*Este código PHP define un controlador llamado `Albums` en el espacio de nombres `Controllers\Albums`, que maneja la gestión de álbumes. El controlador se encarga de procesar las solicitudes de creación, edición y eliminación de álbumes, así como de mostrar los detalles de un álbum específico. Utiliza funciones para validar los datos del formulario y realizar las acciones correspondientes en la capa de datos. Además, prepara los datos necesarios para la vista y renderiza las plantillas correspondientes según el modo de operación. El controlador también gestiona la generación de tokens para prevenir ataques XSS. */
namespace Controllers\Albums;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Albums\Albums as DAOAlbum;
use Utilities\Site;
use Utilities\Validators;

class Albums extends PrivateController
{
    private $id_album;
    private $title_album;
    private $image_album;
    private $release_date_album;
    private $number_of_songs_album;
    private $id_artist;
    private $status_album;
    private $id_genre;
    private $album = [
        "id_album" => "",
        "title_album" => "",
        "image_album" => "",
        "release_date_album" => "",
        "number_of_songs_album" => "",
        "id_artist" => "",
        "status_album" => "",
        "id_genre" => ""
    ];
    private $listUrl = "index.php?page=Albums_Album";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_album = '';
    private $modes = [
        "INS" => "Creando nueva album",
        "UPD" => "Editando album",
        "DEL" => "Eliminando album",
        "DSP" => "Detalle album"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->album['id_album'] = $_POST['id_album'];
                $this->album['title_album'] = $_POST['title_album'];
                $this->album['image_album'] = $_POST['image_album'];
                $this->album['release_date_album'] = $_POST['release_date_album'];
                $this->album['number_of_songs_album'] = $_POST['number_of_songs_album'];
                $this->album['id_artist'] = $_POST['id_artist'];
                $this->album['status_album'] = $_POST['status_album'];
                $this->album['id_genre'] = $_POST['id_genre'];
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
                    if (isset($_GET["id_album"])) {
                        $this->album = DAOAlbum::obtenerPorId(strval($_GET["id_album"]));
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
        if (isset($_POST["xss_token_album"])) {
            $this->xss_token_album = $_POST["xss_token_album"];
            if ($_SESSION["xss_token_album"] !== $this->xss_token_album) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_album"])) {
            $this->error["id_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["title_album"])) {
            $this->error["title_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["image_album"])) {
            $this->error["image_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["release_date_album"])) {
            $this->error["release_date_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["number_of_songs_album"])) {
            $this->error["number_of_songs_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_artist"])) {
            $this->error["id_artist_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["status_album"])) {
            $this->error["status_album_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_genre"])) {
            $this->error["id_genre_error"] = "Campo es requerido";
        }
       

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOAlbum::insertAlbum(
                    $this->album["id_album"],
                    $this->album["title_album"],
                    $this->album["image_album"],
                    $this->album["release_date_album"],
                    $this->album["number_of_songs_album"],
                    $this->album["id_artist"],
                    $this->album["status_album"],
                    $this->album["id_genre"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Album creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOAlbum::updateAlbum(
                    $this->album["id_album"],
                    $this->album["title_album"],
                    $this->album["image_album"],
                    $this->album["release_date_album"],
                    $this->album["number_of_songs_album"],
                    $this->album["id_artist"],
                    $this->album["status_album"],
                    $this->album["id_genre"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Album actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOAlbum::deleteAlbum(
                    $this->album["id_album"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Album eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["album"] = $this->album;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
        }
       foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["album"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_album = md5("albums_album" . date('Ymdhisu'));
        $_SESSION["xss_token_album"] = $this->xss_token_album;
        $this->viewData["xss_token_album"] = $this->xss_token_album;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("albums/albumform", $this->viewData);
    }
}