<?php

namespace Controllers\Home;

use Controllers\PublicController as PublicController;

class Home extends PublicController
{
    public function run(): void
    {
        $dataview = array();
        
        \Views\Renderer::render("home/home", $dataview);
    }
}