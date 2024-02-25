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
/*Una clase de tipos */
namespace Dao\Security;

final class Estados extends \Utilities\Enum
{
    const ACTIVO  = "ACT";
    const INACTIVO = "INA";
    const BLOQUEADO = "BLQ";
    const SUSPENDIDO = "SUS";
}
?>
