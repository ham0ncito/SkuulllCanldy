<?php
namespace Controllers\Search;
use DAO\Genres\Genres as DAOGenre; 
use Controllers\PublicController;

class Search extends PublicController{
    public function run():void
    {
        $dataview = array();
        $dataview["genre"] = DAOGenre::getGenre();
        \Views\Renderer::render("search/search", $dataview);
    }
}