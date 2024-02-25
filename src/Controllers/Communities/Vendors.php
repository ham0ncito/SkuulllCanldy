<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
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
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

 /*
Este controlador PHP maneja la página que invita a los vendedores a unirse a la plataforma para tener éxito en sus ventas. Aquí está la función principal:

run(): Este método se encarga de configurar los datos que se mostrarán en la página. Define un conjunto de datos que incluye información sobre la clase de vendedores, el título de la página y descripciones sobre los beneficios de unirse a la plataforma como vendedor. También incluye una imagen ilustrativa y un enlace para ingresar. */
class Vendors extends PublicController {

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "vendors",
            "name"=> "Vendors",
            "title"=> "Calling All Sellers: Join Our Platform for Success!",
            "text"=> [
                [
                    "description"=> "Are you a driven seller seeking a platform to expand your reach and boost your sales? Look no further! Our platform offers a gateway to elevate your selling experience."
                ],
                [
                    "description"=> "Take your selling journey to new heights! Join our platform today and unlock the tools and resources you need to thrive in the world of online sales."
                ],
                [
                    "description"=> "Skull2Candly - Where Sellers Excel! 🛒🌟📈"
                ]
               
            ],
            "div"=> [
                [
                    "code"=> '<div class="flex justify-center items-center mx-4">
                    <img src="https://images.pexels.com/photos/8044064/pexels-photo-8044064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="Descripción de la imagen">
                </div>
                <div class="flex justify-center items-center m-10">
                <a href="index.php?page=Sec_Login" class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-32 h-12 flex items-center justify-center px-4 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300 focus:ring-opacity-75">
                  Enter
                </a>
              </div>
                '
                ],
               
            ]
            ];
      
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("components\post", $viewData);
    }
}