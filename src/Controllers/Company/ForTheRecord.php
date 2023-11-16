<?php
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class ForTheRecord extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'For The Record';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\\fortherecord", $viewData);
    }
}

  