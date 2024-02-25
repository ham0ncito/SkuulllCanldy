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
/*Este fragmento de código PHP define un controlador llamado Offer dentro del espacio de nombres Controllers\Offers. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Offers, lo que sugiere que se ocupa de la gestión de ofertas dentro de la aplicación.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Offer del espacio de nombres Dao\Offers para acceder a las ofertas. También utiliza la clase PrivateController del espacio de nombres Controllers y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar, procesar y preparar los datos para la vista, así como de renderizar la vista.

Inicialización de datos: El método run() inicializa los datos necesarios para la vista, como el ID de la oferta, la descripción de la oferta, las fechas de inicio y fin de la oferta, y el estado de la oferta.

Preparación de datos para la vista: Prepara los datos necesarios para renderizar la vista, incluyendo los datos de las ofertas y la información sobre los permisos de los usuarios.

Renderización de la vista: El método render() renderiza la plantilla de la lista de ofertas con los datos preparados para la vista. */
namespace Controllers\Offers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Offers\Offers as DAOOffer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Offer extends PrivateController
{
    private $id_offer;
    private $offer_description;
    private $offer_starts_at;
    private $offer_ends_at;
    private $offer_status;

    public function run(): void
    {
        Site::addLink('offer_style');
        $viewData['id_offer'] = 'id_offer';
        $viewData['offer_description'] = 'offer_description';
        $viewData['offer_starts_at'] = 'offer_starts_at';
        $viewData['offer_ends_at'] = 'offer_ends_at';
        $viewData['offer_status'] = 'offer_status';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['offer'] = DAOOffer::getOffer())) {
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
        Renderer::render("offers/offerlist", $viewData);
    }
}