<?php

namespace Controllers\Home;

use Controllers\PrivateController as PrivateController;

class Home extends PrivateController
{
    public function run(): void
    {
        $dataview = array();
        
        \Views\Renderer::render("home/home", $dataview);
    }
}