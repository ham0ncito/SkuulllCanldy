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
/*Este controlador PHP gestiona las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) de registros de bitácora, permitiendo la creación, edición y eliminación de entradas de bitácora. Utiliza un modelo de datos de bitácora proporcionado por la clase DAOBitacora y maneja la validación de datos de entrada antes de procesar las acciones solicitadas. Además, controla la generación de tokens XSS para prevenir ataques de tipo Cross-Site Scripting (XSS). */
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

namespace Controllers\Bitacoras;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;

class Bitacoras extends PrivateController
{
    private $bitacoracod;
    private $bitacorafch;
    private $bitprograma;
    private $bitdescripcion;
    private $bitobservacion;
    private $bitTipo;
    private $bitusuario;
    private $bitacora = [
        "bitacoracod" => "",
        "bitacorafch" => "",
        "bitprograma" => "",
        "bitdescripcion" => "",
        "bitobservacion" => "",
        "bittipo" => "",
        "bitusuario" => ""
    ];
    private $listUrl = "index.php?page=Bitacoras_Bitacora";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_bitacora = '';
    private $modes = [
        "INS" => "Creando nueva bitacora",
        "UPD" => "Editando bitacora",
        "DEL" => "Eliminando bitacora",
        "DSP" => "Detalle bitacora"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->bitacora['bitacoracod'] = $_POST['bitacoracod'];
                $this->bitacora['bitacorafch'] = $_POST['bitacorafch'];
                $this->bitacora['bitprograma'] = $_POST['bitprograma'];
                $this->bitacora['bitdescripcion'] = $_POST['bitdescripcion'];
                $this->bitacora['bitobservacion'] = $_POST['bitobservacion'];
                $this->bitacora['bittipo'] = $_POST['bittipo'];
                $this->bitacora['bitusuario'] = $_POST['bitusuario'];
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
                    if (isset($_GET["bitacoracod"])) {
                        $this->bitacora = DAOBitacora::obtenerPorId(strval($_GET["bitacoracod"]));
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
        if (isset($_POST["xss_token_bitacora"])) {
            $this->xss_token_bitacora = $_POST["xss_token_bitacora"];
            if ($_SESSION["xss_token_bitacora"] !== $this->xss_token_bitacora) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["bitacoracod"])) {
            $this->error["bitacoracod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bitacorafch"])) {
            $this->error["bitacorafch_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bitprograma"])) {
            $this->error["bitprograma_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bitdescripcion"])) {
            $this->error["bitdescripcion_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bitobservacion"])) {
            $this->error["bitobservacion_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bittipo"])) {
            $this->error["bittipo_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["bitusuario"])) {
            $this->error["bitusuario_error"] = "Campo es requerido";
        }


        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOBitacora::insertBitacora(
                    $this->bitacora["bitacoracod"],
                    $this->bitacora["bitacorafch"],
                    $this->bitacora["bitprograma"],
                    $this->bitacora["bitdescripcion"],
                    $this->bitacora["bitobservacion"],
                    $this->bitacora["bittipo"],
                    $this->bitacora["bitusuario"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Bitacora creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOBitacora::updateBitacora(
                    $this->bitacora["bitacoracod"],
                    $this->bitacora["bitacorafch"],
                    $this->bitacora["bitprograma"],
                    $this->bitacora["bitdescripcion"],
                    $this->bitacora["bitobservacion"],
                    $this->bitacora["bittipo"],
                    $this->bitacora["bitusuario"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Bitacora actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOBitacora::deleteBitacora(
                    $this->bitacora["bitacoracod"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Bitacora eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["bitacora"] = $this->bitacora;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["bitacora"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_bitacora = md5("bitacoras_bitacora" . date('Ymdhisu'));
        $_SESSION["xss_token_bitacora"] = $this->xss_token_bitacora;
        $this->viewData["xss_token_bitacora"] = $this->xss_token_bitacora;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("bitacoras/bitacoraform", $this->viewData);
    }
}