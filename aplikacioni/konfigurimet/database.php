<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
|          RREGULLIMET E KONEKTIVITETIT TE DATABAZES
| -------------------------------------------------------------------
| Skedari permban rregullimet e nevojshme per aksesimin e databazes.
|
| -------------------------------------------------------------------
| EXPLANATION OF VARIABLES
| -------------------------------------------------------------------
|
|	['dsn']      Stringu DSN pershkruan nje koneksion me databazen.
|	['hostname'] Hostname - emri i serverit te databazes suaj.
|	['username'] Username - Emri i perdoruesit per tu lidhur me databazen.
|	['password'] Fjalekalimi per te aksesuar databazen tuaj.
|	['database'] Emri i databazes me te cilen doni te konektoheni.
|	['dbdriver'] Driveri i databazes psh: mysql, mysqli.
|				 Tipet e suportuar:
|				 cubrid, ibase, mssql, mysql, mysqli, oci8,
|				 odbc, pdo, postgre, sqlite, sqlite3, sqlsrv.
|	['dbprefix'] Mund te shtoni nje parashtese, qe do tju bashkengjitet
|				 emrit te tabeles kur te perdorni klasen "Query Builder".
|	['pconnect'] TRUE/FALSE - nese doni te perdorni nje koneksion persistente.
|	['db_debug'] TRUE/FALSE - Nese erroret e databazes duhet te paraqiten.
|	['cache_on'] TRUE/FALSE - Aktivizon/caktivizon "query caching".
|	['cachedir'] Rrugekalimi per tek dosja ku ruhen skedaret e cache-se.
|	['char_set'] Bashkesia e karaktereve qe perdoren per te komunikuar me databazen.
|	['dbcollat'] Krahasimi i karaktereve qe perdoret per komunikim me databazen
|				 SHENIM: Për MySQL dhe MySQLi bazat e të dhënave , ky parametër është përdorur vetëm
| 				 sin nje Backup nqs serveri juaj perdor PHP < 5.2.3 ose MySQL < 5.0.7
|				 (dhe ne pyetesoret qe krijojne tabela te bera me ane te DB Forge).
| 				 Ka nje mosperputhshmeri ne PHP me mysql_real_escape_string() qe
| 				 mund ta bejne sitin tuaj vulnerabel ndaj injeksionit SQL nese do te perdorni nje
| 				 karakter multi-byte.
| 				 Sitet qe perdorin Latin-1 ose UTF-8 nuk influencohen nga problemi i injektimit.
|	['swap_pre'] Prefiksi standart i tabeles qe do te shkembehet me ane te "dbprefix"
|	['encrypt']  Nese do ose nuk do te perdoresh koneksion te encryptuar.
|
|			'mysql' (deprecated), 'sqlsrv' dhe 'pdo/sqlsrv' driverat pranojne TRUE/FALSE
|			'mysqli' dhe 'pdo/mysql' driverat pranojne nje tabele me opsionet e meposhtme:
|
|				'ssl_key'    - Rrugekalimi per tek skedari i "private key"
|				'ssl_cert'   - Rrugekalimi per tek skedari i "public key certificate"
|				'ssl_ca'     - Rruga per tek skedari "certificate authority"
|				'ssl_capath' - Rruga per ne direktorine qe permban "trusted CA certificats" ne formatin PEM
|				'ssl_cipher' - Lista e *shifrimit te lejuar* qe do te perdoret per enkriptim, te ndara me dy pika (':')
|				'ssl_verify' - TRUE/FALSE; Per verifikimin e certifikates se serverit ( vetem 'mysqli')
|
|	['compress'] Nese do te perdoret ose jo "client compression" (vetem per MySQL)
|	['stricton'] TRUE/FALSE - detyron qe koneksionet te jene 'Strict Mode'
|							- gje e mire per te pasur nje strict SQL
|	['ssl_options']	perdoret per vendosjen e nje sere opsionesh SSL kur behen koneksione SSL.
|	['failover'] array - Nje tabele me 0 ose me shume te dhena per koneksionet nese kryesori deshton.
|	['save_queries'] TRUE/FALSE - Nese do te ruhen me "save" pyetesoret e ekzekutuar.
| 				SHENIM: Nese do te c'aktivizoni kete gjithashtu do te c'aktivizoje si
| 				$this->db->last_query() ashtu edhe "DB queries".
| 				Kur ekzekutoni nje query, me opsionin ne vleren TRUE (default),
| 				CodeIgniter do te ruaje instruksionin SQL per qellime korrigjimi (debugging).
| 				Por kjo mund te sjelle shkalle te larte perdorimi te memories, sidomos kur
| 				perdorni shume pyetesore SQL ... c'aktivizojeni per te shmangur problemin.
|
*/

$active_group = 'default';
$query_builder = TRUE;

$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost',
	'username' => '',
	'password' => '',
	'database' => '',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => TRUE,
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);
