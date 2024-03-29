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

/*Este fragmento de código PHP define una clase llamada Songs dentro del espacio de nombres Controllers\Songs. Aquí está una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Songs, lo que sugiere que esta clase se encarga de la lógica relacionada con las canciones en el sistema.

Clase Songs: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles solo para usuarios autenticados.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los atributos de una canción, como id_song, title_song, duration, etc. También tiene un array llamado $song que contiene la estructura de datos de una canción.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye inicializar la clase, procesar los datos enviados por el formulario, preparar los datos para la vista y renderizar la vista correspondiente.

Método init(): Este método inicializa la clase, determinando el modo de operación (INS, UPD, DEL, DSP) y obteniendo los datos de la canción si es necesario.

Método validateFormData(): Este método valida los datos del formulario enviado por el usuario, verificando si todos los campos obligatorios están presentes y si el token de seguridad es válido.

Método processAction(): Este método procesa la acción según el modo de operación. Inserta, actualiza o elimina una canción en función de la acción solicitada.

Método prepareViewData(): Este método prepara los datos necesarios para renderizar la vista. Incluye información sobre el modo de operación, los errores de validación, y el token XSS para protección contra ataques XSS.

Método render(): Este método renderiza la vista correspondiente utilizando el motor de plantillas Renderer, proporcionando los datos necesarios para la vista. */

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
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("songs/songform", $this->viewData);
    }
}