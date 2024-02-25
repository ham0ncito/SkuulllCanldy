<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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
namespace Controllers\Company;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

/*
Este controlador PHP maneja la página "Services" dentro de la sección de la empresa. Aquí está su funcionalidad:

run(): En este método, se configuran los datos necesarios para mostrar la página "Services". Se define un array $viewData que contiene el nombre de la página, la lista de servicios ofrecidos y el directorio base. Los servicios están representados como un array asociativo con un ID, nombre y descripción. Luego, se utiliza el renderizador para mostrar la vista correspondiente */
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * Updated by Skuul2candly
 * Issue Number : 23
 * Ticker Number : 23
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
class Services extends PublicController {
 

    public function run(): void
    {
        $viewData['name'] = 'Services';
        $viewData['services'] = [
            [
                'id' => 1,
                'name' => 'Music Streaming',
                'description' => 'Allows users to play a vast variety of songs, albums, and playlists from its extensive music catalog.'
            ],
            [
                'id' => 2,
                'name' => 'Personalized Playlists',
                'description' => 'Offers customized playlists based on users\' tastes and preferences, such as "Discover Weekly" and "Daily Mix."'
            ],
            [
                'id' => 3,
                'name' => 'Podcasts',
                'description' => 'Provides a diverse selection of podcasts in different categories, allowing users to discover, follow, and listen to podcasts within the same platform.'
            ],
            [
                'id' => 4,
                'name' => 'Offline Playback',
                'description' => 'Premium users have the option to download music and podcasts for offline listening.'
            ],
            [
                'id' => 5,
                'name' => 'Audio Quality',
                'description' => 'Provides options to adjust the audio quality, allowing users to choose different sound quality levels.'
            ],
            [
                'id' => 6,
                'name' => 'Social Integration',
                'description' => 'Enables users to share songs, albums, or playlists on social media platforms and also follow other users\' musical preferences.'
            ],
            [
                'id' => 7,
                'name' => 'Family Plans and Student Plans',
                'description' => 'Offers family subscription options that allow sharing the account among multiple family members and discounted student plans for students.'
            ]
        ];        
        $viewData['BASE_DIR'] = "SkuulllCanldy";
        Renderer::render("index\services", $viewData);
    }
}

  