<?php
namespace Controllers\Communities;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;
class Artists extends PublicController {
 

    public function run(): void
    {
        $viewData= array();
        $viewData = [
            "class"=> "artist",
            "name"=> "Artist",
            "title"=> "We are looking for you",
            "text"=> [
                [
                    "description"=> "Music is art, and so does you"
                ],
                [
                    "description"=> "Are you an aspiring artist looking for the perfect platform to showcase your talent? Look no further! Our company invites you to join our vibrant community of creatives."
                ],
                [
                    "description"=> "🎨 Explore Endless Opportunities: Whether you're a painter, musician, sculptor, or any other type of artist, our platform offers diverse opportunities to exhibit and promote your craft"
                ],
                [
                    "description"=> "🌟 Gain Exposure: Showcase your artwork to a global audience. Connect with fellow artists, art enthusiasts, and potential clients to expand your reach."
                ],
                [
                    "description"=> "🤝 Collaborate and Grow: Collaborate with like-minded individuals, participate in workshops, and immerse yourself in an environment that nurtures growth and creativity."
                ],
               
            ],
            "div"=> [
                [
                    "code"=> '<div class="flex justify-center items-center mx-4">
                    <img src="https://images.pexels.com/photos/4471894/pexels-photo-4471894.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="w-200 h-200 object-contain" alt="Descripción de la imagen">
                </div>
                <div class="flex justify-center items-center m-10">
                <a href="index.php?page=Sec_Login" class="bg-blue-500 hover:bg-blue-700 text-white font-bold w-32 h-12 flex items-center justify-center px-4 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-300 focus:ring-opacity-75">
                  Enter
                </a>
              </div>
                '
                ],
               
            ]
            ];
      
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("components\post", $viewData);
    }
}