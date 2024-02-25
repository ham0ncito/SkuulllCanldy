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
/*Este fragmento de código PHP define una clase llamada Songauthors dentro del espacio de nombres Controllers\Songauthorss. Aquí hay una descripción de lo que hace esta clase:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Songauthorss, lo que sugiere que esta clase se encarga de la lógica relacionada con los autores de canciones en el sistema.

Clase Songauthors: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accesibles solo para usuarios autenticados.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los atributos de un autor de canción, como artist_id, song_id, song_author_created_at, etc. También tiene un array llamado $songauthors que contiene la estructura de datos de un autor de canción.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase, que incluye inicializar la clase, procesar los datos enviados por el formulario, preparar los datos para la vista y renderizar la vista correspondiente.

Método init(): Este método inicializa la clase, determinando el modo de operación (INS, UPD, DEL, DSP) y obteniendo los datos del autor de canción si es necesario.

Método handleError(): Este método redirige al usuario a la página de lista de autores de canciones con un mensaje de error en caso de que ocurra algún problema durante el procesamiento de la solicitud.

Método validateFormData(): Este método valida los datos del formulario enviado por el usuario, verificando si todos los campos obligatorios están presentes y si el token de seguridad es válido.

Método processAction(): Este método procesa la acción según el modo de operación. Inserta, actualiza o elimina un autor de canción en función de la acción solicitada.

Método prepareViewData(): Este método prepara los datos necesarios para renderizar la vista. Incluye información sobre el modo de operación, los errores de validación y el token XSS para protección contra ataques XSS.

Método render(): Este método renderiza la vista correspondiente utilizando el motor de plantillas Renderer, proporcionando los datos necesarios para la vista. */

namespace Controllers\Songauthorss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Songauthorss\Songauthorss as DAOSongauthors;
use Utilities\Site;
use Utilities\Validators;

class Songauthorss extends PrivateController
{
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
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
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
                if ($this->mode !== "INS") {
                    if (isset($_GET[""])) {
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
    private function handleError($errMsg)
    {
        Site::redirectToWithMsg($this->listUrl, $errMsg);
    }

    private function validateFormData()
    {
        if (isset($_POST["xss_token_songauthors"])) {
            $this->xss_token_songauthors = $_POST["xss_token_songauthors"];
            if ($_SESSION["xss_token_songauthors"] !== $this->xss_token_songauthors) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["artist_id"])) {
            $this->error["artist_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["song_id"])) {
            $this->error["song_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["song_author_created_at"])) {
            $this->error["song_author_created_at_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["song_author_last_update_at"])) {
            $this->error["song_author_last_update_at_error"] = "Campo es requerido";
        }

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOSongauthors::insertSongauthors(
                    $this->songauthors["artist_id"],
                    $this->songauthors["song_id"],
                    $this->songauthors["song_author_created_at"],
                    $this->songauthors["song_author_last_update_at"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Songauthors creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOSongauthors::updateSongauthors(
                    $this->songauthors["artist_id"],
                    $this->songauthors["song_id"],
                    $this->songauthors["song_author_created_at"],
                    $this->songauthors["song_author_last_update_at"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Songauthors actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOSongauthors::deleteSongauthors(
                    $this->songauthors[""]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Songauthors eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["songauthors"] = $this->songauthors;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["songauthors"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_songauthors = md5("songauthorss_songauthors" . date('Ymdhisu'));
        $_SESSION["xss_token_songauthors"] = $this->xss_token_songauthors;
        $this->viewData["xss_token_songauthors"] = $this->xss_token_songauthors;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("songauthorss/songauthorsform", $this->viewData);
    }
}