<?php
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
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