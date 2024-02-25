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

namespace Controllers\Productss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Productss\Productss as DAOProducts;
use Utilities\Site;
use Utilities\Validators;
/*Este archivo PHP define una clase llamada Productss dentro del espacio de nombres Controllers\Productss. Aquí hay un resumen de lo que hace esta clase:



Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Productss, lo que sugiere que esta clase se encarga de la lógica relacionada con la gestión de productos.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Productss\Productss, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los productos, como el ID del producto (productId), el nombre (productName), la descripción (productDescription), el precio (productPrice), la URL de la imagen (productImgUrl), el stock (productStock) y el estado (productStatus).

Inicialización y renderización de la vista: El método run() se encarga de inicializar la clase, preparar los datos necesarios para la vista y luego renderizar la vista correspondiente.

Obtención de datos de productos: La clase obtiene los datos de los productos utilizando el DAO (Objeto de Acceso a Datos) DAOProducts::obtenerPorId() y los pasa a la vista para ser mostrados.

Verificación de permisos de usuario: La clase verifica si el usuario tiene permisos adecuados para acceder a la lista de productos y realizar operaciones en ellos.

Preparación de datos para la vista: La clase prepara los datos necesarios para renderizar la vista, incluyendo los datos de los productos, indicadores de modo, mensajes de error y tokens XSS para evitar ataques de tipo Cross-Site Scripting.

Renderización de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el renderizador de vistas proporcionado. */
class Productss extends PrivateController
{
    private $productId;
    private $productName;
    private $productDescription;
    private $productPrice;
    private $productImgUrl;
    private $productStock;
    private $productStatus;
    private $products = [
        "productid" => "",
        "productname" => "",
        "productdescription" => "",
        "productprice" => "",
        "productimgurl" => "",
        "productstock" => "",
        "productstatus" => ""
    ];
    private $listUrl = "index.php?page=Productss_Products";
    private $mode = 'INS';
    private $viewData = [];
    private $error = [];
    private $xss_token_products = '';
    private $modes = [
        "INS" => "Creando nueva products",
        "UPD" => "Editando products",
        "DEL" => "Eliminando products",
        "DSP" => "Detalle products"
    ];

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            if ($this->validateFormData()) {
                $this->products['productid'] = $_POST['productid'];
                $this->products['productname'] = $_POST['productname'];
                $this->products['productdescription'] = $_POST['productdescription'];
                $this->products['productprice'] = $_POST['productprice'];
                $this->products['productimgurl'] = $_POST['productimgurl'];
                $this->products['productstock'] = $_POST['productstock'];
                $this->products['productstatus'] = $_POST['productstatus'];
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
                    if (isset($_GET["productId"])) {
                        $this->products = DAOProducts::obtenerPorId(strval($_GET["productId"]));
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
        if (isset($_POST["xss_token_products"])) {
            $this->xss_token_products = $_POST["xss_token_products"];
            if ($_SESSION["xss_token_products"] !== $this->xss_token_products) {
                $this->handleError("Error al procesar la peticion");
                return false;
            }
        } else {
            $this->handleError("Error al procesar la peticion");
            return false;
        }
        if (Validators::IsEmpty($_POST["productid"])) {
            $this->error["productid_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productname"])) {
            $this->error["productname_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productdescription"])) {
            $this->error["productdescription_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productprice"])) {
            $this->error["productprice_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productimgurl"])) {
            $this->error["productimgurl_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productstock"])) {
            $this->error["productstock_error"] = "Campo es requerido";
        }
        if (Validators::IsEmpty($_POST["productstatus"])) {
            $this->error["productstatus_error"] = "Campo es requerido";
        }


        return count($this->error) == 0;
    }

    private function processAction()
    {
        switch ($this->mode) {
            case 'INS':
                if (DAOProducts::insertProducts(
                    $this->products["productid"],
                    $this->products["productname"],
                    $this->products["productdescription"],
                    $this->products["productprice"],
                    $this->products["productimgurl"],
                    $this->products["productstock"],
                    $this->products["productstatus"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Products creada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'UPD':
                if (DAOProducts::updateProducts(
                    $this->products["productid"],
                    $this->products["productname"],
                    $this->products["productdescription"],
                    $this->products["productprice"],
                    $this->products["productimgurl"],
                    $this->products["productstock"],
                    $this->products["productstatus"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Products actualizada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
            case 'DEL':
                if (DAOProducts::deleteProducts(
                    $this->products["productId"]
                )) {
                    Site::redirectToWithMsg($this->listUrl, "Products eliminada exitosamente.");
                } else {
                    Site::redirectToWithMsg($this->listUrl, "Hubo un error.");
                }
                break;
        }
    }


    private function prepareViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["products"] = $this->products;
        if ($this->mode == "INS") {
            $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
            $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
            $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
            $this->viewData["modedsc"] = $this->modes[$this->mode];
        } else {
        }
        foreach ($this->error as $key => $error) {
            if ($error !== null) {
                $this->viewData["products"][$key] = $error;
            }
        }
        $this->viewData["readonly"] = in_array($this->mode, ["DSP", "DEL"]) ? 'readonly' : '';
        $this->viewData["showConfirm"] = $this->mode !== "DSP";
        $this->xss_token_products = md5("productss_products" . date('Ymdhisu'));
        $_SESSION["xss_token_products"] = $this->xss_token_products;
        $this->viewData["xss_token_products"] = $this->xss_token_products;
    }


    private function render()
    {
        $this->viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $this->viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $this->viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        Renderer::render("productss/productsform", $this->viewData);
    }
}