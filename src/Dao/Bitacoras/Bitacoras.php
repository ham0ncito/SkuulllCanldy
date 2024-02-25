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

namespace Dao\Bitacoras;

use Dao\Table;

class Bitacoras extends Table
{

        private $bitacoracod;
        private $bitacorafch;
        private $bitprograma;
        private $bitdescripcion;
        private $bitobservacion;
        private $bitTipo;
        private $bitusuario;


        public static function getBitacora()
        {
                $sqlstr = "SELECT * FROM bitacora";
                $params = [];
                $registros = self::obtenerRegistros($sqlstr, $params);
                return $registros;
        }

        public static function insertBitacora($bitacoracod, $bitacorafch, $bitprograma, $bitdescripcion, $bitobservacion, $bitTipo, $bitusuario)
        {

                $sqlstr = "INSERT INTO bitacora (bitacoracod, bitacorafch, bitprograma, bitdescripcion, bitobservacion, bitTipo, bitusuario) VALUES (:bitacoracod , :bitacorafch , :bitprograma , :bitdescripcion , :bitobservacion , :bitTipo , :bitusuario)";
                $params = ['bitacoracod' => $bitacoracod, 'bitacorafch' => $bitacorafch, 'bitprograma' => $bitprograma, 'bitdescripcion' => $bitdescripcion, 'bitobservacion' => $bitobservacion, 'bitTipo' => $bitTipo, 'bitusuario' => $bitusuario];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function updateBitacora($bitacoracod, $bitacorafch, $bitprograma, $bitdescripcion, $bitobservacion, $bitTipo, $bitusuario)
        {

                $sqlstr = "UPDATE bitacora SET bitacoracod = :bitacoracod, bitacorafch = :bitacorafch, bitprograma = :bitprograma, bitdescripcion = :bitdescripcion, bitobservacion = :bitobservacion, bitTipo = :bitTipo, bitusuario = :bitusuario WHERE bitacoracod = :bitacoracod";
                $params = ['bitacoracod' => $bitacoracod, 'bitacorafch' => $bitacorafch, 'bitprograma' => $bitprograma, 'bitdescripcion' => $bitdescripcion, 'bitobservacion' => $bitobservacion, 'bitTipo' => $bitTipo, 'bitusuario' => $bitusuario];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }

        public static function obtenerPorId($id)
        {
                $sqlstr = "SELECT * FROM bitacora WHERE bitacoracod = :id";
                $params = ['id' => $id];
                $registros = self::obtenerUnRegistro($sqlstr, $params);
                return $registros;
        }

        public static function deleteBitacora($id)
        {
                $sqlstr = "DELETE  FROM bitacora WHERE bitacoracod = :id";
                $params = ['id' => $id];
                $registros = self::executeNonQuery($sqlstr, $params);
                return $registros;
        }
}
