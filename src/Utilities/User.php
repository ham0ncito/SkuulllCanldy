<?php
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
        
        $currentHour = date('Hi');
        $randomAdjective = $adjectives[array_rand($adjectives)];
        $randomName = $names[array_rand($names)];
        
        $username = $randomAdjective . $randomName . $currentHour;

        return $username;
     

    }
    public static function generateUserid()
    {
        return $secureUniqueID = bin2hex(random_bytes(32));
    }
}