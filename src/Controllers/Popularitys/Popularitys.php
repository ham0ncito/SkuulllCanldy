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

namespace Controllers\Popularitys;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Popularitys\Popularitys as DAOPopularity;
use Utilities\Site;
use Utilities\Validators;
/*
Este archivo PHP define una clase llamada Popularitys dentro del espacio de nombres Controllers\Popularitys. Aquí hay un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Popularitys, lo que sugiere que esta clase se encarga de la lógica relacionada con la popularidad de algún tipo de objeto.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Popularitys\Popularitys, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con la popularidad, como el ID de popularidad (id_popularity), el ID del objeto (id_object), el contador de "no me gusta" (dislike_count), el contador de "me gusta" (like_count), el porcentaje de "no me gusta" (percent_dislike), el porcentaje de "me gusta" (percent_like) y el tipo de objeto (type_object). También hay propiedades para almacenar datos adicionales como la lista de popularidad, la URL de la lista, el modo actual, los datos de la vista, los errores y los tokens XSS.

Inicialización y renderización de la vista: El método run() se encarga de inicializar la clase, procesar los datos del formulario en caso de una solicitud POST, preparar los datos necesarios para la vista y luego renderizar la vista correspondiente.

Obtención de datos de popularidad: La clase puede obtener datos de popularidad utilizando el DAO (Objeto de Acceso a Datos) DAOPopularity::getPopularity() y los pasa a la vista para ser mostrados.

Validación de datos del formulario: La clase valida los datos del formulario para garantizar que los campos requeridos estén presentes y no estén vacíos.

Procesamiento de acciones: La clase procesa las acciones del formulario según el modo actual (INS para inserción, UPD para actualización, DEL para eliminación) utilizando métodos del DAO correspondiente.

Preparación de datos para la vista: La clase prepara los datos necesarios para renderizar la vista, incluyendo los datos de popularidad, indicadores de modo, mensajes de error y tokens XSS para evitar ataques de tipo Cross-Site Scripting.

Renderización de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el renderizador de vistas proporcionado. */
class Popularitys extends PrivateController
{
    private $id_popularity;
    private $id_object;
    private $dislike_count;
    private $like_count;
    private $percent_dislike;
    private $percent_like;
    private $type_object;
    private $popularity = [
        "id_popularity" => "",
        "id_object" => "",
        "dislike_count" => "",
        "like_count" => "",
        "percent_dislike" => "",
        "percent_like" => "",
        "type_object" => ""
    ];
    private $listUrl = "index.php?page=Popularitys_Popularity";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_popularity = '';
    private $modes = [
        "INS" => "Creando nueva popularity",
        "UPD" => "Editando popularity",
        "DEL" => "Eliminando popularity",
        "DSP" => "Detalle popularity"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->popularity['id_popularity'] = $_POST['id_popularity'];
                $this->popularity['id_object'] = $_POST['id_object'];
                $this->popularity['dislike_count'] = $_POST['dislike_count'];
                $this->popularity['like_count'] = $_POST['like_count'];
                $this->popularity['percent_dislike'] = $_POST['percent_dislike'];
                $this->popularity['percent_like'] = $_POST['percent_like'];
                $this->popularity['type_object'] = $_POST['type_object'];
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
                    if (isset($_GET["id_popularity"])) {
                        $this->popularity = DAOPopularity::obtenerPorId(strval($_GET["id_popularity"]));
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
        if (isset($_POST["xss_token_popularity"])) {
            $this->xss_token_popularity = $_POST["xss_token_popularity"];
            if ($_SESSION["xss_token_popularity"] !== $this->xss_token_popularity) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_popularity"])) {
            $this->error["id_popularity_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_object"])) {
            $this->error["id_object_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["dislike_count"])) {
            $this->error["dislike_count_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["like_count"])) {
            $this->error["like_count_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["percent_dislike"])) {
            $this->error["percent_dislike_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["percent_like"])) {
            $this->error["percent_like_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["type_object"])) {
            $this->error["type_object_error"] = "Campo es requerido";
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
                if (DAOPopularity::insertPopularity(
                    $this->popularity["id_popularity"],
                    $this->popularity["id_object"],
                    $this->popularity["dislike_count"],
                    $this->popularity["like_count"],
                    $this->popularity["percent_dislike"],
                    $this->popularity["percent_like"],
                    $this->popularity["type_object"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOPopularity::updatePopularity(
                    $this->popularity["id_popularity"],
                    $this->popularity["id_object"],
                    $this->popularity["dislike_count"],
                    $this->popularity["like_count"],
                    $this->popularity["percent_dislike"],
                    $this->popularity["percent_like"],
                    $this->popularity["type_object"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOPopularity::deletePopularity(
                    $this->popularity["id_popularity"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Popularity eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["popularity"] = $this->popularity;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }
        //$this->viewData["popularity"][$this->popularity["status"]."_selected"] = 'selected';
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["popularity"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_popularity = md5("popularitys_popularity" . date('Ymdhisu'));
        $_SESSION["xss_token_popularity"] = $this->xss_token_popularity;
        $this->viewData["xss_token_popularity"] = $this->xss_token_popularity;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("popularitys/popularityform", $this->viewData);
    }
}