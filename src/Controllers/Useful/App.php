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

namespace Controllers\Useful;

use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class App extends PublicController
{

    public function run(): void
    {
        $viewData = array();
        $viewData = [
            "class" => "app",
            "name" => "App",
            "title" => "📱 Get Our App Now! 🌟",
            "text" => [
                [
                    "description" => "Discover a seamless experience and access amazing features by downloading our app today!"
                ],
                [
                    "description" => "👉 Why Download?"
                ],
                [
                    "description" => "✨ Enjoy exclusive content and offers."
                ],
                [
                    "description" => "✨ Access your favorite features on the go."
                ],
                [
                    "description" => "✨ Stay updated with the latest news and events.
                    "
                ],
                [
                    "description" => "✨ Seamless and user-friendly interface."
                ],
                [
                    "description" => "📲 How to Get It:"
                ],
                [
                    "description" => "🔹 Visit the App Store or Google Play."
                ],
                [
                    "description" => "🔹 Search for Skull2Candly Music For Everyone"
                ],
                [
                    "description" => "🔹 Search for Skull2Candly Music For Everyone"
                ], [
                    "description" => "🔹 Download and start exploring!"
                ],
                [
                    "description" => "Take your experience to the next level with our app! Download now and join our community of users enjoying incredible benefits and convenience.                    "
                ],



            ],
            "div" => [
                [
                    "code" => '<div class="flex justify-center items-center mx-4 w-100 h-100 object-fit">
                    <img class="max-w-200 max-h-200" src="https://firebasestorage.googleapis.com/v0/b/skulllcandl.appspot.com/o/Src%2FlogoSkuul.png?alt=media&token=608e37b0-c8c2-4f2d-a524-46555e9dbfa7" alt="Descripción de la imagen">
                </div>
                <div class="flex justify-center items-center m-10">
                <a href="https://play.google.com/store/games?device=windows&pli=1" class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-32 h-12 flex items-center justify-center px-4 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300 focus:ring-opacity-75">
                  Download
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