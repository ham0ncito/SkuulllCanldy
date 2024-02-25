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
/*Este código PHP define una clase llamada Rolesusuarioss dentro del espacio de nombres Controllers\Rolesusuarioss. Aquí tienes un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Rolesusuarioss, lo que sugiere que esta clase se encarga de la lógica relacionada con los roles de usuarios.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Rolesusuarioss\Rolesusuarioss, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los roles de usuarios, como el código de usuario (usercod), el código de rol (rolescod), el estado del rol de usuario (roleuserest), la fecha del rol de usuario (roleuserfch) y la expiración del rol de usuario (roleuserexp). También hay propiedades relacionadas con la lógica del formulario, como la URL de la lista de roles de usuarios, el modo de operación (mode), errores, y un token XSS.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la clase, procesar la acción según el modo (INS, UPD, DEL, DSP), preparar los datos para la vista y renderizarla.

Métodos privados init(), handleError(), validateFormData(), processAction(), prepareViewData() y render(): Estos métodos privados se encargan de inicializar la clase, manejar errores, validar los datos del formulario, procesar la acción según el modo, preparar los datos para la vista y renderizarla. */
namespace Controllers\Rolesusuarioss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Rolesusuarioss\Rolesusuarioss as DAORoles_usuarios;
use Utilities\Site;
use Utilities\Validators;

class Rolesusuarioss extends PrivateController
{
    private $usercod;
    private $rolescod;
    private $roleuserest;
    private $roleuserfch;
    private $roleuserexp;
    private $roles_usuarios = [
        "usercod" => "",
        "rolescod" => "",
        "roleuserest" => "",
        "roleuserfch" => "",
        "roleuserexp" => ""
    ];
    private $listUrl = "index.php?page=Roles_usuarioss_Roles_usuarios";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_roles_usuarios = '';
    private $modes = [
        "INS" => "Creando nueva roles_usuarios",
        "UPD" => "Editando roles_usuarios",
        "DEL" => "Eliminando roles_usuarios",
        "DSP" => "Detalle roles_usuarios"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->roles_usuarios['usercod'] = $_POST['usercod'];
                $this->roles_usuarios['rolescod'] = $_POST['rolescod'];
                $this->roles_usuarios['roleuserest'] = $_POST['roleuserest'];
                $this->roles_usuarios['roleuserfch'] = $_POST['roleuserfch'];
                $this->roles_usuarios['roleuserexp'] = $_POST['roleuserexp'];
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
                    if (isset($_GET["usercod"])) {
                        $this->roles_usuarios = DAORoles_usuarios::obtenerPorId(strval($_GET["usercod"]));
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
        if (isset($_POST["xss_token_roles_usuarios"])) {
            $this->xss_token_roles_usuarios = $_POST["xss_token_roles_usuarios"];
            if ($_SESSION["xss_token_roles_usuarios"] !== $this->xss_token_roles_usuarios) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["usercod"])) {
            $this->error["usercod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["rolescod"])) {
            $this->error["rolescod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["roleuserest"])) {
            $this->error["roleuserest_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["roleuserfch"])) {
            $this->error["roleuserfch_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["roleuserexp"])) {
            $this->error["roleuserexp_error"] = "Campo es requerido";
        }
      

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAORoles_usuarios::insertRoles_usuarios(
                    $this->roles_usuarios["usercod"],
                    $this->roles_usuarios["rolescod"],
                    $this->roles_usuarios["roleuserest"],
                    $this->roles_usuarios["roleuserfch"],
                    $this->roles_usuarios["roleuserexp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles_usuarios creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAORoles_usuarios::updateRoles_usuarios(
                    $this->roles_usuarios["usercod"],
                    $this->roles_usuarios["rolescod"],
                    $this->roles_usuarios["roleuserest"],
                    $this->roles_usuarios["roleuserfch"],
                    $this->roles_usuarios["roleuserexp"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles_usuarios actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAORoles_usuarios::deleteRoles_usuarios(
                    $this->roles_usuarios["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles_usuarios eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["roles_usuarios"] = $this->roles_usuarios;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
          
            
        }
        //$this->viewData["roles_usuarios"][$this->roles_usuarios["status"]."_selected"] = 'selected';
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["roles_usuarios"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_roles_usuarios = md5("roles_usuarioss_roles_usuarios" . date('Ymdhisu'));
        $_SESSION["xss_token_roles_usuarios"] = $this->xss_token_roles_usuarios;
        $this->viewData["xss_token_roles_usuarios"] = $this->xss_token_roles_usuarios;
    }


    private function render()
    {
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("roles_usuarioss/roles_usuariosform", $this->viewData);
    }
}