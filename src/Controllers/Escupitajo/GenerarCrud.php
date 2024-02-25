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

namespace Controllers\Escupitajo;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Escupitajo\GenerateCRUD;



class GenerarCrud extends PrivateController
{
  /*
Este controlador PHP, llamado "GenerarCrud", se encarga de generar el creador de paginas automatico para tablas de base de datos. Aquí está su funcionalidad:

run(): Este método se ejecuta cuando se accede a la página correspondiente. Inicializa los datos de vista y verifica los permisos del usuario. Luego, utiliza el renderizador para mostrar la vista "escupitajo/escupitajo".

handlePost(): Este método maneja las solicitudes POST enviadas al servidor. Si se detecta una solicitud POST y se envía el botón "escupitajobutton", el controlador procesa los datos enviados.

handleExistence($tableName): Verifica si la tabla cuyo nombre se pasó como argumento existe en la base de datos. Si la tabla existe, invoca el método "generate" para generar el CRUD para esa tabla y muestra las rutas relacionadas.

generate($tableName): Este método utiliza la clase "GenerateCRUD" para generar los controladores y plantillas necesarios para el CRUD de la tabla especificada. Llama a varios métodos estáticos de "GenerateCRUD" para generar el controlador de formulario, el controlador de lista, la plantilla de formulario, la plantilla de lista y el DAO (Data Access Object). */
  public function run(): void
  {
    $dataview = [];
    $dataview['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
    $dataview['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
    $dataview['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
    Renderer::render("escupitajo/escupitajo", $dataview);
    self::handlePost();
  }
  public function handlePost()
  {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
      if (isset($_POST["escupitajobutton"])) {
        $tableName = $_POST["nombre_tabla"];
        self::handleExistence($tableName);
      }
    }
  }
  public function handleExistence($tableName)
  {
    if (GenerateCrud::tableExists($tableName)) {
      self::generate($tableName);
      GenerateCRUD::ShowRoutes($tableName);
    }
  }
  public function generate($tableName)
  {

    GenerateCRUD::GenerateFormController($tableName);
    GenerateCRUD::GenerateListController($tableName);
    GenerateCRUD::GenerateFormTemplate($tableName);
    GenerateCRUD::GenerateListTemplate($tableName);
    GenerateCRUD::GenerateDAO($tableName);
  }
}