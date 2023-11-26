<?php
namespace Controllers\Videos;
use Controllers\PublicController;
use Views\Renderer;
use Dao\Videos\Videos as DAOVideo;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Video extends PublicController {
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
		$viewData['video']= DAOVideo::getVideo();
        Renderer::render("videos/videolist", $viewData);
    }
}
