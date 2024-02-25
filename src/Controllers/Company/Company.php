<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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
namespace Controllers\Company;
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
 * Ticker Number : 23
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
Este controlador PHP pertenece a la sección de la empresa y se encarga de mostrar información sobre la empresa misma. Aquí está lo que hace:

run(): Este método configura los datos necesarios para mostrar la página de la empresa. Define un array $viewData que contiene información como la clase, el nombre y el título de la página, así como un array de textos que describen la empresa. Luego, utiliza el renderizador para mostrar la vista correspondiente*/
class Company extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "company",
            "name"=> "Company",
            "title"=> "We are an artist platform",
            "text"=> [
                [
                    "description"=> "Our company is a nurturing ecosystem designed to empower artists. We provide a platform where creatives flourish, offering resources, mentorship, and exposure for artists to amplify their craft."
                ],
                [
                    "description"=> "At our company, we're dedicated to fostering innovation and originality. We champion artists by offering them a stage to showcase their work, connecting them with opportunities that elevate their artistic vision to new heights."
                ],
                [
                    "description"=> "Join our vibrant community that celebrates diversity and collaboration. Our company brings together artists from various disciplines, fostering a space where ideas converge, collaborations flourish, and artistic expressions know no bounds."
                ],
               
            ]
            ];
        
        Renderer::render("components\post", $viewData);
    }
}