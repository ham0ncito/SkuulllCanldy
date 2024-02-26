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
namespace Utilities\Cleanser; 
class Cleanser{

   public static function Input($givenInput){
   // Utiliza htmlspecialchars para convertir caracteres especiales en entidades HTML,
    // previniendo ataques XSS (Cross-Site Scripting).
    $sanitized_input = htmlspecialchars($givenInput, ENT_QUOTES, 'UTF-8');
    // Utiliza addslashes para escapar caracteres especiales como comillas,
    // previniendo ataques de inyección SQL.
    $sanitized_input = addslashes($sanitized_input);
    return $sanitized_input;
   }
   
   
}