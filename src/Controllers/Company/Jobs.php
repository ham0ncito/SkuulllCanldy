<?php
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Jobs extends PublicController {

    public function run(): void
    {
        $viewData['name'] = 'Work With Us';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\jobs", $viewData);
    }
}