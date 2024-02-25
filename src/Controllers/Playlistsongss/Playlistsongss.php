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
/*
Este fragmento de código PHP define una clase llamada Playlistsongss en el espacio de nombres Controllers\Playlistsongss. Aquí hay un resumen de lo que hace esta clase:

Documentación: La clase está bien documentada con detalles sobre la versión de PHP, la fecha de creación y la última actualización, el autor, el número de problema y ticket, y los cambios aprobados.

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Playlistsongss, lo que sugiere que esta clase maneja la lógica relacionada con las canciones de una lista de reproducción.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Playlistsongss\Playlistsongss, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene propiedades privadas que representan los datos relacionados con las canciones de la lista de reproducción, como el ID de la lista de reproducción (playlist_id), el ID de la canción (song_id), la fecha en que se agregó la canción a la lista de reproducción (playlistSong_added_at) y el estado de la canción en la lista de reproducción (playlistSong_status). También hay propiedades para almacenar errores, el modo de operación, la URL de la lista de reproducción, etc.

Método run(): Este método es el punto de entrada de la clase. Inicializa la clase, valida los datos del formulario (si es un envío de formulario) y procesa la acción correspondiente. Luego, prepara los datos para la vista y la renderiza.

Inicialización (init()): Este método inicializa la clase, verificando el modo de operación y recuperando datos si el modo no es "INS" (insertar).

Manejo de errores: La clase maneja errores redirigiendo a la URL de la lista de reproducción con un mensaje de error en caso de que ocurra un error.

Validación de datos del formulario: La clase valida los datos del formulario para asegurarse de que los campos obligatorios estén presentes.

Procesamiento de la acción: Dependiendo del modo de operación (insertar, actualizar, eliminar), la clase procesa la acción correspondiente utilizando métodos del DAO DAOPlaylistsongs.

Preparación de datos para la vista: La clase prepara los datos necesarios para la vista, como el modo de operación, los datos de la canción de la lista de reproducción, los mensajes de error, etc.

Renderizado de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el Renderer y pasa los datos preparados para la vista. */
namespace Controllers\Playlistsongss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Playlistsongss\Playlistsongss as DAOPlaylistsongs;
use Utilities\Site;
use Utilities\Validators;

class Playlistsongss extends PrivateController
{
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
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
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
                if ($this->mode !== "INS") {
                    if (isset($_GET["playlist_id"])) {
                        $this->playlistsongs = DAOPlaylistsongs::obtenerPorId(strval($_GET["playlist_id"]));
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
        if (isset($_POST["xss_token_playlistsongs"])) {
            $this->xss_token_playlistsongs = $_POST["xss_token_playlistsongs"];
            if ($_SESSION["xss_token_playlistsongs"] !== $this->xss_token_playlistsongs) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["playlist_id"])) {
            $this->error["playlist_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["song_id"])) {
            $this->error["song_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlistsong_added_at"])) {
            $this->error["playlistsong_added_at_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlistsong_status"])) {
            $this->error["playlistsong_status_error"] = "Campo es requerido";
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
                if (DAOPlaylistsongs::insertPlaylistsongs(
                    $this->playlistsongs["playlist_id"],
                    $this->playlistsongs["song_id"],
                    $this->playlistsongs["playlistsong_added_at"],
                    $this->playlistsongs["playlistsong_status"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlistsongs creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOPlaylistsongs::updatePlaylistsongs(
                    $this->playlistsongs["playlist_id"],
                    $this->playlistsongs["song_id"],
                    $this->playlistsongs["playlistsong_added_at"],
                    $this->playlistsongs["playlistsong_status"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlistsongs actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOPlaylistsongs::deletePlaylistsongs(
                    $this->playlistsongs["playlist_id"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Playlistsongs eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["playlistsongs"] = $this->playlistsongs;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["playlistsongs"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_playlistsongs = md5("playlistsongss_playlistsongs" . date('Ymdhisu'));
        $_SESSION["xss_token_playlistsongs"] = $this->xss_token_playlistsongs;
        $this->viewData["xss_token_playlistsongs"] = $this->xss_token_playlistsongs;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("playlistsongss/playlistsongsform", $this->viewData);
    }
}
