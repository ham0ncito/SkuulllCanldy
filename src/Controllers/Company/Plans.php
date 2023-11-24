<?php
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Plans extends PublicController {
 

    public function run(): void
    {
        $viewData['page'] = 'Plans';
        $viewData['prices'] = [
            [
                'name' => 'Basic Plan',
                'id' => 'basic_plan',
                'description' => "Hear your music wherever you want",
                'price' => '$19.99',
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
                'price' => '$29.99',
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
                'price' => '$49.99',
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

  