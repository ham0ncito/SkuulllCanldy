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

namespace Controllers\Popularitys;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Popularitys\Popularitys as DAOPopularity;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
/*
Este archivo PHP define una clase llamada Popularity dentro del espacio de nombres Controllers\Popularitys. Aquí hay un resumen de lo que hace esta clase:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers\Popularitys, lo que sugiere que esta clase se encarga de la lógica relacionada con la popularidad de algún tipo de objeto.

Uso de clases y namespaces: La clase utiliza clases y namespaces como Controllers\PrivateController, Views\Renderer, Dao\Popularitys\Popularitys, Utilities\Site, Utilities\Validators, Utilities\Context y Utilities\Paging.

Propiedades privadas: La clase tiene varias propiedades privadas que representan los datos relacionados con la popularidad, como el ID de popularidad (id_popularity), el ID del objeto (id_object), el contador de "no me gusta" (dislike_count), el contador de "me gusta" (like_count), el porcentaje de "no me gusta" (percent_dislike), el porcentaje de "me gusta" (percent_like) y el tipo de objeto (type_object).

Inicialización y renderización de la vista: El método run() se encarga de inicializar la clase, preparar los datos necesarios para la vista y luego renderizar la vista correspondiente.

Obtención de datos de popularidad: La clase obtiene los datos de popularidad utilizando el DAO (Objeto de Acceso a Datos) DAOPopularity::getPopularity() y los pasa a la vista para ser mostrados.

Verificación de permisos de usuario: La clase verifica si el usuario tiene permisos adecuados para acceder a la lista de popularidad y realizar operaciones en ellos.

Preparación de datos para la vista: La clase prepara los datos necesarios para renderizar la vista, incluyendo los datos de popularidad, indicadores de modo, mensajes de error y tokens XSS para evitar ataques de tipo Cross-Site Scripting.

Renderización de la vista: Finalmente, la clase renderiza la vista correspondiente utilizando el renderizador de vistas proporcionado. */
class Popularity extends PrivateController
{
    private $id_popularity;
    private $id_object;
    private $dislike_count;
    private $like_count;
    private $percent_dislike;
    private $percent_like;
    private $type_object;

    public function run(): void
    {
        Site::addLink('popularity_style');
        $viewData['id_popularity'] = 'id_popularity';
        $viewData['id_object'] = 'id_object';
        $viewData['dislike_count'] = 'dislike_count';
        $viewData['like_count'] = 'like_count';
        $viewData['percent_dislike'] = 'percent_dislike';
        $viewData['percent_like'] = 'percent_like';
        $viewData['type_object'] = 'type_object';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['popularity'] = DAOPopularity::getPopularity())) {
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
        Renderer::render("popularitys/popularitylist", $viewData);
    }
}