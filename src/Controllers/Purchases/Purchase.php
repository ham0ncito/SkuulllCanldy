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
Este archivo PHP define una clase llamada Purchase dentro del espacio de nombres Controllers\Purchases. Aquí está un resumen de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Purchases, lo que sugiere que esta clase se encarga de la lógica relacionada con las compras.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Controllers\PublicController, Views\Renderer, Dao\Purchasedetails\Purchasedetails, Dao\Purchases\Purchases, Utilities\Site, Utilities\Validators, Utilities\Context y Utilities\Paging.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con una compra, como el ID de compra (id_purchase), la fecha de compra (purchase_date), el total (total), los detalles (details) y los pagos (payments).

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de inicializar la acción, verificar el rol del usuario, obtener las compras correspondientes y renderizar la vista de lista de compras.

Obtención de datos de compra: Dependiendo del rol del usuario, se obtienen las compras de todos los usuarios si el usuario es un administrador, o solo las compras del usuario actual si no lo es.

Preparación de datos para la vista: Se preparan los datos necesarios para la vista, como el ID de compra, la fecha de compra, el total, los detalles y los pagos, así como indicadores de vacío y roles de usuario.

Renderización de la vista: Se renderiza la vista purchases/purchaselist con los datos preparados. */
namespace Controllers\Purchases;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Purchasedetails\Purchasedetails as detail; 
use Dao\Purchases\Purchases as DAOPurchase;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Purchase extends PrivateController
{
    private $id_purchase;
    private $purchase_date;
    private $total;
    private $details;
    private $payments;

    public function run(): void
    {
        Site::addLink('purchase_style');
        $viewData['id_purchase'] = 'id_purchase';
        $viewData['purchase_date'] = 'purchase_date';
        $viewData['total'] = 'total';
        $viewData['details'] = 'details';
        $viewData['payments'] = 'payments';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['purchase'] = DAOPurchase::getPurchase())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
            if (\Utilities\Functions::isAnEmptyArray( $viewData['purchase'] = DAOPurchase::getPurchaseByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail'])))) {
                $viewData['isEmpty'] = true;
            } else {
             
                $viewData['isEmpty'] = false;
            }
           
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("purchases/purchaselist", $viewData);
    }
}