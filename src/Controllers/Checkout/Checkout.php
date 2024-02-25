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
namespace Controllers\Checkout;
/*Este controlador PHP maneja el proceso de checkout, incluyendo la creación y gestión de órdenes de compra, la preparación de datos para su almacenamiento en la base de datos, y la interacción con PayPal. Aquí hay un resumen de las funciones principales:

1. **run():** Este método se ejecuta al cargar la página de checkout. Verifica si se ha enviado un formulario (POST). Si no, simplemente renderiza la vista de checkout. Si se ha enviado un formulario, crea una nueva orden de PayPal utilizando la clase `PayPalOrder` del espacio de nombres `Utilities\Paypal`, obtiene el ID de la orden generada por PayPal y redirige al usuario a la página de PayPal para completar el pago.

2. **getSession():** Este método recupera los detalles de los productos añadidos al carrito de compras de la sesión y los añade a la orden de PayPal utilizando el método `addItem()` de la clase `PayPalOrder`.

3. **addToDB():** Este método calcula el total de la compra y prepara los detalles de la compra para ser almacenados en la base de datos. Además, actualiza la sesión con los detalles de la compra.

4. **addPurchase():** Este método agrega la compra a la base de datos después de que se haya completado el pago a través de PayPal. Utiliza los detalles de la compra preparados anteriormente y los inserta en la tabla de compras (`purchase`). Además, maneja la lógica para actualizar las suscripciones de los usuarios si los productos comprados son suscripciones.

5. **getData():** Este método obtiene los datos del carrito de compras del usuario actual.

6. **getDetail():** Este método obtiene los detalles de la compra para mostrarlos en la vista de confirmación de compra.

7. **addToDetail():** Este método agrega detalles adicionales a los detalles de la compra.
. */
use Dao\Carretillas\Carretillas as Carrito;
use Controllers\PublicController;
use Dao\Purchases\Purchases as purchase; 
use Dao\Purchasedetails\Purchasedetails as detail;  


class Checkout extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_error",
                "http://localhost:8080/SkuulllCanldy/index.php?page=checkout_accept"
            );
            self::getSession($PayPalOrder);
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }
        $viewData['isCLN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLN');
        $viewData['isCLS'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'CLS');
        $viewData['isADMIN'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'ADMIN');
        $viewData['isAUDIT'] = \Dao\Security\Security::userIs($_SESSION['useremail'], 'AUDIT');

        \Views\Renderer::render("paypal/checkout", $viewData);
    }

    public static function getData()
    {
        $data = Carrito::getCarretillaByUser(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        return $data;
    }
    public static function getSession($PayPalOrder)
    {
        $xls = $_SESSION['xls'];
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $PayPalOrder->addItem(strval($productName), strval($productName." purchased on  ".Date('HH-mm-ss')) , strval($productId), floatval($productPrice),round(floatval($productPrice*0.15),2) , intval($productQuantity), "DIGITAL_GOODS");                
            }
        }
       
    }
    public static function addToDB(){
        $xls = $_SESSION['xls'];
        $total = 0.00; 
        $detail= "Purchased: ";  
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                $total += $productPrice * $productQuantity; 
                $detail .= " {{$productName}} || {{$productQuantity}} || {{$productPrice}} || "; 
                self::addToDetail($detail); 
               // Carrito::insertCarretilla($usercod, $productId, $productQuantity, $productPrice, Date('Y-M-D-H-i-s'));     
            }
        }
        $_SESSION['detailofPurchase'] = $detail;
        return $total; 
        
    }
    public static function getDetail()
    {
        $data = $_SESSION['detailofPurchase']; 
        unset($_SESSION['detailofPurchase']);
        return $data ;
    }
    public static function addToDetail($detail){
        return $detail.= $detail ."\n";  
    }


    public static function addPurchase($payment){
        $xls = $_SESSION['xls'];
        $idFor = \Utilities\Functions::generateId("purchase");
        purchase::insertPurchase($idFor,Date('Y-m-d H:mm:ss'),self::addToDb(),"Purchase on skuull2canldy", $payment,\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        if (isset($_SESSION['cart' . $xls])) {
            foreach ($_SESSION['cart' . $xls] as $product) {
                $usercod = $product['usercod'];
                $type = $product['type'];
                $productId = $product['productid'];
                $productName = $product['productName'];
                $productQuantity = $product['crrctd'];
                $productPrice = $product['crrprc'];
                $crrfching = $product['crrfching'];
                if (strval($type) == "subscription") {
                    $data = \Dao\Subscriptionusers\Subscriptionusers::getSubscriptionuserExist(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
                    if (!$data) {
                        $duration = \Dao\Subscriptions\Subscriptions::getDuration($productId);
                        $timestampActual = time();
                        $timestampResultado = $timestampActual + (intval($duration) * 24 * 60 * 60);                   
                        $dateend = date('Y-m-d', $timestampResultado); 
                        \Dao\Subscriptionusers\Subscriptionusers::insertSubscriptionuser(
                            \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']),
                            $productId,
                            $timestampActual,
                            $dateend,
                            'ACT'
                        );
                    }else{
                        $duration = \Dao\Subscriptions\Subscriptions::getDuration($productId);
                        $timestampActual = time();
                        $timestampGuardado = \Dao\Subscriptionusers\Subscriptionusers::getSubscriptionuserEnds(\Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']));
        
                        $duracionEnSegundos = intval($duration) * 24 * 60 * 60; 
                        $nuevoTimestamp = intval($timestampGuardado) + $duracionEnSegundos;
        
                        $fechaResultado = date('Y-m-d H:i:s', $nuevoTimestamp);
                        
                        
                        \Dao\Subscriptionusers\Subscriptionusers::updateSubscriptionuser(
                            \Dao\Security\Security::getCodigoByEmail($_SESSION['useremail']),
                            $productId,
                            $timestampActual,
                            $fechaResultado,
                            'ACT'                 
                        );
                    }
                } else {
                    detail::insertPurchasedetail($idFor, $productId, $productQuantity, $productPrice); 
                }
                
            
            }}
       
    }
    
    public static function generateAddItem($data)
    {
        if (!\Utilities\Functions::isAnEmptyArray(($data))) {
            $data = implode("", $data);
            echo $data;
        } else {
            echo '<script>alert("NO data"); </script>';
        }
    }
}