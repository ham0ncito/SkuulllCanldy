<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
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
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

/*
Este controlador PHP se encarga de mostrar la página "Acerca de Nosotros" de la empresa. Aquí está la función principal:

run(): Este método configura los datos necesarios para mostrar la página. Establece el nombre de la página como "About Us" y define la ruta base. Luego, utiliza el renderizador para mostrar la vista correspondiente,  */
class AboutUs extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'About Us';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\aboutus", $viewData);
    }
}