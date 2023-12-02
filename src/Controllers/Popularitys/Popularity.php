<?php
namespace Controllers\Popularitys;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Popularitys\Popularitys as DAOPopularity;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Popularity extends PrivateController {
  private $id_popularity;
  private $id_object;
  private $dislike_count;
  private $like_count;
  private $percent_dislike;
  private $percent_like;
  private $type_object;

    public function run(): void
    {
        Site::addLink('popularity_style');
        $viewData['id_popularity'] = 'id_popularity';
		$viewData['id_object'] = 'id_object';
		$viewData['dislike_count'] = 'dislike_count';
		$viewData['like_count'] = 'like_count';
		$viewData['percent_dislike'] = 'percent_dislike';
		$viewData['percent_like'] = 'percent_like';
		$viewData['type_object'] = 'type_object';
		$viewData['popularity']= DAOPopularity::getPopularity();
        Renderer::render("popularitys/popularitylist", $viewData);
    }
}