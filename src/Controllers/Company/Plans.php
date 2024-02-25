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

/*
Este controlador PHP maneja la página "Planes" dentro de la sección de la empresa. Aquí está su funcionalidad:

run(): En este método, se configuran los datos necesarios para mostrar la página "Planes". Se define un array $viewData que contiene el nombre de la página, una lista de precios de diferentes planes ofrecidos por la empresa y el directorio base. Cada plan está representado como un array asociativo con el nombre del plan, una descripción, el precio, características específicas del plan y colores para personalización. Luego, se utiliza el renderizador para mostrar la vista correspondiente,  */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
class Plans extends PublicController {
 

    public function run(): void
    {
        $viewData['page'] = 'Plans';
        $viewData['prices'] = [
            [
                'name' => 'Basic Plan',
                'id' => 'basic_plan',
                'description' => "Hear your music wherever you want",
                'price' => '$0.20',
                'char1' => 'No ads',
                'char2' => 'Basic Features',
                'char3' => '24/7 Support',
                'color'=>"pink-200",
                'color2'=>"pink-500",
                'color3'=>"pink-700",
                'color4'=>"pink-800"
            ],
            [
                'name' => 'Pro Plan',
                'id' => 'pro_plan',
                'description' => "Hear your music with the best quality",
                'price' => '$1.20',
                'char1' => 'Up to 5 users',
                'char2' => 'Premium Features',
                'char3' => '24/7 Support',
                'color'=>"blue-200",
                'color2'=>"blue-500",
                'color3'=>"blue-700",
                'color4'=>"blue-800"
            ],
            [
                'name' => 'Artist Plan',
                'id' => 'artist_plan',
                'description' => "Express Yourself",
                'price' => '$2.00',
                'char1' => 'Publish your music',
                'char2' => 'Deluxe Features',
                'char3' => '24/7 Support',
                'color'=>"purple-200",
                'color2'=>"purple-500",
                'color3'=>"purple-700",
                'color4'=>"purple-800",
            ],
        ];
        
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("index\prices", $viewData);
    }
}

  