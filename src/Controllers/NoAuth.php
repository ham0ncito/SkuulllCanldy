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
namespace Controllers;
/*Este archivo PHP define una clase llamada NoAuth dentro del espacio de nombres Controllers. Aquí hay un resumen de su funcionalidad:

Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers, lo que sugiere que forma parte de un conjunto de controladores en la aplicación.

Clase NoAuth: Esta clase probablemente se utiliza para manejar casos en los que un usuario no está autenticado.

Método run(): Este método es público y no devuelve ningún valor (void). Controla la lógica para renderizar una vista llamada "noauth" utilizando el renderer de vistas. Si el usuario está autenticado, renderiza la vista usando un posible diseño privado (PRIVATE_LAYOUT), de lo contrario, simplemente renderiza la vista "noauth". */
class NoAuth extends PublicController
{
    public function run() :void
    {
        
        if (\Utilities\Security::isLogged()){
            if (\Utilities\Context::getContextByKey("PRIVATE_LAYOUT") !== "") {
                \Views\Renderer::render(
                    "noauth",
                    array(),
                    \Utilities\Context::getContextByKey("PRIVATE_LAYOUT")
                );
            } else {
                \Views\Renderer::render("noauth", array());
            }
        } else {
            \Views\Renderer::render("noauth", array());
        }
    }
}
?>