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
Este controlador PHP maneja la página que muestra información sobre desarrolladores y los recursos disponibles para ellos en la plataforma. Aquí está la función principal:

run(): Este método se encarga de configurar los datos que se mostrarán en la página. Define un conjunto de datos que incluye información sobre la clase de desarrolladores, el título de la página y descripciones sobre las oportunidades que ofrece la plataforma para los desarrolladores. También incluye una imagen ilustrativa y un enlace para ingresar.
 */
class Developers extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "developers",
            "name"=> "Developers",
            "title"=> "Calling All Developers: Explore Innovation with Our Platform!",
            "text"=> [
                [
                    "description"=> "Are you a passionate developer seeking a dynamic platform to push the boundaries of innovation? Look no further! Join our thriving community designed exclusively for developers like you."
                ],
                [
                    "description"=> "🚀 Innovate and Create: Dive into a realm where your coding skills take flight. Explore cutting-edge technologies, experiment with new frameworks, and transform your ideas into reality."
                ],
                [
                    "description"=> "🤝 Connect and Collaborate: Engage with a diverse network of developers. Collaborate on projects, share insights, and learn from experts to level up your coding game."
                ],
                [
                    "description"=> "🌐 Access Resources: Gain access to a treasure trove of resources - from tutorials and articles to tools and APIs. Elevate your skills and stay updated with the latest trends in tech"
                ],
                [
                    "description"=> "Embark on a journey where your coding expertise meets limitless possibilities! Embrace a supportive community that fuels your passion for development.

                    Skull2Candly - Where Developers Innovate! 🌟💻🚀"
                ],
               
            ],
            "div"=> [
                [
                    "code"=> '<div class="flex justify-center items-center mx-4">
                    <img src="https://images.pexels.com/photos/1779487/pexels-photo-1779487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="w-200 h-200 object-contain" alt="Descripción de la imagen">
                  
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

  