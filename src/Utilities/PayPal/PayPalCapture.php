<?php
/**

 * PHP version 8.2.4
 *
 * @Date 22/08/23
 * @Last Update 20/2/24
 * @author     SkullCanldy
 * @link       https://www.php.net/docs.php
 */
namespace Utilities\Paypal;

use PayPalCheckoutSdk\Orders\OrdersCaptureRequest;

class PayPalCapture
{
    public static function captureOrder($orderId)
    {
        $request = new OrdersCaptureRequest($orderId);
        $client = PayPalClient::client();
        $response = $client->execute($request);
        return $response;
    }
}

?>
