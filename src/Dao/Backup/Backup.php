<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Dao\Backup;

use Dao\Table;

class Backup extends Table
{

    public static function createBackup()
    {
        $sqlstr = "CREATE DABATASE BACKUP WITH DIFFERENTIAL";
        $params = [];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    }
}
