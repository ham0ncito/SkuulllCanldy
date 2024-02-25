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
Este fragmento de código PHP define un controlador llamado Highligthss dentro del espacio de nombres Controllers\Highligthss. Aquí está un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Highligthss, lo que sugiere que se ocupa de la gestión de aspectos destacados.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController del mismo espacio de nombres, la clase Renderer del espacio de nombres Views, y la clase Highligthss del espacio de nombres Dao\Highligthss. También utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene atributos privados para almacenar información sobre los aspectos destacados, como highligths_id, highligths_starts_at, highligths_ends_at y highligths_time.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializarlo, procesar los datos si es necesario y prepararlos para la vista.

Inicialización y validación de datos: El método run() inicializa el controlador y obtiene los aspectos destacados si el usuario es un administrador. También verifica si la lista de aspectos destacados está vacía y establece una bandera correspondiente.

Preparación de datos para la vista: El método prepareViewData() prepara los datos necesarios para renderizar la vista, como los datos de los aspectos destacados y las banderas de vacío.

Renderización de la vista: Finalmente, el método render() renderiza la plantilla del formulario de aspectos destacados, pasando los datos preparados.
 */
namespace Controllers\Highligthss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthss\Highligthss as DAOHighligths;
use Utilities\Site;
use Utilities\Validators;

class Highligthss extends PrivateController
{
    private $highligths_id;
    private $highligths_starts_at;
    private $highligths_ends_at;
    private $highligths_time;
    private $highligths = [
        "highligths_id" => "",
        "highligths_starts_at" => "",
        "highligths_ends_at" => "",
        "highligths_time" => ""
    ];
    private $listUrl = "index.php?page=Highligthss_Highligths";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_highligths = '';
    private $modes = [
        "INS" => "Creando nueva highligths",
        "UPD" => "Editando highligths",
        "DEL" => "Eliminando highligths",
        "DSP" => "Detalle highligths"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->highligths['highligths_id'] = $_POST['highligths_id'];
                $this->highligths['highligths_starts_at'] = $_POST['highligths_starts_at'];
                $this->highligths['highligths_ends_at'] = $_POST['highligths_ends_at'];
                $this->highligths['highligths_time'] = $_POST['highligths_time'];
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
                        $this->highligths = DAOHighligths::obtenerPorId(strval($_GET["highligths_id"]));
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
        if (isset($_POST["xss_token_highligths"])) {
            $this->xss_token_highligths = $_POST["xss_token_highligths"];
            if ($_SESSION["xss_token_highligths"] !== $this->xss_token_highligths) {
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
        if (Validators::IsEmpty($_POST["highligths_starts_at"])) {
            $this->error["highligths_starts_at_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["highligths_ends_at"])) {
            $this->error["highligths_ends_at_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["highligths_time"])) {
            $this->error["highligths_time_error"] = "Campo es requerido";
        }
        

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOHighligths::insertHighligths(
                    $this->highligths["highligths_id"],
                    $this->highligths["highligths_starts_at"],
                    $this->highligths["highligths_ends_at"],
                    $this->highligths["highligths_time"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligths creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOHighligths::updateHighligths(
                    $this->highligths["highligths_id"],
                    $this->highligths["highligths_starts_at"],
                    $this->highligths["highligths_ends_at"],
                    $this->highligths["highligths_time"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligths actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOHighligths::deleteHighligths(
                    $this->highligths["highligths_id"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Highligths eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["highligths"] = $this->highligths;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
          
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["highligths"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_highligths = md5("highligthss_highligths" . date('Ymdhisu'));
        $_SESSION["xss_token_highligths"] = $this->xss_token_highligths;
        $this->viewData["xss_token_highligths"] = $this->xss_token_highligths;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("highligthss/highligthsform", $this->viewData);
    }
}