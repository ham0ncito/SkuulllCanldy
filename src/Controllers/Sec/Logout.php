<?php
namespace Controllers\Sec;
use Utilities\Secur\Crypt as sec; 
use DAO\Logusers\Logusers as TheLog; 



/* https://th.bing.com/th/id/OIP.gpqmtUD7Xu0BZMXJGR5McAHaI0?rs=1&pid=ImgDetMain */
class Logout extends \Controllers\PublicController
{
    public function run():void
    {
        TheLog::insertLoguser( $_SESSION["login"]["userId"] ,"LGO", date("Y-m-d H:i:s"));
        \Utilities\Security::logout();  
        \Utilities\Site::redirectTo("index.php");
    }
}

?>