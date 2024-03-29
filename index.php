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
 * @category Router
 * @package  SimplePHPOOPMvc
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */

use Utilities\Context;
use Utilities\Site;

require __DIR__ . '/vendor/autoload.php';

/* Check https://stackoverflow.com/questions/6360093/how-to-set-lifetime-of-session */
session_set_cookie_params(1800, "/");
session_start();

try {
    Site::configure();
    if (!isset($_SESSION['last_activity'])) {
        $_SESSION['last_activity'] = time();
        $current_time = time();
        $last_activity_time = $_SESSION['last_activity'];
        $time_difference = $current_time - $last_activity_time;
        //Our server default setting is 30 minutes
        $session_lifetime = ini_get('session.gc_maxlifetime');
        if ($time_difference > $session_lifetime) {
            session_unset();
            session_destroy();
            Site::redirectTo("index.php?page=sec.login&redirto=" . $redirTo);
        }
    } else {
        $_SESSION['last_activity'] = time();
    }
    $pageRequest = Site::getPageRequest();
    $instance = new $pageRequest();
    $instance->run();
    die();
} catch (\Controllers\PrivateNoAuthException $ex) {
    $instance = new \Controllers\NoAuth();
    $instance->run();
    die();
} catch (\Controllers\PrivateNoLoggedException $ex) {
    $redirTo = urlencode(Context::getContextByKey("request_uri"));
    Site::redirectTo("index.php?page=sec.login&redirto=" . $redirTo);
    die();
} catch (Exception $ex) {
    Site::logError($ex, 500);
    $instance = new \Controllers\Error();
    $instance->run();
    die();
} catch (Error $ex) {
    Site::logError($ex, 500);
    $instance = new \Controllers\Error();
    $instance->run();
    die();
}
