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

class User{

    public static function generateUsername(){
        $adjectives = array(
            'Great', 'Happy', 'Fast', 'Bright', 'Elegant',
            'Brave', 'Clever', 'Gentle', 'Kind', 'Lucky',
            'Mighty', 'Polite', 'Sleek', 'Strong', 'Tender',
            'Vivid', 'Wise', 'Zealous', 'Adventurous', 'Charming'
        );
        
        $names = array(
            'Cat', 'Dog', 'Lion', 'Tiger', 'Eagle',
            'Bear', 'Dolphin', 'Falcon', 'Hawk', 'Jaguar',
            'Koala', 'Leopard', 'Owl', 'Panther', 'Rabbit',
            'Shark', 'Turtle', 'Wolf', 'Zebra', 'Giraffe'
        );
        $colors = array(
            'Red', 'Green', 'Blue', 'Yellow', 'Magenta',
            'Cyan', 'Maroon', 'Olive', 'Navy', 'Teal',
            'Purple', 'Aqua', 'Brown', 'Orange', 'Gray',
            'Silver', 'Gold', 'Pink', 'Lime', 'Indigo'
        );
        $signs = array('Vs', '@', '#', '$', 'Z', 'M', 'zP', 'Op');
        $randomAdjective = $adjectives[array_rand($adjectives)];
        $randomName = $names[array_rand($names)];
        $randomColor = $colors[array_rand($colors)];
        $currentHour = date('His');
        $randomSign = $signs[array_rand($signs)];
        $randomNumber = rand(1, 6);
        $hashed = hash('sha256', $randomAdjective.$randomName.$randomNumber);
        $truncatedHash = substr($hashed, rand(1,10), $randomNumber);
        $username = $randomColor. $randomAdjective. $randomName.$currentHour.$randomSign.$truncatedHash;
        return $username;
     

    }
    public static function generateUserid()
    {
        return $secureUniqueID = bin2hex(random_bytes(32));
    }
    public static function generateid()
    {
        return $secureUniqueID = bin2hex(random_bytes(64)).date("Y-m-d H:i:s");
    }
}