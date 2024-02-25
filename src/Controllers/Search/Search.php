<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticket Number : 23
 * Changes Approved on 20/2/24
 * Tested by Skullcanldy
 * Description: 
	This is the first documentation commit
 * Disclosure Agreement: 
	Keep this information in secret
 * Last changes done: 
	Documentation Added
	
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Controllers\Search;
use DAO\Genres\Genres as DAOGenre; 
use DAO\Artists\Artists as DAOArtist; 
use Dao\Songs\Songs as DAOSongs;
use Dao\Albums\Albums as DAOAlbum;
use Controllers\PrivateController;
use Controllers\PublicController;
use Utilities\Context;
use Utilities\Paging;

class Search extends PublicController{
    private $partialName = "";
    private $orderBy = "";
    private $orderDescending = false;
    private $pageNumber = 1;
    private $itemsPerPage = 10;
    private $viewData = [];
    private $songs = [],$artists = [], $albums = [];
    private $songsCount = 0,$artistsCount = 0,$albumsCount = 0;
    private $pages = 0;
    public function run():void
    {
        $this->getParamsFromContext();//
        $this->getParams();//

        $tmpSongs = DAOSongs::getSongs(
            $this->partialName,
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );

        $tmpArtists = DAOArtist::getArtists(
            $this->partialName,
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );
        $tmpAlbums = DAOAlbum::getAlbums(
            $this->partialName,
            $this->orderBy,
            $this->orderDescending,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );

        $this->songs = $tmpSongs["songs"];
        $this->songsCount = $tmpSongs["total"];

        $this->artists = $tmpArtists["artists"];
        $this->artistsCount = $tmpArtists["total"];

        $this->albums = $tmpAlbums["albums"];
        $this->albumsCount = $tmpAlbums["total"];

        $this->pages = $this->songsCount > 0 ? ceil($this->songsCount / $this->itemsPerPage) : 1;
        if ($this->pageNumber > $this->pages) {
            $this->pageNumber = $this->pages;
        }
        $this->setParamsToContext();
        $this->setParamsToDataView();
        $dataview = array();
        $dataview["counter"] = 1;
        $dataview["songs"] = $this->songs;
        $dataview["artists"] = $this->artists;
        $dataview["albums"] = $this->albums;
        $dataview["genre"] = DAOGenre::getGenre();
        $dataview["artist"] = DAOArtist::getArtist();
        //print_r($_SESSION);
        $dataview["isCLN"] = \Dao\Security\Security::userIs($_SESSION["login"]["userEmail"],'CLN'); 
        $dataview["isCLS"] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'],'CLS'); 
        $dataview["isADMIN"] = \Dao\Security\Security::userIs($_SESSION["login"]['userEmail'],'ADMIN'); 
        \Views\Renderer::render("search/search", $dataview);
    }

    private function getParams(): void
  {
    $this->partialName = isset($_GET["partialName"]) ? $_GET["partialName"] : $this->partialName;
    $this->orderBy = isset($_GET["orderBy"]) && in_array($_GET["orderBy"], [ "title_song", "duration", "clear"]) ? $_GET["orderBy"] : $this->orderBy;
    if ($this->orderBy === "clear") {
      $this->orderBy = "";
    }
    $this->orderDescending = isset($_GET["orderDescending"]) ? boolval($_GET["orderDescending"]) : $this->orderDescending;
    $this->pageNumber = isset($_GET["pageNum"]) ? intval($_GET["pageNum"]) : $this->pageNumber;
    $this->itemsPerPage = isset($_GET["itemsPerPage"]) ? intval($_GET["itemsPerPage"]) : $this->itemsPerPage;
  }

  private function getParamsFromContext(): void
  {
    $this->partialName = Context::getContextByKey("songs_partialName");
    $this->orderBy = Context::getContextByKey("songs_orderBy");
    $this->orderDescending = boolval(Context::getContextByKey("songs_orderDescending"));
    $this->pageNumber = intval(Context::getContextByKey("songs_page"));
    $this->itemsPerPage = intval(Context::getContextByKey("songs_itemsPerPage"));
    if ($this->pageNumber < 1) $this->pageNumber = 1;
    if ($this->itemsPerPage < 1) $this->itemsPerPage = 10;
  }

  private function setParamsToContext(): void
  {
    Context::setContext("songs_partialName", $this->partialName, true);
    Context::setContext("songs_orderBy", $this->orderBy, true);
    Context::setContext("songs_orderDescending", $this->orderDescending, true);
    Context::setContext("songs_page", $this->pageNumber, true);
    Context::setContext("songs_itemsPerPage", $this->itemsPerPage, true);
  }

  private function setParamsToDataView(): void
  {
    $this->viewData["partialName"] = $this->partialName;
    $this->viewData["orderBy"] = $this->orderBy;
    $this->viewData["orderDescending"] = $this->orderDescending;
    $this->viewData["pageNum"] = $this->pageNumber;
    $this->viewData["itemsPerPage"] = $this->itemsPerPage;
    $this->viewData["songsCount"] = $this->songsCount;
    $this->viewData["pages"] = $this->pages;
    $this->viewData["songs"] = $this->songs;
    if ($this->orderBy !== "") {
      $orderByKey = "Order" . ucfirst($this->orderBy);
      $orderByKeyNoOrder = "OrderBy" . ucfirst($this->orderBy);
      $this->viewData[$orderByKeyNoOrder] = true;
      if ($this->orderDescending) {
        $orderByKey .= "Desc";
      }
      $this->viewData[$orderByKey] = true;
    }
    $pagination = Paging::getPagination(
      $this->songsCount,
      $this->itemsPerPage,
      $this->pageNumber,
      "index.php?page=Search_Search",
      "Search_Search"
    );
    $this->viewData["pagination"] = $pagination;
  }
}

        
    