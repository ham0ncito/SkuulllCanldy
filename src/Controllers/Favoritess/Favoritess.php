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
/*Este controlador PHP, llamado "Favoritess", se encarga de gestionar la creación, edición y eliminación de favoritos de skullcanldy. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página de gestión de favoritos. Inicializa los datos necesarios, valida los datos del formulario si se ha enviado un POST y procesa la acción correspondiente.

init(): Este método inicializa el modo de operación del controlador según los parámetros recibidos en la URL. Si el modo no está definido correctamente, muestra un mensaje de error y redirige al usuario.

validateFormData(): Este método valida los datos del formulario enviado por POST. Comprueba si los campos requeridos están vacíos y, si es así, establece mensajes de error correspondientes.

processAction(): Este método procesa la acción según el modo de operación del controlador. Inserta, actualiza o elimina un favorito en la base de datos utilizando los métodos proporcionados por la clase DAOFavorites.

prepareViewData(): Este método prepara los datos necesarios para renderizar la vista. Incluye el modo de operación, los datos del favorito, mensajes de error, y el token de protección contra XSS.

render(): Este método renderiza la vista correspondiente al formulario de gestión de favoritos, pasando los datos preparados anteriormente.
 */
namespace Controllers\Favoritess;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Favoritess\Favoritess as DAOFavorites;
use Utilities\Site;
use Utilities\Validators;

class Favoritess extends PrivateController
{
    private $id_favorite;
    private $usercod;
    private $id_reference;
    private $type_favorite;
    private $favorites = [
        "id_favorite" => "",
        "usercod" => "",
        "id_reference" => "",
        "type_favorite" => ""
    ];
    private $listUrl = "index.php?page=Favoritess_Favorites";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_favorites = '';
    private $modes = [
        "INS" => "Creando nueva favorites",
        "UPD" => "Editando favorites",
        "DEL" => "Eliminando favorites",
        "DSP" => "Detalle favorites"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->favorites['id_favorite'] = $_POST['id_favorite'];
                $this->favorites['usercod'] = $_POST['usercod'];
                $this->favorites['id_reference'] = $_POST['id_reference'];
                $this->favorites['type_favorite'] = $_POST['type_favorite'];
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
                    if (isset($_GET["id_favorite"])) {
                        $this->favorites = DAOFavorites::obtenerPorId(strval($_GET["id_favorite"]));
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
        if (isset($_POST["xss_token_favorites"])) {
            $this->xss_token_favorites = $_POST["xss_token_favorites"];
            if ($_SESSION["xss_token_favorites"] !== $this->xss_token_favorites) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["id_favorite"])) {
            $this->error["id_favorite_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["usercod"])) {
            $this->error["usercod_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["id_reference"])) {
            $this->error["id_reference_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["type_favorite"])) {
            $this->error["type_favorite_error"] = "Campo es requerido";
        }

        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOFavorites::insertFavorites(
                    $this->favorites["id_favorite"],
                    $this->favorites["usercod"],
                    $this->favorites["id_reference"],
                    $this->favorites["type_favorite"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Favorites creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOFavorites::updateFavorites(
                    $this->favorites["id_favorite"],
                    $this->favorites["usercod"],
                    $this->favorites["id_reference"],
                    $this->favorites["type_favorite"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Favorites actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOFavorites::deleteFavorites(
                    $this->favorites["id_favorite"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Favorites eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["favorites"] = $this->favorites;
        if ($this->mode == "INS") {
            $this->viewData["modedsc"] = $this->modes[$this->mode];
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        } else {
        }

        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["favorites"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_favorites = md5("favoritess_favorites" . date('Ymdhisu'));
        $_SESSION["xss_token_favorites"] = $this->xss_token_favorites;
        $this->viewData["xss_token_favorites"] = $this->xss_token_favorites;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("favoritess/favoritesform", $this->viewData);
    }
}