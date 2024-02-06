<?php

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
