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
namespace Controllers\Sec;
use DAO\Lognonusers\Lognonusers as nonuser; 
use Utilities\Functions as util; 
use Utilities\Secur\Crypt as sec;
class Login extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $xss_login ="";
    private $hasError = false;
  


    public function run() :void
    {
        $uniqueId = util::generateId();
        setcookie("COOKIE".$uniqueId, $uniqueId, time() + 3600, "/"); 
        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "¡Correo no tiene el formato adecuado!";
                $this->hasError = true;
                nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CNA');
            }
            if (\Utilities\Validators::IsEmpty($this->txtPswd)) {
                $this->errorPswd = "¡Debe ingresar una contraseña!";
                $this->hasError = true;
                nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'NPA');
            }
            if (! $this->hasError) {
                if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail)) {
                    if ($dbUser["userest"] != \Dao\Security\Estados::ACTIVO) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CON');
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s tiene cuenta con estado %s",
                                $dbUser["usercod"],
                                $dbUser["useremail"],
                                $dbUser["userest"]
                            )
                            
                        );
                        nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CI');
                    }
                    if (!\Dao\Security\Security::verifyPassword($this->txtPswd, $dbUser["userpswd"])) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s contraseña incorrecta",
                                $dbUser["usercod"],
                                $dbUser["useremail"]
                            )
                        );
                        nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CI');
                    }
                    /*Checkout documentation*/
                    if (isset($_POST["xss_login"])) {
                        $this->xss_login = $_POST["xss_login"];
                        if ($_SESSION["xss_login"] !== $this->xss_login) {
                            $this->generalError = "¡Hubo un problema de autenticación!";
                        $this->hasError = true;
                        error_log(
                            "Error de autenticación"
                        );
                        nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CI');
                        }
                    } 
                    if (! $this->hasError) {
                        \Utilities\Security::login(
                            $dbUser["usercod"],
                            $dbUser["username"],
                            $dbUser["useremail"]
                        );
                        if (\Utilities\Context::getContextByKey("redirto") !== "") {
                            \Utilities\Site::redirectTo(
                                \Utilities\Context::getContextByKey("redirto")
                            );
                        } else {
                            
                            $_SESSION['useremail'] =  $dbUser["useremail"];
                            $_SESSION['username'] =  $dbUser["username"];
                    $_SESSION['lastActive'] = date("Y-m-d H:i:s");\DAO\Logusers\Logusers::insertLoguser($dbUser["usercod"],"INI", date("Y-m-d H:i:s"));
                            \Utilities\Site::redirectTo("index.php?page=Home_Home");
                        }
                    }
                } else {
                    error_log(
                        sprintf(
                            "ERROR: %s trato de ingresar",
                            $this->txtEmail
                        )
                        
                    );
                    $this->generalError = "¡Credenciales son incorrectas!";
                    nonuser::insertLognonuser("id".$uniqueId, date("Y-m-d H:i:s"),"COOKIE".$uniqueId,'CI');
                }
            }
        }
        $this->xss_login = md5("login" . date('Ymdhisu'));
        $_SESSION["xss_login"] = $this->xss_login;
        $dataView = get_object_vars($this);
        \Views\Renderer::render("security/login", $dataView);
    }
}
?>