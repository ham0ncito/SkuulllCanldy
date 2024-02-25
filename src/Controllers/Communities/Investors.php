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

 /*Este controlador PHP maneja la página que proporciona información para inversores interesados en oportunidades lucrativas en la plataforma. Aquí está la función principal:

run(): Este método se encarga de configurar los datos que se mostrarán en la página. Define un conjunto de datos que incluye información sobre la clase de inversores, el título de la página y descripciones sobre las oportunidades de inversión disponibles en la plataforma. También incluye una imagen ilustrativa y un enlace para ingresar. */
class Investors extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "investors",
            "name"=> "Investors",
            "title"=> "Seeking Investors for a Lucrative Opportunity!",
            "text"=> [
                [
                    "description"=> "Are you looking for a promising investment opportunity that yields substantial returns? Your search ends here! Our venture presents an exciting chance for savvy investors to partake in a groundbreaking initiative."
                ],
                [
                    "description"=> "📈 Invest in Innovation: Join us in supporting cutting-edge projects that redefine industries. Embrace innovation and contribute to ventures poised to make a significant impact on the market."
                ],
                [
                    "description"=> "🌐 Global Expansion: Be part of our journey towards global expansion. Your investment will fuel our expansion strategies, allowing us to reach new markets and broaden our horizons."
                ],
                [
                    "description"=> "🤝 Partnership and Growth: Forge a partnership geared towards success. Your expertise combined with our vision creates a synergy that fosters growth and prosperity."
                ],
                [
                    "description"=> "Take the leap into an opportunity that promises remarkable growth and profitability. Invest in our vision today and become a vital part of a transformation journey.

                    Skull2Candly - Where Investments Thrive! 🌟💼💰"
                ],
               
            ],
            "div"=> [
                [
                    "code"=> '<div class="flex justify-center items-center mx-4">
                    <img src="https://images.pexels.com/photos/16594726/pexels-photo-16594726/free-photo-of-internet-tecnologia-efecto-desenfocado-ordenador.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="w-200 h-200 object-contain" alt="Descripción de la imagen">
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