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
namespace Controllers;

class NoAuth extends PublicController
{
    public function run() :void
    {
        
        if (\Utilities\Security::isLogged()){
            if (\Utilities\Context::getContextByKey("PRIVATE_LAYOUT") !== "") {
                \Views\Renderer::render(
                    "noauth",
                    array(),
                    \Utilities\Context::getContextByKey("PRIVATE_LAYOUT")
                );
            } else {
                \Views\Renderer::render("noauth", array());
            }
        } else {
            \Views\Renderer::render("noauth", array());
        }
    }
}
?>