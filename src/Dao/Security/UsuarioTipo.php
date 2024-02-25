<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Security;

final class UsuarioTipo extends \Utilities\Enum
{
    const PUBLICO  = "PBL";
    const ADMINITRADAOR = "ADM";
    const AUDITOR = "AUD";
    CONST CLIENTE = "CLN";
}

?>