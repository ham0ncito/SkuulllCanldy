<?php
namespace Controllers\Search;
use DAO\Genres\Genres as DAOGenre; 
use DAO\Artists\Artists as DAOArtist; 
use Controllers\PublicController;

class Search extends PublicController{
    public function run():void
    {
        $dataview = array();
        $dataview["genre"] = DAOGenre::getGenre();
        $dataview["artist"] = DAOArtist::getArtist();
        \Views\Renderer::render("search/search", $dataview);
    }
}