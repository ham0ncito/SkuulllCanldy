<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */

namespace Utilities\Secur;
class Crypt
{
    static function encryptDatum(string $dataToEncrypt, string $encryptionKey = "skull2candly", string $cipherMethod = "AES-256-CBC"): string
    {
        $ivLength = openssl_cipher_iv_length($cipherMethod);
        $iv = openssl_random_pseudo_bytes($ivLength);

        $encryptedData = openssl_encrypt($dataToEncrypt, $cipherMethod, $encryptionKey, 0, $iv);

        $encryptedDataWithIV = base64_encode($iv . '::' . $encryptedData);

        return $encryptedDataWithIV;
    }

    static function decryptDatum(string $dataToDecrypt, string $encryptionKey = "skull2candly", string $cipherMethod = "AES-256-CBC"): ?string
    {
        $data = base64_decode($dataToDecrypt);
        if ($data === false) {
            return null;
        }

        [$iv, $encryptedData] = explode('::', $data, 2);

        $decryptedData = openssl_decrypt($encryptedData, $cipherMethod, $encryptionKey, 0, $iv);

        if ($decryptedData === false) {
            return null;
        }

        return $decryptedData;
    }
    public static function encryptData($data, $key = "skull2candly")
    {
        $method = 'AES-256-CBC';
        $ivLength = openssl_cipher_iv_length($method);
        $iv = openssl_random_pseudo_bytes($ivLength);
        $encrypted = openssl_encrypt(serialize($data), $method, $key, 0, $iv);

        if ($encrypted === false) {
            return null;
        }

        $encryptedData = base64_encode($iv . $encrypted);
        return $encryptedData;
    }
    public static function decryptData($data, $key = "skull2candly")
    {
        $method = 'AES-256-CBC';
        $ivLength = openssl_cipher_iv_length($method);
        $data = base64_decode($data);

        $iv = substr($data, 0, $ivLength);
        $encryptedText = substr($data, $ivLength);

        $decrypted = openssl_decrypt($encryptedText, $method, $key, 0, $iv);
        
        if ($decrypted === false) {
            return null;
        }

        return unserialize($decrypted);
    }
}