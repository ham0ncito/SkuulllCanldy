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

namespace Controllers;

class Error extends PublicController
{
    public function run(): void
    {
        $error_code = \Utilities\Context::getContextByKey("ERROR_CODE");
        $error_code = $error_code === "" ? 404 : $error_code;
        $error_msg = "Something stranges has happened";
        switch ($error_code) {
            case 404:
                $error_msg = "We could not find the requested";
                break;
            case $error_code >= 500:
                $error_msg = "Something unexpected happened";
                break;
        }
        http_response_code($error_code);
        \Views\Renderer::render(
            "error",
            [
                "CLIENT_ERROR_CODE" => $error_code,
                "CLIENT_ERROR_MSG" => $error_msg
            ]
        );
    }
}