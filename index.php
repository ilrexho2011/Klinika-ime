<?php
/*
 *---------------------------------------------------------------
 * AMBIENTI I APLIKACIONIT
 *---------------------------------------------------------------
 */
	define('ENVIRONMENT', isset($_SERVER['CI_ENV']) ? $_SERVER['CI_ENV'] : 'development');

/*
 *---------------------------------------------------------------
 * RAPORTIMI I ERROREVE
 *---------------------------------------------------------------
 */
switch (ENVIRONMENT)
{
	case 'development':
		error_reporting(-1);
		ini_set('display_errors', 1);
	break;

	case 'testing':
	case 'production':
		ini_set('display_errors', 0);
		if (version_compare(PHP_VERSION, '5.3', '>='))
		{
			error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT & ~E_USER_NOTICE & ~E_USER_DEPRECATED);
		}
		else
		{
			error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_USER_NOTICE);
		}
	break;

	default:
		header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
		echo 'Mjedisi i aplikacionit eshte i papershtatshem.';
		exit(1); // EXIT_ERROR
}

/*
 *---------------------------------------------------------------
 * EMRI I DOSJES SYSTEM
 *---------------------------------------------------------------
 */
	$system_path = 'system';

/*
 *---------------------------------------------------------------
 * EMRI I DOSJES APPLICATION
 *---------------------------------------------------------------
 */
	$application_folder = 'aplication';

/*
 *---------------------------------------------------------------
 * EMRI I DOSJES VIEW
 *---------------------------------------------------------------
 *
 */
	$view_folder = '';
/* ______________________________________________________________
*/
	if (defined('STDIN'))
	{
		chdir(dirname(__FILE__));
	}

	if (($_temp = realpath($system_path)) !== FALSE)
	{
		$system_path = $_temp.'/';
	}
	else
	{
		$system_path = rtrim($system_path, '/').'/';
	}

	// Eshte i sakte rrugekalimi i sistemit?
	if ( ! is_dir($system_path))
	{
		header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
		echo 'Rrugekalimi i dosjes tuaj te sistemit i pa specifikuar saktesisht. Hapni skedarin e meposhtem dhe korrigjojeni kete: '.pathinfo(__FILE__, PATHINFO_BASENAME);
		exit(3); // MBYLLET_KONFIGURIMI
	}

/*
 * -----------------------------------------------------------------------
 *  Pasi dime rrugekalimet, vendosim rrugekalimet kryesore te konstanteve
 * -----------------------------------------------------------------------
 */
	// Emertesa e ketij SKEDARI
	define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));

	// Rruga per tek dosja system
	define('BASEPATH', str_replace('\\', '/', $system_path));

	// Rruga per tek front controller
	define('FCPATH', dirname(__FILE__).'/');

	// Emri i "system folder"
	define('SYSDIR', trim(strrchr(trim(BASEPATH, '/'), '/'), '/'));

	// Rruga per tek dosja "application"
	if (is_dir($application_folder))
	{
		if (($_temp = realpath($application_folder)) !== FALSE)
		{
			$application_folder = $_temp;
		}

		define('APPPATH', $application_folder.DIRECTORY_SEPARATOR);
	}
	else
	{
		if ( ! is_dir(BASEPATH.$application_folder.DIRECTORY_SEPARATOR))
		{
			header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
			echo 'Rrugekalimi i dosjes tuaj te aplikacionit i pa specifikuar saktesisht. Hapni skedarin e meposhtem dhe korrigjoje kete: '.SELF;
			exit(3); // MBYLLET_KONFIG
		}

		define('APPPATH', BASEPATH.$application_folder.DIRECTORY_SEPARATOR);
	}

	// Rruga per tek dosja "views"
	if ( ! is_dir($view_folder))
	{
		if ( ! empty($view_folder) && is_dir(APPPATH.$view_folder.DIRECTORY_SEPARATOR))
		{
			$view_folder = APPPATH.$view_folder;
		}
		elseif ( ! is_dir(APPPATH.'views'.DIRECTORY_SEPARATOR))
		{
			header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
			echo 'Rrugekalimi i dosjes tuaj te pamjeve i pa specifikuar saktesisht. Hapni skedarin e meposhtem dhe korrigjojeni kete:: '.SELF;
			exit(3); // DALJE_KONFIGURIMI
		}
		else
		{
			$view_folder = APPPATH.'views';
		}
	}

	if (($_temp = realpath($view_folder)) !== FALSE)
	{
		$view_folder = $_temp.DIRECTORY_SEPARATOR;
	}
	else
	{
		$view_folder = rtrim($view_folder, '/\\').DIRECTORY_SEPARATOR;
	}

	define('VIEWPATH', $view_folder);

/*
 * --------------------------------------------------------------------
 * NGARKOHET SKEDARI BOOTSTRAP
 * --------------------------------------------------------------------
 *
 */
require_once BASEPATH.'core/CodeIgniter.php';
