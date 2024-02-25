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
Este fragmento de código PHP define una clase llamada Offersubscription en el espacio de nombres Controllers\Offersubscriptions. Aquí está un resumen de lo que hace esta clase:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Offersubscriptions, lo que sugiere que esta clase maneja la lógica relacionada con las suscripciones de ofertas.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Offersubscriptions\Offersubscriptions, Utilities\Site, Utilities\Validators, Utilities\Context, y Utilities\Paging.

Propiedades privadas: La clase tiene propiedades privadas que representan los datos relacionados con las suscripciones de ofertas, como el ID de oferta (id_offer), el ID de suscripción (id_subscription), y el precio de la oferta (price_offer).

Método run(): Este método es el punto de entrada de la clase. Añade un enlace al estilo de la suscripción de oferta, prepara datos para la vista y renderiza la vista correspondiente.

Preparación de datos para la vista: El método prepara los datos necesarios para la vista, como los datos de la oferta, y determina si la lista de suscripciones a ofertas está vacía o no.

Renderizado de la vista: El método render() renderiza la vista correspondiente utilizando el Renderer y pasa los datos preparados para la vista. */
namespace Controllers\Offersubscriptions;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offersubscriptions\Offersubscriptions as DAOOffersubscription;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Offersubscription extends PrivateController
{
    private $id_offer;
    private $id_subscription;
    private $price_offer;

    public function run(): void
    {
        Site::addLink('offersubscription_style');
        $viewData['id_offer'] = 'id_offer';
        $viewData['id_subscription'] = 'id_subscription';
        $viewData['price_offer'] = 'price_offer';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['offersubscription'] = DAOOffersubscription::getOffersubscription())) {
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
        Renderer::render("offersubscriptions/offersubscriptionlist", $viewData);
    }
}