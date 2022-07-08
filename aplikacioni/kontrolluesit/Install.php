<?php 
if ( ! defined('BASEPATH')) 
exit('No direct script access allowed');

/*	
 *	#autori : Ilirjan Rexho
 *	30 shkurt, 2015
 *	http://computerhouse.al
 */
 

class Install extends CI_Controller
{
    
    
    /*** si rregull funksioni, ridirekton ne faqen login nqs asnje admin nuk eshte loguar ende ***/
    public function index()
    {
        $this->load->view('backend/install');
    }
    
    
    
}
/* Fundi i skedarit install.php */
/* Vendndodhja: ./sistemi/applikacioni/controllers/install.php */