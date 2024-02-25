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
Este fragmento de código PHP define una clase llamada Subscriptionuser dentro del espacio de nombres Controllers\Subscriptionusers. Aquí hay una descripción de lo que hace esta clase:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Subscriptionusers, lo que sugiere que esta clase se encarga de la lógica relacionada con los usuarios de suscripción en el sistema.

Clase Subscriptionuser: Esta clase extiende la clase PrivateController, lo que podría implicar que las funcionalidades proporcionadas por esta clase están destinadas a ser accedidas solo por usuarios autenticados.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de ejecutar la lógica principal de la clase. Dentro de este método, se añade un enlace de estilo llamado 'subscriptionuser_style', se preparan los datos de vista y se renderiza la vista de la lista de usuarios de suscripción.

Preparación de datos de vista ($viewData): Se inicializa un array $viewData que contiene las claves usercod, id_subscription, purchase_date_subscription, purchase_date_end y status_subscription, que probablemente se utilizarán para mostrar información en la vista.

Verificación de permisos de usuario: Se verifica si el usuario actual tiene permisos de administrador. Si es así, se obtienen los datos de los usuarios de suscripción utilizando el método getSubscriptionuser() del DAO correspondiente y se añaden al array $viewData. Además, se establece un indicador isEmpty para indicar si la lista de usuarios de suscripción está vacía o no.

Verificación de roles de usuario: Se establecen indicadores en $viewData para los roles de usuario (isCLN, isCLS, isADMIN y isAUDIT) basados en los permisos del usuario actual.

Renderizado de la vista: Finalmente, se renderiza la vista de la lista de usuarios de suscripción utilizando el objeto Renderer. */
namespace Controllers\Subscriptionusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Subscriptionusers\Subscriptionusers as DAOSubscriptionuser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Subscriptionuser extends PrivateController
{
    private $usercod;
    private $id_subscription;
    private $purchase_date_subscription;
    private $purchase_date_end;
    private $status_subscription;

    public function run(): void
    {
        Site::addLink('subscriptionuser_style');
        $viewData['usercod'] = 'usercod';
        $viewData['id_subscription'] = 'id_subscription';
        $viewData['purchase_date_subscription'] = 'purchase_date_subscription';
        $viewData['purchase_date_end'] = 'purchase_date_end';
        $viewData['status_subscription'] = 'status_subscription';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['subscriptionuser'] = DAOSubscriptionuser::getSubscriptionuser())) {
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
        Renderer::render("subscriptionusers/subscriptionuserlist", $viewData);
    }
}