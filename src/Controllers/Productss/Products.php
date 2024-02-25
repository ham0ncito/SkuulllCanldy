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
/*Este archivo PHP define una clase llamada Products dentro del espacio de nombres Controllers\Productss. Aquí hay un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Productss, lo que sugiere que esta clase se encarga de la lógica relacionada con la gestión de productos.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Productss\Productss, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los productos, como el ID del producto (productId), el nombre (productName), la descripción (productDescription), el precio (productPrice), la URL de la imagen (productImgUrl), el stock (productStock) y el estado (productStatus).

Inicialización y renderización de la vista: El método run() se encarga de inicializar la clase, preparar los datos necesarios para la vista y luego renderizar la vista correspondiente.

Obtención de datos de productos: La clase obtiene los datos de los productos utilizando el DAO (Objeto de Acceso a Datos) DAOProducts::getProducts() y los pasa a la vista para ser mostrados.

Verificación de permisos de usuario: La clase verifica si el usuario tiene permisos de administrador para acceder a la lista de productos.

Preparación de datos para la vista: La clase prepara los datos necesarios para renderizar la vista, incluyendo los datos de los productos, indicadores de vacío, y los permisos de usuario.

Renderización de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el renderizador de vistas proporcionado. */
namespace Controllers\Productss;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Productss\Productss as DAOProducts;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Products extends PrivateController
{
    private $productId;
    private $productName;
    private $productDescription;
    private $productPrice;
    private $productImgUrl;
    private $productStock;
    private $productStatus;

    public function run(): void
    {
        Site::addLink('products_style');
        $viewData['productId'] = 'productId';
        $viewData['productName'] = 'productName';
        $viewData['productDescription'] = 'productDescription';
        $viewData['productPrice'] = 'productPrice';
        $viewData['productImgUrl'] = 'productImgUrl';
        $viewData['productStock'] = 'productStock';
        $viewData['productStatus'] = 'productStatus';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['products'] = DAOProducts::getProducts())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("productss/productslist", $viewData);
    }
}