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
Este archivo PHP define una clase llamada Roless dentro del espacio de nombres Controllers\Roless. Aquí tienes un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Roless, lo que sugiere que esta clase se encarga de la lógica relacionada con los roles.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Roless\Roless, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los roles, como el código de rol (rolescod), la descripción del rol (rolesdsc) y el estado del rol (rolesest).

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la acción, validar los datos del formulario si se ha enviado, preparar los datos para la vista y renderizarla.

Método init(): Se encarga de inicializar la acción, verificando si se ha proporcionado un modo válido y si es una acción de inserción (INS) o actualización (UPD). También obtiene los datos del rol si se está actualizando.

Método validateFormData(): Valida los datos del formulario, como el código de rol, la descripción del rol y el estado del rol. Si hay algún error de validación, se almacena en la propiedad $error.

Método processAction(): Procesa la acción según el modo (INS, UPD, DEL) especificado. Inserta, actualiza o elimina el rol según corresponda.

Método prepareViewData(): Prepara los datos necesarios para la vista, como el modo, los datos del rol, los mensajes de error, el token XSS y si el formulario debe mostrarse como de solo lectura o con confirmación.

Método render(): Renderiza la vista roless/rolesform con los datos preparados. */
namespace Controllers\Roless;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Roless\Roless as DAORoles;
use Utilities\Site;
use Utilities\Validators;

class Roless extends PrivateController
{
    private $rolescod;
    private $rolesdsc;
    private $rolesest;
    private $roles = [
        "rolescod" => "",
        "rolesdsc" => "",
        "rolesest" => ""
    ];
    private $listUrl = "index.php?page=Roless_Roles";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_roles = '';
    private $modes = [
        "INS" => "Creando nueva roles",
        "UPD" => "Editando roles",
        "DEL" => "Eliminando roles",
        "DSP" => "Detalle roles"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->roles['rolescod'] = $_POST['rolescod'];
                $this->roles['rolesdsc'] = $_POST['rolesdsc'];
                $this->roles['rolesest'] = $_POST['rolesest'];
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
                        $this->roles = DAORoles::obtenerPorId(strval($_GET["rolescod"]));
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
        if (isset($_POST["xss_token_roles"])) {
            $this->xss_token_roles = $_POST["xss_token_roles"];
            if ($_SESSION["xss_token_roles"] !== $this->xss_token_roles) {
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
        if (Validators::IsEmpty($_POST["rolesdsc"])) {
            $this->error["rolesdsc_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["rolesest"])) {
            $this->error["rolesest_error"] = "Campo es requerido";
        }
     

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAORoles::insertRoles(
                    $this->roles["rolescod"],
                    $this->roles["rolesdsc"],
                    $this->roles["rolesest"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAORoles::updateRoles(
                    $this->roles["rolescod"],
                    $this->roles["rolesdsc"],
                    $this->roles["rolesest"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAORoles::deleteRoles(
                    $this->roles["rolescod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Roles eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["roles"] = $this->roles;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
           
            
        }
        //$this->viewData["roles"][$this->roles["status"]."_selected"] = 'selected';
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["roles"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_roles = md5("roless_roles" . date('Ymdhisu'));
        $_SESSION["xss_token_roles"] = $this->xss_token_roles;
        $this->viewData["xss_token_roles"] = $this->xss_token_roles;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("roless/rolesform", $this->viewData);
    }
}