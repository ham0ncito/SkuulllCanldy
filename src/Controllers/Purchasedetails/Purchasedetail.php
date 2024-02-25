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
Este archivo PHP define una clase llamada Purchasedetail dentro del espacio de nombres Controllers\Purchasedetails. Aquí está un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Purchasedetails, lo que sugiere que esta clase se encarga de la lógica relacionada con los detalles de las compras.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Purchasedetails\Purchasedetails, Utilities\Site y Utilities\Validators.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con los detalles de una compra, como el ID de compra (id_purchase), el ID del artículo de referencia (id_item_reference), la cantidad (quantity) y el precio unitario (unitary_price).

Inicialización y renderización de la vista: El método run() se encarga de agregar un enlace al estilo de los detalles de compra, obtener los detalles de compra utilizando el método getPurchasedetail() proporcionado por la clase DAOPurchasedetail, y luego renderizar la vista purchasedetails/purchasedetaillist con los datos recuperados */
namespace Controllers\Purchasedetails;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as DAOPurchasedetail;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Purchasedetail extends PrivateController {
  private $id_purchase;
  private $id_item_reference;
  private $quantity;
  private $unitary_price;

    public function run(): void
    {
        Site::addLink('purchasedetail_style');
        $viewData['id_purchase'] = 'id_purchase';
		$viewData['id_item_reference'] = 'id_item_reference';
		$viewData['quantity'] = 'quantity';
		$viewData['unitary_price'] = 'unitary_price';
		$viewData['purchasedetail']= DAOPurchasedetail::getPurchasedetail();
        Renderer::render("purchasedetails/purchasedetaillist", $viewData);
    }
}