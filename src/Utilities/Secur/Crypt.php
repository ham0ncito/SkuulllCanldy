<?php

namespace Utilities\Secur;

class Crypt
{
    static function encryptDatum(string $dataToEncrypt, string $encryptionKey = "skull2candly", string          $cipherMethod = "AES-256-CBC"): string
    {
        $ivLength = openssl_cipher_iv_length($cipherMethod);
        $iv = openssl_random_pseudo_bytes($ivLength);

        $encryptedData = openssl_encrypt($dataToEncrypt, $cipherMethod, $encryptionKey, 0, $iv);

        $encryptedDataWithIV = base64_encode($iv . '::' . $encryptedData);

        return $encryptedDataWithIV;
    }

    static function decryptDatum(string $dataToDecrypt, string $encryptionKey = "skull2candly", string $cipherMethod = "AES-256-CBC"): ?string
    {

        [$iv, $encryptedData] = explode('::', base64_decode($dataToDecrypt), 2);

        $decryptedData = openssl_decrypt($encryptedData, $cipherMethod, $encryptionKey, 0, $iv);

        if ($decryptedData === false) {

            return null;
        }

        return $decryptedData;
    }
    static function encryptData(array $dataToEncrypt, string $encryptionKey = "skull2candly", string $cipherMethod = "AES-256-CBC"): string {
        $dataToEncryptJson = json_encode($dataToEncrypt);
        $ivLength = openssl_cipher_iv_length($cipherMethod);
        $iv = openssl_random_pseudo_bytes($ivLength);
    
        $encryptedData = openssl_encrypt($dataToEncryptJson, $cipherMethod, $encryptionKey, 0, $iv);
    
        $encryptedDataWithIV = base64_encode($iv . '::' . $encryptedData);
    
        return $encryptedDataWithIV;
    }
    
    static function decryptData(array $dataToDecrypt, string $encryptionKey = "skull2candly", string $cipherMethod = "AES-256-CBC"): ?array {
        $dataToDecryptString = json_encode($dataToDecrypt);
    
        if ($dataToDecryptString === false) {
            return null; 
        }
    
        [$iv, $encryptedData] = explode('::', $dataToDecryptString, 2);
    
        $decryptedData = openssl_decrypt($encryptedData, $cipherMethod, $encryptionKey, 0, $iv);
        $decryptedDataArray = json_decode($decryptedData, true);
    
        if ($decryptedDataArray === null) {
            return null;
        }
    
        return $decryptedDataArray;
    }
    
    
    
}