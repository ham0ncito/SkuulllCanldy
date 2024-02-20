<?php

namespace Utilities\Secrets;

use Utilities\Context;
use Dao\Table;
/*
Esta clase es algo interesante. Se usa un cifrado cypher, con un un metodo seguro que no se mencionará aca. Luego se saltea el valor y se devuelve ese valor, 
La siguiente funcion decrypt, toma la clave y decifra los valores. 
Hay una que usa ivs para hacerlo mas seguro, pero en este caso no se ocupan, porque generaria un nuevo encryptado y no se podria comparar

Con respecto a la decision de lo anterior, a pesar que no usar ivs es inseguro, es mucho más inseguro tomar el valor de mi bd y transformarlo para comparar, porque queda el registro del valor correcto en los datos del navegador, en cambio, si no uso iv, solo tengo que tranformar el ingreso del usuario a un cifrado, si corresponden, puede entrar, sino, no arriesgo los datos de mi base de datos. 
*/

class Secrets extends Table {
    
    public static function encrypt($data)
    {
        $cipher = \Utilities\Context::getContextByKey("CIPHER");
        $key = \Utilities\Context::getContextByKey("KEY");
        error_reporting(E_ALL ^ E_WARNING);
        $encrypted = openssl_encrypt($data, $cipher, $key, 0);
        $ciphertext = base64_encode($encrypted);
        return $ciphertext; 
    }
    
    public static function decrypt($data){
        $cipher = \Utilities\Context::getContextByKey("CIPHER");
        $key = \Utilities\Context::getContextByKey("KEY");
        error_reporting(E_ALL ^ E_WARNING);
        $decoded = base64_decode($data);
        $iv_length = openssl_cipher_iv_length($cipher);
        $iv_dec = substr($decoded, 0, $iv_length);
        $encrypted_data = substr($decoded, $iv_length);
        $decrypted = openssl_decrypt($encrypted_data, $cipher, $key, 0, $iv_dec);
        return $decrypted; 
    }

    public static function encryptIV($data)
    {
        $cipher = \Utilities\Context::getContextByKey("CIPHER");
        $key = \Utilities\Context::getContextByKey("KEY");
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length("aes-128-cbc"));
        $encrypted = openssl_encrypt($data, $cipher, $key, 0, $iv);
        $ciphertext = base64_encode($iv . $encrypted);
        return $ciphertext; 
    }
    
    public static function isTheSame ($data, $comparedTo)
    {
        $result = ($comparedTo == self::decrypt($data)) ? true : false;
        return $result;
    }
}
  
    
   
    
   
    
