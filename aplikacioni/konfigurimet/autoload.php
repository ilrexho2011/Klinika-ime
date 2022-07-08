<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
| SKEDARI AUTO-LOADER
| -------------------------------------------------------------------
| Ky skedar specifikon sistemet qe duhet te ngarkohen si rregull standart.
|
| Ne menyre qe te ruhet nje strukture sa me e lehte e frameworkut duhet qe vetem
| burimet absolutisht minimale te ngarkohen si default. Per shembull,
| nqs nuk konektohemi automatikisht ne databaze, ky skedar ju lejon qe globalisht te percaktoni
| sistemet qe kane per tu ngarkuar ne cdo kerkese.
|
| -------------------------------------------------------------------
| Instruksione
| -------------------------------------------------------------------
|
| Keto jane modulet qe mund te ngakohen automatikisht:
|
| 1. Paketat
| 2. Librarite
| 3. Skedaret ndihmes
| 4. Skedaret konfigurues sipas deshires
| 5. Skedaret e gjuhes
| 6. Modelet
|
*/

/*
| -------------------------------------------------------------------
|  Paketat e Vete ngarkueshme
| -------------------------------------------------------------------
| Prototipi:
|
|  $autoload['packages'] = array(APPPATH.'third_party', '/usr/local/shared');
|
*/

$autoload['packages'] = array();


/*
| -------------------------------------------------------------------
|  Librarite e Vete ngarkueshme
| -------------------------------------------------------------------
| Keto jane klasat e ngarkuara ne dosjen system/libraries
| ose ne dosjen application/libraries.
|
| Prototipi:
|
|	$autoload['libraries'] = array('database', 'session', 'xmlrpc');
*/

$autoload['libraries'] = array('pagination', 'xmlrpc' , 'form_validation', 'email','upload','paypal');


/*
| -------------------------------------------------------------------
|  Driverat e Vete Ngarkueshem
| -------------------------------------------------------------------
| Keto klasa ndodhen ne dosjen system/libraries ose ne dosjen
| application/libraries. Ato ofrojne
| opsione te shumta te komunikimi te ndersjellte.
|
| Prototipi:
|
|	$autoload['drivers'] = array('cache');
*/

$autoload['drivers'] = array();


/*
| -------------------------------------------------------------------
|  Skedaret e Ndihmes te Vete Ngarkueshme
| -------------------------------------------------------------------
| Prototipi:
|
|	$autoload['helper'] = array('url', 'file');
*/

$autoload['helper'] = array('url','file','form','security','string','inflector','directory','download','multi_language');


/*
| -------------------------------------------------------------------
|  Skedaret e Konfigurimit te Vete Ngarkueshem
| -------------------------------------------------------------------
| Prototipi:
|
|	$autoload['config'] = array('config1', 'config2');
|
| Shenim: Me siper paraqitet ilustrimi ne rastet kur kemi krijuar skedare konfigurimi sipas deshires, perndryshe duhet lene bosh.
| 
|
*/

$autoload['config'] = array();


/*
| -------------------------------------------------------------------
|  Skedaret e gjuhes se Vete Ngarkueshme
| -------------------------------------------------------------------
| Prototype:
|
|	$autoload['language'] = array('lang1', 'lang2');
|
| NOTE: Mos e perfshini pjesezen "_lang" te skedarit tuaj.  Si psh
| "codeigniter_lang.php" duhet referuar si array('codeigniter');
|
*/

$autoload['language'] = array();


/*
| -------------------------------------------------------------------
|  Modelet e Vete Ngarkueshme
| -------------------------------------------------------------------
| Prototipi:
|
|	$autoload['model'] = array('model1', 'model2');
|
*/

$autoload['model'] = array( 'email_model' , 'crud_model', 'sms_model');
