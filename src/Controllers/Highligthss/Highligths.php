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

namespace Controllers\Highligthss;
/*
Este código PHP define un controlador llamado Highligths en el espacio de nombres Controllers\Highligthss. Aquí está un resumen de su funcionalidad:


Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Highligthss, lo que sugiere que se ocupa de la gestión de aspectos destacados o destacados.

Uso de clases y funciones de otros archivos: El controlador utiliza la clase PrivateController del mismo espacio de nombres, la clase Renderer del espacio de nombres Views, y la clase Highligthss del espacio de nombres Dao\Highligthss. También utiliza las clases Site y Validators del espacio de nombres Utilities.

Atributos privados: El controlador tiene atributos privados para almacenar información sobre los aspectos destacados, como highligths_id, highligths_starts_at, highligths_ends_at y highligths_time.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de inicializarlo, procesar los datos si es necesario y prepararlos para la vista.

Inicialización y validación de datos: El método run() inicializa el controlador y obtiene los aspectos destacados si el usuario es un administrador. También verifica si la lista de aspectos destacados está vacía y establece una bandera correspondiente.

Preparación de datos para la vista: El método prepareViewData() prepara los datos necesarios para renderizar la vista, como los datos de los aspectos destacados y las banderas de vacío.

Renderización de la vista: Finalmente, el método render() renderiza la plantilla de lista de aspectos destacados, pasando los datos preparados. */
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Highligthss\Highligthss as DAOHighligths;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Highligths extends PrivateController
{
    private $highligths_id;
    private $highligths_starts_at;
    private $highligths_ends_at;
    private $highligths_time;

    public function run(): void
    {
        Site::addLink('highligths_style');
        $viewData['highligths_id'] = 'highligths_id';
        $viewData['highligths_starts_at'] = 'highligths_starts_at';
        $viewData['highligths_ends_at'] = 'highligths_ends_at';
        $viewData['highligths_time'] = 'highligths_time';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['highligths'] = DAOHighligths::getHighligths())) {
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
        Renderer::render("highligthss/highligthslist", $viewData);
    }
}