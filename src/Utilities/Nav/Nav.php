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
namespace Utilities\Nav; 
class Nav{
    public static function nav(){
        $dataview['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLN'); 
        $dataview['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'CLS'); 
        $dataview['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'],'ADMIN'); 
    }
}