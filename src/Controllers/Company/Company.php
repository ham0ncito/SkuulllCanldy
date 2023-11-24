<?php
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
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