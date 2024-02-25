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

namespace Utilities\PixelPay;

use Utilities\Context;

class PixelPayOrder{

    private $_request;
    private $_apirurl;
    private $_body = array(
        "_key" => "",
        "_callback" => "",
        "_cancel" => "",
        "_complete" => "",
        "_order_id" => "",
        "_order_date" => "", // dd-mm-aa hh:mm
        "_order_content" => "", //base64
        "_order_extras" => "", //base64
        "_currency"=>"HNL", // HNL, USD
        "_tax_amount"=> 0,
        "_shipping_amount" => 0,
        "_amount" => 0,
        "_first_name" => "",
        "_last_name" => "",
        "_email"=>"",
        "_address" => "",
        "_address_alt"=> "",
        "_zip" => "",
        "_city" => "",
        "_state" => "",
        "_country" => "",
        "json" => true
    );
    public function __construct()
    {
        $this->_body["_key"] = Context::getContextByKey("PIXELPAY_KEY");
        $this->_apirurl = (Context::getContextByKey("PIXELPAY_ENV") === "PRD") ?
            Context::getContextByKey("PIXELPAY_URL"):
            "https://pixelpay.app";
        
    }
}

?>
