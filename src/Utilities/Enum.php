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

namespace Utilities;

use ReflectionClass;

abstract class Enum
{
    const NONE = null;
    private function __construct()
    {
        throw new NotSupportedException(); // 
    }
    private function __clone()
    {
        throw new NotSupportedException();
    }
    final public static function toArray()
    {
        return (new ReflectionClass(static::class))->getConstants();
    }
    final public static function toFormatedArray()
    {
        $unFormated = (new ReflectionClass(static::class))->getConstants();
        $formated = array();
        foreach ($unFormated as $key => $value) {
            $formated[] = array("code" => $key, "value" => $value);
        }
        return $formated;
    }
    final public static function isValid($value)
    {
        return in_array($value, static::toArray());
    }
}
