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
/*Este archivo PHP define una clase llamada Error dentro del espacio de nombres Controllers. Aquí está un resumen de su funcionalidad:



Espacio de nombres (namespace): La clase está dentro del espacio de nombres Controllers, lo que sugiere que forma parte de un conjunto de controladores en la aplicación.

Clase Error: Esta clase se utiliza como controlador para manejar errores en la aplicación.

Método run(): Este método es público y no devuelve ningún valor (void). Se encarga de obtener el código de error del contexto y, en caso de no encontrar uno, establece el código de error predeterminado en 404. Luego, determina el mensaje de error en función del código recibido. Después, utiliza la función http_response_code() para establecer el código de respuesta HTTP y, finalmente, utiliza el renderer de vistas para renderizar la vista de error, pasando el código de error y el mensaje de error como datos de vista. */
namespace Controllers;

class Error extends PublicController
{
    public function run(): void
    {
        $error_code = \Utilities\Context::getContextByKey("ERROR_CODE");
        $error_code = $error_code === "" ? 404 : $error_code;
        $error_msg = "Something stranges has happened";
        switch ($error_code) {
            case 404:
                $error_msg = "We could not find the requested";
                break;
            case $error_code >= 500:
                $error_msg = "Something unexpected happened";
                break;
        }
        http_response_code($error_code);
        \Views\Renderer::render(
            "error",
            [
                "CLIENT_ERROR_CODE" => $error_code,
                "CLIENT_ERROR_MSG" => $error_msg
            ]
        );
    }
}