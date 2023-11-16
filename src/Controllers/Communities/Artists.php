<?php
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Artists extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'Artists';
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("links\aboutus", $viewData);
    }
}