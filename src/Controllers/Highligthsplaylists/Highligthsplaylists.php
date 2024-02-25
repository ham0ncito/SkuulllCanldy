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
Este código PHP define un controlador llamado Highligthsplaylists en el espacio de nombres Controllers\Highligthsplaylists. Aquí está un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Highligthsplaylists, lo que sugiere que se ocupa de la gestión de listas de reproducción destacadas.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController del mismo espacio de nombres, la clase Renderer del espacio de nombres Views, y la clase Highligthsplaylists del espacio de nombres Dao\Highligthsplaylists. También utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene atributos privados para almacenar información sobre las listas de reproducción destacadas, como highligths_id, playlist_id y highligths_description.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializarlo, procesar el formulario si se ha enviado y preparar los datos para la vista.

Inicialización y validación de datos: El método init() inicializa el modo del controlador y obtiene los datos si es necesario. validateFormData() valida los datos del formulario.

Procesamiento de acciones: El método processAction() realiza la acción correspondiente según el modo del controlador, como insertar, actualizar o eliminar una lista de reproducción destacada.

Preparación de datos para la vista: El método prepareViewData() prepara los datos necesarios para renderizar la vista, como el modo, los datos de la lista de reproducción destacada y los mensajes de error.

Renderización de la vista: Finalmente, el método render() renderiza la plantilla de formulario de lista de reproducción destacada, pasando los datos preparados. */
namespace Controllers\Highligthsplaylists;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthsplaylists\Highligthsplaylists as DAOHighligthsplaylist;
use Utilities\Site;
use Utilities\Validators;

class Highligthsplaylists extends PrivateController
{
    private $highligths_id;
    private $playlist_id;
    private $highligths_description;
    private $highligthsplaylist = [
        "highligths_id" => "",
        "playlist_id" => "",
        "highligths_description" => ""
    ];
    private $listUrl = "index.php?page=Highligthsplaylists_Highligthsplaylist";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_highligthsplaylist = '';
    private $modes = [
        "INS" => "Creando nueva highligthsplaylist",
        "UPD" => "Editando highligthsplaylist",
        "DEL" => "Eliminando highligthsplaylist",
        "DSP" => "Detalle highligthsplaylist"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->highligthsplaylist['highligths_id'] = $_POST['highligths_id'];
                $this->highligthsplaylist['playlist_id'] = $_POST['playlist_id'];
                $this->highligthsplaylist['highligths_description'] = $_POST['highligths_description'];
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
                    if (isset($_GET["highligths_id"])) {
                        $this->highligthsplaylist = DAOHighligthsplaylist::obtenerPorId(strval($_GET["highligths_id"]));
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
        if (isset($_POST["xss_token_highligthsplaylist"])) {
            $this->xss_token_highligthsplaylist = $_POST["xss_token_highligthsplaylist"];
            if ($_SESSION["xss_token_highligthsplaylist"] !== $this->xss_token_highligthsplaylist) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["highligths_id"])) {
            $this->error["highligths_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["playlist_id"])) {
            $this->error["playlist_id_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["highligths_description"])) {
            $this->error["highligths_description_error"] = "Campo es requerido";
        }
      
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOHighligthsplaylist::insertHighligthsplaylist(
                    $this->highligthsplaylist["highligths_id"],
                    $this->highligthsplaylist["playlist_id"],
                    $this->highligthsplaylist["highligths_description"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOHighligthsplaylist::updateHighligthsplaylist(
                    $this->highligthsplaylist["highligths_id"],
                    $this->highligthsplaylist["playlist_id"],
                    $this->highligthsplaylist["highligths_description"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOHighligthsplaylist::deleteHighligthsplaylist(
                    $this->highligthsplaylist["highligths_id"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligthsplaylist eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["highligthsplaylist"] = $this->highligthsplaylist;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
            
        }
     
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["highligthsplaylist"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_highligthsplaylist = md5("highligthsplaylists_highligthsplaylist" . date('Ymdhisu'));
        $_SESSION["xss_token_highligthsplaylist"] = $this->xss_token_highligthsplaylist;
        $this->viewData["xss_token_highligthsplaylist"] = $this->xss_token_highligthsplaylist;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("highligthsplaylists/highligthsplaylistform", $this->viewData);
    }
}