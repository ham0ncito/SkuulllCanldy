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
/**Este fragmento de código PHP define una clase llamada Subscription dentro del espacio de nombres Controllers\Subscriptions. Aquí tienes una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Subscriptions, lo que sugiere que esta clase se encarga de la lógica relacionada con las suscripciones en el sistema.

Clase Subscription: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accedidas solo por usuarios autenticados.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase. Dentro de este método, se añade un enlace de estilo llamado 'subscription_style', se preparan los datos de vista y se renderiza la vista de la lista de suscripciones.

Preparación de datos de vista ($viewData): Se inicializa un array $viewData que contiene las claves id_subscription, subscription_description, subscription_duration y subscription_price, que probablemente se utilizarán para mostrar información en la vista.

Verificación de permisos de usuario: Se verifica si el usuario actual tiene permisos de administrador. Si es así, se obtienen los datos de las suscripciones utilizando el método getSubscription() del DAO correspondiente y se añaden al array $viewData. Además, se establece un indicador isEmpty para indicar si la lista de suscripciones está vacía o no.

Verificación de roles de usuario: Se establecen indicadores en $viewData para los roles de usuario (isCLN, isCLS, isADMIN y isAUDIT) basados en los permisos del usuario actual.

Renderizado de la vista: Finalmente, se renderiza la vista de la lista de suscripciones utilizando el objeto Renderer. */
namespace Controllers\Subscriptions;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptions\Subscriptions as DAOSubscription;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Subscription extends PrivateController
{
    private $id_subscription;
    private $subscription_description;
    private $subscription_duration;
    private $subscription_price;

    public function run(): void
    {
        Site::addLink('subscription_style');
        $viewData['id_subscription'] = 'id_subscription';
        $viewData['subscription_description'] = 'subscription_description';
        $viewData['subscription_duration'] = 'subscription_duration';
        $viewData['subscription_price'] = 'subscription_price';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['subscription'] = DAOSubscription::getSubscription())) {
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
        Renderer::render("subscriptions/subscriptionlist", $viewData);
    }
}