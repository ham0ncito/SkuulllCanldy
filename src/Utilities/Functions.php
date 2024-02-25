<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Utilities; 

class Functions{

    public static function generateId($sufix = "id")
    {
        return $secureUniqueID = bin2hex(random_bytes(64)).date('Hi').$sufix;
    }
    public static function isAnEmptyArray(array $array){
        return empty($array);
    }
    

}