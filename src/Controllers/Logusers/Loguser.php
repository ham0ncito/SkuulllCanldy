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
/*Este fragmento de código PHP define un controlador llamado Loguser dentro del espacio de nombres Controllers\Logusers. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Logusers, lo que sugiere que se ocupa de la gestión de logs relacionados con usuarios.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Logusers del espacio de nombres Dao\Logusers para acceder a los logs de usuarios. También utiliza la clase PrivateController del espacio de nombres Controllers y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar, procesar y preparar los datos para la vista, así como de renderizar la vista.

Inicialización de datos: El método run() inicializa los datos necesarios para la vista, como los códigos de usuario y de log, así como la fecha.

Preparación de datos para la vista: Prepara los datos necesarios para renderizar la vista, incluyendo los datos de los logs de usuarios y la información sobre los permisos de los usuarios.

Renderización de la vista: El método render() renderiza la plantilla de lista de logs de usuarios con los datos preparados para la vista. */
namespace Controllers\Logusers;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logusers\Logusers as DAOLoguser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Loguser extends PrivateController
{
    private $user_cod;
    private $log_cod;
    private $date;

    public function run(): void
    {
        Site::addLink('loguser_style');
        $viewData['user_cod'] = 'user_cod';
        $viewData['log_cod'] = 'log_cod';
        $viewData['date'] = 'date';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['loguser'] = DAOLoguser::getLoguser())) {
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
        Renderer::render("logusers/loguserlist", $viewData);
    }
}