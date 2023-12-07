<?php

namespace Controllers\Videos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Videos\Videos as DAOVideo;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Video extends PrivateController
{
    private $id_video;
    private $title_video;
    private $description_video;
    private $duration;
    private $video_cover;
    private $artist_id;
    private $status_video;
    private $link_song;

    public function run(): void
    {
        Site::addLink('video_style');
        $viewData['id_video'] = 'id_video';
        $viewData['title_video'] = 'title_video';
        $viewData['description_video'] = 'description_video';
        $viewData['duration'] = 'duration';
        $viewData['video_cover'] = 'video_cover';
        $viewData['artist_id'] = 'artist_id';
        $viewData['status_video'] = 'status_video';
        $viewData['link_song'] = 'link_song';

        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['video'] = DAOVideo::getVideo())) {
                $viewData['isEmpty'] = true;
            } else {
                $viewData['isEmpty'] = false;
            }
        } else {
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        Renderer::render("videos/videolist", $viewData);
    }
}