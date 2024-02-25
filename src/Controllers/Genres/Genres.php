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

namespace Controllers\Genres;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Genres\Genres as DAOGenre;
use Utilities\Site;
use Utilities\Validators;

/*

Este código PHP define un controlador llamado Genres que se encarga de manejar los géneros de una aplicación. Aquí está su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Genres, lo que sugiere que pertenece a un conjunto de controladores relacionados con los géneros de la aplicación.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController del mismo espacio de nombres, la clase Renderer del espacio de nombres Views, así como la clase Genres del espacio de nombres Dao\Genres. Además, utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene varios atributos privados, como $id_genre, $name_genre, $description_genre, $status_genre y $image_genre, que almacenan datos relacionados con los géneros y su gestión. También hay un atributo $genre, que es un array asociativo con los mismos nombres de los atributos anteriores, pero inicializados a valores vacíos.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar el controlador, procesar los datos del formulario si se ha enviado un formulario (isPostBack()), preparar los datos para la vista y renderizar la plantilla correspondiente.

Inicialización: El método init() se encarga de inicializar el modo del controlador ($mode) y los datos del género dependiendo de si se está insertando uno nuevo (INS) o se está actualizando, eliminando o mostrando detalles de uno existente.

Validación de datos del formulario: El método validateFormData() valida los datos del formulario, verificando si los campos obligatorios están vacíos y estableciendo mensajes de error si es necesario.

Procesamiento de acciones: El método processAction() realiza las acciones correspondientes según el modo en el que se encuentre el controlador: inserción, actualización o eliminación de un género.

Preparación de datos para la vista: El método prepareViewData() prepara los datos necesarios para la vista, incluyendo el modo, los datos del género, los mensajes de error, el token XSS para protección contra ataques CSRF, y los permisos de usuario.

Renderización de la vista: Finalmente, el método render() renderiza la plantilla de formulario de género utilizando el motor de renderización Renderer y pasa los datos preparados en el array $viewData. */

class Genres extends PrivateController
{
    private $id_genre;
    private $name_genre;
    private $description_genre;
    private $status_genre;
    private $image_genre;
    private $genre = [
        "id_genre" => "",
        "name_genre" => "",
        "description_genre" => "",
        "status_genre" => "",
        "image_genre" => ""
    ];
    private $listUrl = "index.php?page=Genres_Genre";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_genre = '';
    private $modes = [
        "INS" => "Creando nueva genre",
        "UPD" => "Editando genre",
        "DEL" => "Eliminando genre",
        "DSP" => "Detalle genre"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->genre['id_genre'] = $_POST['id_genre'];
                $this->genre['name_genre'] = $_POST['name_genre'];
                $this->genre['description_genre'] = $_POST['description_genre'];
                $this->genre['status_genre'] = $_POST['status_genre'];
                $this->genre['image_genre'] = $_POST['image_genre'];
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
                    if (isset($_GET["id_genre"])) {
                        $this->genre = DAOGenre::obtenerPorId(strval($_GET["id_genre"]));
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
        if (isset($_POST["xss_token_genre"])) {
            $this->xss_token_genre = $_POST["xss_token_genre"];
            if ($_SESSION["xss_token_genre"] !== $this->xss_token_genre) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_genre"])) {
            $this->error["id_genre_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["name_genre"])) {
            $this->error["name_genre_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["description_genre"])) {
            $this->error["description_genre_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["status_genre"])) {
            $this->error["status_genre_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["image_genre"])) {
            $this->error["image_genre_error"] = "Campo es requerido";
        }
      
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOGenre::insertGenre(
                    $this->genre["id_genre"],
                    $this->genre["name_genre"],
                    $this->genre["description_genre"],
                    $this->genre["status_genre"],
                    $this->genre["image_genre"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Genre creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOGenre::updateGenre(
                    $this->genre["id_genre"],
                    $this->genre["name_genre"],
                    $this->genre["description_genre"],
                    $this->genre["status_genre"],
                    $this->genre["image_genre"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Genre actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOGenre::deleteGenre(
                    $this->genre["id_genre"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Genre eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["genre"] = $this->genre;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
          
        }

        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["genre"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_genre = md5("genres_genre" . date('Ymdhisu'));
        $_SESSION["xss_token_genre"] = $this->xss_token_genre;
        $this->viewData["xss_token_genre"] = $this->xss_token_genre;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("genres/genreform", $this->viewData);
    }
}