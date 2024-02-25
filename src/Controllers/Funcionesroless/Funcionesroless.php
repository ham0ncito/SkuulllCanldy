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
/*Este controlador PHP, llamado "Funcionesroless", se encarga de gestionar las funciones relacionadas con roles de skullcanldy. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página de gestión de funciones relacionadas con roles. Inicializa los datos necesarios y verifica si se está enviando un formulario mediante el método POST. Si es así, valida los datos del formulario y procesa la acción correspondiente. Luego, prepara los datos necesarios para renderizar la vista y la muestra.

init(): Este método inicializa el controlador, verificando si se proporciona un modo de operación válido a través de la URL y obteniendo los datos de la función relacionada con roles si es necesario.

handleError(): Este método redirige al usuario a la página de listado de funciones relacionadas con roles con un mensaje de error en caso de que ocurra un problema durante la ejecución.

validateFormData(): Este método valida los datos enviados a través del formulario, como el código de roles, el código de función, el rol de función y la explicación de la función. Si hay errores de validación, los almacena en el array $error.

processAction(): Este método procesa la acción según el modo de operación especificado (INS para insertar, UPD para actualizar, DEL para eliminar). Realiza la operación correspondiente en la base de datos y redirige al usuario a la página de listado de funciones relacionadas con roles con un mensaje apropiado.

prepareViewData(): Este método prepara los datos necesarios para renderizar la vista. Incluye el modo de operación, los datos de la función relacionada con roles, los permisos de usuario y un token XSS para protección contra ataques CSRF.

render(): Este método renderiza la vista "funciones_rolesform" utilizando el motor de renderización Renderer, pasando los datos preparados en el array $viewData. */
namespace Controllers\Funcionesroless;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Funcionesroless\Funcionesroless as DAOFuncionesroles;
use Utilities\Site;
use Utilities\Validators;

class Funcionesroless extends PrivateController
{
    private $rolescod;
    private $fncod;
    private $fnrolest;
    private $fnexp;
    private $funciones_roles = [
        "rolescod" => "",
        "fncod" => "",
        "fnrolest" => "",
        "fnexp" => ""
    ];
    private $listUrl = "index.php?page=Funcionesroless_Funcionesroles";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_funciones_roles = '';
    private $modes = [
        "INS" => "Creando nueva funciones_roles",
        "UPD" => "Editando funciones_roles",
        "DEL" => "Eliminando funciones_roles",
        "DSP" => "Detalle funciones_roles"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->funciones_roles['rolescod'] = $_POST['rolescod'];
                $this->funciones_roles['fncod'] = $_POST['fncod'];
                $this->funciones_roles['fnrolest'] = $_POST['fnrolest'];
                $this->funciones_roles['fnexp'] = $_POST['fnexp'];
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
                    if (isset($_GET["rolescod"])) {
                        $this->funciones_roles = DAOFuncionesroles::obtenerPorId(strval($_GET["rolescod"]));
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
        if (isset($_POST["xss_token_funciones_roles"])) {
            $this->xss_token_funciones_roles = $_POST["xss_token_funciones_roles"];
            if ($_SESSION["xss_token_funciones_roles"] !== $this->xss_token_funciones_roles) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["rolescod"])) {
            $this->error["rolescod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fncod"])) {
            $this->error["fncod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fnrolest"])) {
            $this->error["fnrolest_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["fnexp"])) {
            $this->error["fnexp_error"] = "Campo es requerido";
        }
       
        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOFuncionesroles::insertFunciones_roles(
                    $this->funciones_roles["rolescod"],
                    $this->funciones_roles["fncod"],
                    $this->funciones_roles["fnrolest"],
                    $this->funciones_roles["fnexp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones_roles creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOFuncionesroles::updateFunciones_roles(
                    $this->funciones_roles["rolescod"],
                    $this->funciones_roles["fncod"],
                    $this->funciones_roles["fnrolest"],
                    $this->funciones_roles["fnexp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones_roles actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOFuncionesroles::deleteFunciones_roles(
                    $this->funciones_roles["rolescod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Funciones_roles eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["funciones_roles"] = $this->funciones_roles;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
         
        }
          foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["funciones_roles"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_funciones_roles = md5("funciones_roless_funciones_roles" . date('Ymdhisu'));
        $_SESSION["xss_token_funciones_roles"] = $this->xss_token_funciones_roles;
        $this->viewData["xss_token_funciones_roles"] = $this->xss_token_funciones_roles;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("funciones_roless/funciones_rolesform", $this->viewData);
    }
}