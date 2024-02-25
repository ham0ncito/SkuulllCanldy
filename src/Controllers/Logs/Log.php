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
Este fragmento de código PHP define un controlador llamado Log dentro del espacio de nombres Controllers\Logs. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Logs, lo que sugiere que se ocupa de la gestión de registros de logs.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase Logs del espacio de nombres Dao\Logs para acceder a los registros de logs. También utiliza la clase PrivateController del espacio de nombres Controllers y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializar, procesar y preparar los datos para la vista, así como de renderizar la vista.

Inicialización de datos: El método run() inicializa los datos necesarios para la vista, como los códigos de log y las descripciones.

Preparación de datos para la vista: Prepara los datos necesarios para renderizar la vista, incluyendo los datos de los logs y la información sobre los permisos de los usuarios.

Renderización de la vista: El método render() renderiza la plantilla de lista de logs con los datos preparados para la vista. */
namespace Controllers\Logs;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Logs\Logs as DAOLog;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Log extends PrivateController
{
    private $log_cod;
    private $log_description;

    public function run(): void
    {
        Site::addLink('log_style');
        $viewData['log_cod'] = 'log_cod';
        $viewData['log_description'] = 'log_description';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['log'] = DAOLog::getLog())) {
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
        Renderer::render("logs/loglist", $viewData);
    }
}