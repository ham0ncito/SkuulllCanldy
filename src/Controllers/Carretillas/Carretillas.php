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

namespace Controllers\Carretillas;
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
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Carretillas\Carretillas as DAOCarretilla;
use Utilities\Site;
use Utilities\Validators;
/*Este controlador PHP maneja las operaciones relacionadas con la gestión de carretillas de compras. Permite crear, editar, eliminar y ver detalles de las carretillas. Utiliza la clase `DAOCarretilla` para interactuar con la base de datos y obtener la información necesaria. La seguridad del acceso se gestiona mediante la clase `Security` del espacio de nombres `Dao\Security`. La vista asociada se renderiza utilizando el motor de plantillas `Renderer`. El controlador valida los datos del formulario antes de procesar cualquier acción, asegurando que los campos requeridos estén presentes y no estén vacíos. */
class Carretillas extends PrivateController
{
    private $usercod;
    private $productId;
    private $crrctd;
    private $crrprc;
    private $crrfching;
    private $carretilla = [
        "usercod" => "",
        "productid" => "",
        "crrctd" => "",
        "crrprc" => "",
        "crrfching" => ""
    ];
    private $listUrl = "index.php?page=Carretillas_Carretilla";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_carretilla = '';
    private $modes = [
        "INS" => "Creando nueva carretilla",
        "UPD" => "Editando carretilla",
        "DEL" => "Eliminando carretilla",
        "DSP" => "Detalle carretilla"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->carretilla['usercod'] = $_POST['usercod'];
                $this->carretilla['productid'] = $_POST['productid'];
                $this->carretilla['crrctd'] = $_POST['crrctd'];
                $this->carretilla['crrprc'] = $_POST['crrprc'];
                $this->carretilla['crrfching'] = $_POST['crrfching'];
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
                        $this->carretilla = DAOCarretilla::obtenerPorId(strval($_GET["usercod"]));
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
        if (isset($_POST["xss_token_carretilla"])) {
            $this->xss_token_carretilla = $_POST["xss_token_carretilla"];
            if ($_SESSION["xss_token_carretilla"] !== $this->xss_token_carretilla) {
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
        if (Validators::IsEmpty($_POST["productid"])) {
            $this->error["productid_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["crrctd"])) {
            $this->error["crrctd_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["crrprc"])) {
            $this->error["crrprc_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["crrfching"])) {
            $this->error["crrfching_error"] = "Campo es requerido";
        }

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOCarretilla::insertCarretilla(
                    $this->carretilla["usercod"],
                    $this->carretilla["productid"],
                    $this->carretilla["crrctd"],
                    $this->carretilla["crrprc"],
                    $this->carretilla["crrfching"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Carretilla creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOCarretilla::updateCarretilla(
                    $this->carretilla["usercod"],
                    $this->carretilla["productid"],
                    $this->carretilla["crrctd"],
                    $this->carretilla["crrprc"],
                    $this->carretilla["crrfching"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Carretilla actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOCarretilla::deleteCarretilla(
                    $this->carretilla["usercod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Carretilla eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["carretilla"] = $this->carretilla;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }
        //$this->viewData["carretilla"][$this->carretilla["status"]."_selected"] = 'selected';
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["carretilla"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_carretilla = md5("carretillas_carretilla" . date('Ymdhisu'));
        $_SESSION["xss_token_carretilla"] = $this->xss_token_carretilla;
        $this->viewData["xss_token_carretilla"] = $this->xss_token_carretilla;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("carretillas/carretillaform", $this->viewData);
    }
}