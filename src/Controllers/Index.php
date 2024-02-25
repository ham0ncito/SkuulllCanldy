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
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
    
     *
     * @return void
     */
    private $isSubscribed = ""; 
    public function run() :void
    {
        $viewData = array();
        $viewData['products'] = [
            [
                'artist' => 'Lady Gaga',
                'product' => 'Chromatica Ultra Deluxe',
                'price'=> '$99.99',
                'imageUrl'=> 'https://th.bing.com/th/id/OIP.GRvuOiEQZrapGxSqdN0DvgHaHa?rs=1&pid=ImgDetMain',
                'id'=>'1'
            ],
            [
                'artist' => 'Ariana Grande',
                'product' => 'REM FRAGANCE',
                'price'=> '$123.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.0348c6ba7417fbccc24b52cd73623ae9?rik=KMUpO5FaVpaTjA&pid=ImgRaw&r=0',
                'id'=>'2'
            ],
            [
                'artist' => 'Taylor Swift',
                'product' => 'Wonderstruck',
                'price'=> '$23.99',
                'imageUrl'=> 'https://cdn.shopify.com/s/files/1/1180/3624/products/ae70c263b13d0c250455fe042da9c80b.jpeg?v=1618378530',
                'id'=>'3'
            ],
            [
                'artist' => 'Katy Perry',
                'product' => 'Miau Miau',
                'price'=> '$13.99',
                'imageUrl'=> 'https://i.pinimg.com/originals/3d/9b/db/3d9bdb0776a0245e18ed934ec0526e65.jpg',
                'id'=>'4'
            ],
            [
                'artist' => 'Blackpink',
                'product' => 'Light Stick',
                'price'=> '$234.90',
                'imageUrl'=> 'https://cf.shopee.ph/file/870265f8eaa166b2568025e64369b686',
                'id'=>'5'
            ],
            [
                'artist' => 'Lady Gaga',
                'product' => 'Born This Way',
                'price'=> '$150.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.2dc2213aa7f2490c92a78e23de51872d?rik=sDUN3UU7HrPC%2bA&riu=http%3a%2f%2fi.huffpost.com%2fgen%2f267717%2fLADY-GAGA-BORN-THIS-WAY.jpg&ehk=rKkmboEfDpJxh7K81dnM5l2Fd2c5bckIsCOd2EyoyEw%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'6'
            ],
            [
                'artist' => 'The Weeknd',
                'product' => 'Trilogy',
                'price'=> '$299.99',
                'imageUrl'=> 'https://i.pinimg.com/originals/1d/fa/d4/1dfad41d84c92d84077335e835b66bae.jpg',
                'id'=>'7'
            ],
            [
                'artist' => 'Selena Gomez',
                'product' => 'Rare Beauty Foundation',
                'price'=> '$23.99',
                'imageUrl'=> 'https://media.glamour.com/photos/5f62980d0fedb1c968fdacf4/1:1/w_2560%2Cc_limit/rare%252520beauty%252520highlighter%252520.png',
                'id'=>'8'
            ],
            [
                'artist' => 'Lady Gaga',
                'product' => 'The Fame Signed',
                'price'=> '$599.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.eb6c4fc16c3c2519ea6703163fa3d66e?rik=2zruDU0kOF33AA&pid=ImgRaw&r=0',
                'id'=>'9'
            ],
            [
                'artist' => 'Ariana Grande',
                'product' => 'Sweet Like Candy',
                'price'=> '$123.99',
                'imageUrl'=> 'https://th.bing.com/th/id/OIP.tVd4cxHx03tTfAc3ZlBM_QHaHa?rs=1&pid=ImgDetMain',
                'id'=>'10'
            ],
            [
                'artist' => 'Lana Del Rey',
                'product' => 'TShirt',
                'price'=> '$23.99',
                'imageUrl'=> 'https://cdn.shopify.com/s/files/1/0196/6479/7760/products/lana-del-rey-vintage-unisex-t-shirt-126241.jpg?v=1582295701',
                'id'=>'11'
            ],
            [
                'artist' => 'Lana Del Rey',
                'product' => 'Paradise Edition',
                'price'=> '$399.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.e9291d327d0b03c3df3380946fbfc37e?rik=NFcElVMwg8Yy3g&riu=http%3a%2f%2fcdn1.umg3.net%2f89%2ffiles%2f2014%2f06%2fLana-Del-Rey-Born-To-Die-Paradise-Edition-1500x1500-2012.png&ehk=g%2fgnP8d67UddtLVKY1bMja8%2bw07Fc3enG81kNzZwaxI%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'12'
            ],
            [
                'artist' => 'Melanie Martinez',
                'product' => 'Cry Baby',
                'price'=> '$123.99',
                'imageUrl'=> 'https://th.bing.com/th/id/OIP._QvEReXdOlGvJ_Bt01bv6AHaHY?rs=1&pid=ImgDetMain',
                 'id'=>'13'
            ],
            [
                'artist' => 'Melanie Martinez',
                'product' => 'K12',
                'price'=> '$123.99',
                'imageUrl'=> 'https://th.bing.com/th/id/OIP.7aQervkhKL_mPuFMIeQFgAHaHa?rs=1&pid=ImgDetMain',
                'id'=>'14'
            ],
            [
                'artist' => 'Melanie Martinez',
                'product' => 'Portals',
                'price'=> '$123.99',
                'imageUrl'=> 'https://th.bing.com/th/id/OIP.Q81yghKi4zMC6QysLdsQ5QHaHa?rs=1&pid=ImgDetMain',
                'id'=>'15'
            ],
            [
                'artist' => 'MADONNA',
                'product' => 'MDNA WORLD SHANGHAI TICKET',
                'price'=> '$99.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.7b50b88909672799f9ba8fc02fe488a1?rik=87%2f588deV6LVEQ&riu=http%3a%2f%2f3.bp.blogspot.com%2f-3Dc1EnaBhjw%2fT24TKa0O_tI%2fAAAAAAAADyc%2fk8H5zt1iUxA%2fs576%2fMDNA%252520%252528101%252529.jpg&ehk=qpT2p7M9D5XUceg%2bTY3y3X5MghilgWYH15K1NOuJqzY%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'15'
            ],
            [
                'artist' => 'MADONNA',
                'product' => 'MDNA WORLD BERLIN TICKET',
                'price'=> '$99.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.7b50b88909672799f9ba8fc02fe488a1?rik=87%2f588deV6LVEQ&riu=http%3a%2f%2f3.bp.blogspot.com%2f-3Dc1EnaBhjw%2fT24TKa0O_tI%2fAAAAAAAADyc%2fk8H5zt1iUxA%2fs576%2fMDNA%252520%252528101%252529.jpg&ehk=qpT2p7M9D5XUceg%2bTY3y3X5MghilgWYH15K1NOuJqzY%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'15'
            ],
            [
                'artist' => 'MADONNA',
                'product' => 'MDNA WORLD PARIS TICKET',
                'price'=> '$99.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.7b50b88909672799f9ba8fc02fe488a1?rik=87%2f588deV6LVEQ&riu=http%3a%2f%2f3.bp.blogspot.com%2f-3Dc1EnaBhjw%2fT24TKa0O_tI%2fAAAAAAAADyc%2fk8H5zt1iUxA%2fs576%2fMDNA%252520%252528101%252529.jpg&ehk=qpT2p7M9D5XUceg%2bTY3y3X5MghilgWYH15K1NOuJqzY%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'15'
            ],
            [
                'artist' => 'MADONNA',
                'product' => 'MDNA WORLD NYC TICKET',
                'price'=> '$99.99',
                'imageUrl'=> 'https://th.bing.com/th/id/R.7b50b88909672799f9ba8fc02fe488a1?rik=87%2f588deV6LVEQ&riu=http%3a%2f%2f3.bp.blogspot.com%2f-3Dc1EnaBhjw%2fT24TKa0O_tI%2fAAAAAAAADyc%2fk8H5zt1iUxA%2fs576%2fMDNA%252520%252528101%252529.jpg&ehk=qpT2p7M9D5XUceg%2bTY3y3X5MghilgWYH15K1NOuJqzY%3d&risl=&pid=ImgRaw&r=0',
                'id'=>'15'
            ],
            
        
        ];
    
        \Views\Renderer::render("index", $viewData);
    }
}
?>