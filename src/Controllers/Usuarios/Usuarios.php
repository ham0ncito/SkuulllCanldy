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
/*Este fragmento de código PHP define una clase llamada Usuarios dentro del espacio de nombres Controllers\Usuarios. Aquí está una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Usuarios, lo que sugiere que forma parte de un conjunto de controladores relacionados con usuarios en la aplicación.

Clase Usuarios: Esta clase extiende la clase PrivateController, lo que indica que probablemente se requiera autenticación para acceder a las funcionalidades relacionadas con los usuarios.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los campos de un usuario, como usercod, useremail, username, userpswd, entre otros. También tiene un arreglo llamado usuario que contiene los valores por defecto de estos campos.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la clase, procesar los datos recibidos en caso de una petición POST, preparar los datos de vista y renderizar la vista correspondiente.

Renderizado de vista: La clase utiliza el objeto Renderer para renderizar la vista usuarioform con los datos preparados. */

namespace Controllers\Usuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Usuarios\Usuarios as DAOUsuario;
use Utilities\Site;
use Utilities\Validators;

class Usuarios extends PrivateController
{
    private $usercod;
    private $useremail;
    private $username;
    private $userpswd;
    private $userfching;
    private $userpswdest;
    private $userpswdexp;
    private $userest;
    private $useractcod;
    private $userpswdchg;
    private $usertipo;
    private $usuario = [
        "usercod" => "",
        "useremail" => "",
        "username" => "",
        "userpswd" => "",
        "userfching" => "",
        "userpswdest" => "",
        "userpswdexp" => "",
        "userest" => "",
        "useractcod" => "",
        "userpswdchg" => "",
        "usertipo" => ""
    ];
    private $listUrl = "index.php?page=Usuarios_Usuario";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_usuario = '';
    private $modes = [
        "INS" => "Creando nueva usuario",
        "UPD" => "Editando usuario",
        "DEL" => "Eliminando usuario",
        "DSP" => "Detalle usuario"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->usuario['usercod'] = $_POST['usercod'];
                $this->usuario['useremail'] = $_POST['useremail'];
                $this->usuario['username'] = $_POST['username'];
                $this->usuario['userpswd'] = $_POST['userpswd'];
                $this->usuario['userfching'] = $_POST['userfching'];
                $this->usuario['userpswdest'] = $_POST['userpswdest'];
                $this->usuario['userpswdexp'] = $_POST['userpswdexp'];
                $this->usuario['userest'] = $_POST['userest'];
                $this->usuario['useractcod'] = $_POST['useractcod'];
                $this->usuario['userpswdchg'] = $_POST['userpswdchg'];
                $this->usuario['usertipo'] = $_POST['usertipo'];
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
                        $this->usuario = DAOUsuario::obtenerPorId(strval($_GET["usercod"]));
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
        if (isset($_POST["xss_token_usuario"])) {
            $this->xss_token_usuario = $_POST["xss_token_usuario"];
            if ($_SESSION["xss_token_usuario"] !== $this->xss_token_usuario) {
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
        if (Validators::IsEmpty($_POST["useremail"])) {
            $this->error["useremail_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["username"])) {
            $this->error["username_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userpswd"])) {
            $this->error["userpswd_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userfching"])) {
            $this->error["userfching_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userpswdest"])) {
            $this->error["userpswdest_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userpswdexp"])) {
            $this->error["userpswdexp_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userest"])) {
            $this->error["userest_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["useractcod"])) {
            $this->error["useractcod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["userpswdchg"])) {
            $this->error["userpswdchg_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["usertipo"])) {
            $this->error["usertipo_error"] = "Campo es requerido";
        }
        

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOUsuario::insertUsuario(
                    $this->usuario["usercod"],
                    $this->usuario["useremail"],
                    $this->usuario["username"],
                    $this->usuario["userpswd"],
                    $this->usuario["userfching"],
                    $this->usuario["userpswdest"],
                    $this->usuario["userpswdexp"],
                    $this->usuario["userest"],
                    $this->usuario["useractcod"],
                    $this->usuario["userpswdchg"],
                    $this->usuario["usertipo"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Usuario creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOUsuario::updateUsuario(
                    $this->usuario["usercod"],
                    $this->usuario["useremail"],
                    $this->usuario["username"],
                    $this->usuario["userpswd"],
                    $this->usuario["userfching"],
                    $this->usuario["userpswdest"],
                    $this->usuario["userpswdexp"],
                    $this->usuario["userest"],
                    $this->usuario["useractcod"],
                    $this->usuario["userpswdchg"],
                    $this->usuario["usertipo"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Usuario actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOUsuario::deleteUsuario(
                    $this->usuario["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Usuario eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["usuario"] = $this->usuario;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
            
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["usuario"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_usuario = md5("usuarios_usuario" . date('Ymdhisu'));
        $_SESSION["xss_token_usuario"] = $this->xss_token_usuario;
        $this->viewData["xss_token_usuario"] = $this->xss_token_usuario;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("usuarios/usuarioform", $this->viewData);
    }
}