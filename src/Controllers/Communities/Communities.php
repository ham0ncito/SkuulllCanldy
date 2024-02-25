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
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
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
 
Este controlador PHP maneja la página que muestra información sobre comunidades en general. Aquí está la función principal:

run(): Este método se encarga de configurar los datos que se mostrarán en la página. Define un conjunto de datos que incluye información sobre la clase de comunidades, el título de la página y descripciones sobre las oportunidades que ofrece la comunidad.
 */

class Communities extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "communities",
            "name"=> "Communities",
            "title"=> "More than an customers or an artist",
            "text"=> [
                [
                    "description"=> " Discover a diverse collection of musical instruments and accessories, ranging from guitars and drums to keyboards and DJ equipment, catering to every music enthusiast's needs at our music store app."
                ],
                [
                    "description"=> "Immerse yourself in a harmonious world of musical exploration, where our app offers a seamless experience to browse, purchase, and explore a wide range of albums, singles, and musical merchandise."
                ],
                [
                    "description"=> "Explore a symphony of opportunities as our music store app bridges the gap between artists and listeners, fostering a vibrant community where musicians showcase their talent and users discover new rhythms and melodies."
                ],
               
            ]
            ];
        
        Renderer::render("components\post", $viewData);
    }
}