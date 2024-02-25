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
 * Checkout
 *
 * @category Controller
 * @package  Controllers\Checkout
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 * @version  CVS:1.0.0
 * @link     http://url.com
 */
 namespace Controllers\Checkout;

// ---------------------------------------------------------------
// Sección de imports
// ---------------------------------------------------------------
use Controllers\PrivateController;

/**
 * Catalogo
 *
 * @category Public
 * @package  Controllers\Checkout;
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Catalogo extends PrivateController
{
    /**
     * Runs the controller
     *
     * @return void
     */
    public function run():void
    {
       
        $producto = [];
        \Views\Renderer::render("abc", array("productos" => $producto));
    }
}

?>
