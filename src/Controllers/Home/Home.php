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

namespace Controllers\Home;
Use DAO\Artists\Artists as artists; 
use DAO\Videos\Videos AS videos;
use Dao\Albums\Albums as albums; 
use Dao\Genres\Genres as genre; 
use Controllers\PrivateController as PrivateController;
/*
Este fragmento de código PHP define un controlador llamado Home dentro del espacio de nombres Controllers\Home. Aquí tienes un resumen de su funcionalidad:

Espacio de nombres (namespace): El controlador está dentro del espacio de nombres Controllers\Home, lo que sugiere que se ocupa de la gestión de la página de inicio.

Uso de clases y funciones de otros archivos: El controlador utiliza las clases Artists, Videos, Albums, y Genres del espacio de nombres DAO. También utiliza la clase PrivateController del mismo espacio de nombres y la clase Renderer del espacio de nombres Views.

Método run(): Este método se ejecuta cuando se solicita el controlador y se encarga de recuperar los datos necesarios para la página de inicio y pasarlos a la vista.

Recuperación de datos: El método run() obtiene los datos de los artistas, álbumes, videos y géneros más populares utilizando los métodos proporcionados por las respectivas clases DAO.

Preparación de datos para la vista: Los datos obtenidos se almacenan en un array asociativo llamado $dataview, que se pasa a la vista para su renderización. Además, se incluyen banderas que indican los roles de usuario y la última actividad.

Renderización de la vista: Finalmente, el método render() de la clase Renderer se utiliza para renderizar la plantilla de la página de inicio, pasando los datos preparados. */
class Home extends PrivateController
{
    public function run(): void
    {
        $dataview = array();
        $dataview['artist'] = artists::gettop(); 
        $dataview['albums'] = albums::gettop();
        $dataview['videos'] = videos::gettop();
        $dataview['genre'] = genre::getGenre();
        $dataview['isCLN'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'CLN'); 
        $dataview['isCLS'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'CLS'); 
        $dataview['isADMIN'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'ADMIN'); 
        $dataview['isAUDIT'] = \Dao\Security\Security::userIs( $_SESSION['useremail'],'AUDIT');
        $dataview['lastActive'] = $_SESSION['lastActive'];

        \Views\Renderer::render("home/home", $dataview);
    }
}