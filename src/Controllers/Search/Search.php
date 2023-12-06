<?php
namespace Controllers\Search;
use DAO\Genres\Genres as DAOGenre; 
use DAO\Artists\Artists as DAOArtist; 
use Controllers\PrivateController;

class Search extends PrivateController{
    public function run():void
    {
        $dataview = array();
        $dataview["genre"] = DAOGenre::getGenre();
        $dataview["artist"] = DAOArtist::getArtist();
        $dataview['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $dataview['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $dataview['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
        \Views\Renderer::render("search/search", $dataview);
    }
}