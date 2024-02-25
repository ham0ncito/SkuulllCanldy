<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Controllers\Popularitys;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Popularitys\Popularitys as DAOPopularity;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Popularity extends PrivateController
{
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
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['popularity'] = DAOPopularity::getPopularity())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("popularitys/popularitylist", $viewData);
    }
}