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

/*Este script PHP define un controlador llamado `Bitacora` en el espacio de nombres `Controllers\Bitacoras`. Este controlador maneja la lógica relacionada con las bitácoras. El método `run()` se encarga de renderizar la lista de bitácoras. Primero, agrega un enlace al estilo de la bitácora. Luego, prepara los datos de vista asignando nombres a las variables de la bitácora. Si el usuario es un administrador, obtiene las bitácoras llamando al método `getBitacora()` del DAO correspondiente y verifica si el resultado está vacío para establecer la bandera `isEmpty`. Finalmente, prepara los datos de vista relacionados con los permisos del usuario y renderiza la plantilla `bitacoralist`. */
namespace Controllers\Bitacoras;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Bitacoras\Bitacoras as DAOBitacora;
use Utilities\Site;
use Utilities\Validators;
use Utilities\Context;
use Utilities\Paging;

class Bitacora extends PrivateController
{
    private $bitacoracod;
    private $bitacorafch;
    private $bitprograma;
    private $bitdescripcion;
    private $bitobservacion;
    private $bitTipo;
    private $bitusuario;

    public function run(): void
    {
        Site::addLink('bitacora_style');
        $viewData['bitacoracod'] = 'bitacoracod';
        $viewData['bitacorafch'] = 'bitacorafch';
        $viewData['bitprograma'] = 'bitprograma';
        $viewData['bitdescripcion'] = 'bitdescripcion';
        $viewData['bitobservacion'] = 'bitobservacion';
        $viewData['bitTipo'] = 'bitTipo';
        $viewData['bitusuario'] = 'bitusuario';
        if (\Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN')) {
            if (\Utilities\Functions::isAnEmptyArray($viewData['bitacora'] = DAOBitacora::getBitacora())) {
                $viewData['isEmpty'] = True;
            }else{
                $viewData['isEmpty'] = false;  
            }
        } else {}
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');
        Renderer::render("bitacoras/bitacoralist", $viewData);
    }
}