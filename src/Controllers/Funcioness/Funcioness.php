<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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
/*Este código PHP define un controlador llamado Funcioness que se encarga de manejar las funciones de una aplicación web. Aquí está su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Funcioness, lo que sugiere que pertenece a un conjunto de controladores relacionados con las funciones de la aplicación.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController y la clase Renderer del espacio de nombres Views, así como la clase Funcioness del espacio de nombres Dao\Funcioness. Además, utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene varios atributos privados, como $fncod, $fndsc, $fnest, $fntyp, $funciones, $listUrl, $mode, $viewData, $error, $xss_token_funciones y $modes, que almacenan datos relacionados con las funciones y la gestión de formularios.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar el controlador, procesar los datos del formulario si se ha enviado uno y preparar los datos para renderizar la vista correspondiente.

Método init(): Este método inicializa el controlador, estableciendo el modo en función de los parámetros de la solicitud GET y obteniendo los datos de la función si es necesario.

Método handleError(): Este método redirige al usuario a la página de lista de funciones con un mensaje de error en caso de que ocurra algún error durante el procesamiento.

Método validateFormData(): Este método valida los datos enviados a través del formulario, verificando si los campos obligatorios están presentes y maneja los errores si es necesario.

Método processAction(): Este método procesa la acción realizada por el usuario, ya sea insertar, actualizar o eliminar una función, según el modo en que se encuentre el formulario.

Método prepareViewData(): Este método prepara los datos necesarios para renderizar la vista, incluyendo los datos de las funciones, los mensajes de error, los tokens XSS y otros datos relacionados con la interfaz de usuario.

Método render(): Este método renderiza la vista correspondiente utilizando el motor de renderización Renderer y pasa los datos preparados en el array $this->viewData. */
namespace Controllers\Funcioness;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Funcioness\Funcioness as DAOFunciones;
use Utilities\Site;
use Utilities\Validators;

class Funcioness extends PrivateController
{
    private $fncod;
    private $fndsc;
    private $fnest;
    private $fntyp;
    private $funciones = [
        "fncod" => "",
        "fndsc" => "",
        "fnest" => "",
        "fntyp" => ""
    ];
    private $listUrl = "index.php?page=Funcioness_Funciones";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_funciones = '';
    private $modes = [
        "INS" => "Creando nueva funciones",
        "UPD" => "Editando funciones",
        "DEL" => "Eliminando funciones",
        "DSP" => "Detalle funciones"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->funciones['fncod'] = $_POST['fncod'];
                $this->funciones['fndsc'] = $_POST['fndsc'];
                $this->funciones['fnest'] = $_POST['fnest'];
                $this->funciones['fntyp'] = $_POST['fntyp'];
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
                    if (isset($_GET["fncod"])) {
                        $this->funciones = DAOFunciones::obtenerPorId(strval($_GET["fncod"]));
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
        if (isset($_POST["xss_token_funciones"])) {
            $this->xss_token_funciones = $_POST["xss_token_funciones"];
            if ($_SESSION["xss_token_funciones"] !== $this->xss_token_funciones) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["fncod"])) {
            $this->error["fncod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fndsc"])) {
            $this->error["fndsc_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fnest"])) {
            $this->error["fnest_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fntyp"])) {
            $this->error["fntyp_error"] = "Campo es requerido";
        }
     
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOFunciones::insertFunciones(
                    $this->funciones["fncod"],
                    $this->funciones["fndsc"],
                    $this->funciones["fnest"],
                    $this->funciones["fntyp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOFunciones::updateFunciones(
                    $this->funciones["fncod"],
                    $this->funciones["fndsc"],
                    $this->funciones["fnest"],
                    $this->funciones["fntyp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOFunciones::deleteFunciones(
                    $this->funciones["fncod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["funciones"] = $this->funciones;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["funciones"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_funciones = md5("funcioness_funciones" . date('Ymdhisu'));
        $_SESSION["xss_token_funciones"] = $this->xss_token_funciones;
        $this->viewData["xss_token_funciones"] = $this->xss_token_funciones;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("funcioness/funcionesform", $this->viewData);
    }
}