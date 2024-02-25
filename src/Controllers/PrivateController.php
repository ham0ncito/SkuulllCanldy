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
/**
 * PHP Version 7.2
 *
 * @category Private
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Private Access Controller Base Class
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */

 /*Este archivo PHP define una clase abstracta llamada PrivateController dentro del espacio de nombres Controllers. Aquí hay un resumen de su funcionalidad:


Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers, que sugiere que forma parte de un conjunto de controladores en la aplicación.

Clase abstracta: La clase es abstracta, lo que significa que no se puede instanciar directamente. Probablemente sirva como una clase base para otros controladores que requieren acceso privado.

Método _isAuthorized(): Este método verifica si el usuario tiene autorización para acceder al controlador y lanza una excepción PrivateNoAuthException si no está autorizado.

Método _isAuthenticated(): Este método verifica si el usuario está autenticado (logueado) y lanza una excepción PrivateNoLoggedException si no lo está.

Método isFeatureAutorized($feature): Este método verifica si el usuario tiene autorización para una característica específica y devuelve un valor booleano.

Constructor: El constructor llama a los métodos _isAuthenticated() y _isAuthorized() para verificar si el usuario está autenticado y autorizado cuando se instancia un controlador privado. */
abstract class PrivateController extends PublicController
{
    private function _isAuthorized()
    {
        $isAuthorized = \Utilities\Security::isAuthorized(
            \Utilities\Security::getUserId(),
            $this->name,
            'CTR'
        );
        if (!$isAuthorized){
            throw new PrivateNoAuthException();
        }
    }
    private function _isAuthenticated()
    {
        if (!\Utilities\Security::isLogged()){
            throw new PrivateNoLoggedException();
        }
    }
    protected function isFeatureAutorized($feature) :bool
    {
        return \Utilities\Security::isAuthorized(
            \Utilities\Security::getUserId(),
            $feature
        );
    }
    public function __construct()
    {
        parent::__construct();
        $this->_isAuthenticated();
        $this->_isAuthorized();

    }
}
