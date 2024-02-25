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
Este controlador PHP maneja la página "For The Record" dentro de la sección de la empresa. Aquí está su funcionalidad:

run(): En este método, se configuran los datos necesarios para mostrar la página "For The Record". Se define un array $viewData que contiene el nombre de la página y el directorio base. Luego, se utiliza el renderizador para mostrar la vista correspondiente. */
class ForTheRecord extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'For The Record';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\\fortherecord", $viewData);
    }
}

  