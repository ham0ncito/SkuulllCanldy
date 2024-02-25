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

 /*Este fragmento de código PHP define un controlador llamado Lognonuser dentro del espacio de nombres Controllers\Lognonusers. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Lognonusers, lo que sugiere que se ocupa de la gestión de registros de usuarios no logueados.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Lognonusers del espacio de nombres Dao\Lognonusers para acceder a los registros de usuarios no logueados. También utiliza la clase PrivateController del mismo espacio de nombres y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de recuperar los registros de usuarios no logueados y pasarlos a la vista para su renderización.

Recuperación de datos: El método run() obtiene los registros de usuarios no logueados utilizando el método getLognonuser() proporcionado por la clase DAO correspondiente.

Preparación de datos para la vista: Los datos obtenidos se almacenan en un array asociativo llamado $viewData, que se pasa a la vista para su renderización. Además, se incluyen banderas que indican los roles de usuario.

Renderización de la vista: Finalmente, el método render() de la clase Renderer se utiliza para renderizar la plantilla de la lista de registros de usuarios no logueados. */

namespace Controllers\Lognonusers;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Lognonusers\Lognonusers as DAOLognonuser;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Lognonuser extends PrivateController
{
    private $id_logNonUser;
    private $log_date;
    private $id_cookie;
    private $log_cod;

    public function run(): void
    {
        Site::addLink('lognonuser_style');
        $viewData['id_logNonUser'] = 'id_logNonUser';
        $viewData['log_date'] = 'log_date';
        $viewData['id_cookie'] = 'id_cookie';
        $viewData['log_cod'] = 'log_cod';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['lognonuser'] = DAOLognonuser::getLognonuser())) {
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
        Renderer::render("lognonusers/lognonuserlist", $viewData);
    }
}