<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


class Login extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('crud_model');
        $this->load->database();
        $this->load->library('session');
        /* kontrollimi i kashese */
        $this->output->set_header('Last-Modified: ' . gmdate("D, d M Y H:i:s") . ' GMT');
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
        $this->output->set_header("Expires: Mon, 26 Jul 2010 05:00:00 GMT");
    }

    //Funksioni standart, ridirekton ne hapesiren e duhur perdoruesit e loguar
    public function index() {

        if ($this->session->userdata('admin_login') == 1)
            redirect(base_url() . 'index.php?admin/dashboard', 'refresh');
        
        else if ($this->session->userdata('doctor_login') == 1)
            redirect(base_url() . 'index.php?doctor', 'refresh');
        
        else if ($this->session->userdata('patient_login') == 1)
            redirect(base_url() . 'index.php?patient', 'refresh');
        
        else if ($this->session->userdata('nurse_login') == 1)
            redirect(base_url() . 'index.php?nurse', 'refresh');
        
        else if ($this->session->userdata('pharmacist_login') == 1)
            redirect(base_url() . 'index.php?pharmacist', 'refresh');
        
        else if ($this->session->userdata('laboratorist_login') == 1)
            redirect(base_url() . 'index.php?laboratorist', 'refresh');
        
        else if ($this->session->userdata('accountant_login') == 1)
            redirect(base_url() . 'index.php?accountant', 'refresh');
        
        else if ($this->session->userdata('receptionist_login') == 1)
            redirect(base_url() . 'index.php?receptionist', 'refresh');

        $this->load->view('backend/login');
    }

    // Funksioni i logimit ne Ajax 
    function ajax_login() {
        $response = array();

        // Marrja me metoden e POST-imit e email, password-it nepermjet kerkeses ne ajax
        $email = $_POST["email"];
        $password = $_POST["password"];
        $response['submitted_data'] = $_POST;

        // Validimi i logimit
        $login_status = $this->validate_login($email, $password);
        $response['login_status'] = $login_status;
        if ($login_status == 'success') {
            $response['redirect_url'] = $this->session->userdata('last_page');
        }

        // Pergjigja validuese me ane te ajax
        echo json_encode($response);
    }

    // Validimi i logimit me ane te kerkeses ne ajax
    function validate_login($email = '', $password = '') {
        $credential = array('email' => $email, 'password' => sha1($password));


        
        
        // Kontrollimi i kredencialeve te logimit per admin-in
        $query = $this->db->get_where('admin', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('admin_login', '1');
            $this->session->set_userdata('login_user_id', $row->admin_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'admin');
            return 'success';
        }
        
        // Kontrollimi i kredencialeve te logimit per mjekun
        $query = $this->db->get_where('doctor', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('doctor_login', '1');
            $this->session->set_userdata('login_user_id', $row->doctor_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'doctor');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per pacientin
        $query = $this->db->get_where('patient', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('patient_login', '1');
            $this->session->set_userdata('login_user_id', $row->patient_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'patient');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per infermierin
        $query = $this->db->get_where('nurse', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('nurse_login', '1');
            $this->session->set_userdata('login_user_id', $row->nurse_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'nurse');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per farmacistin
        $query = $this->db->get_where('pharmacist', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('pharmacist_login', '1');
            $this->session->set_userdata('login_user_id', $row->pharmacist_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'pharmacist');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per laborantin
        $query = $this->db->get_where('laboratorist', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('laboratorist_login', '1');
            $this->session->set_userdata('login_user_id', $row->laboratorist_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'laboratorist');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per llogaritarin
        $query = $this->db->get_where('accountant', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('accountant_login', '1');
            $this->session->set_userdata('login_user_id', $row->accountant_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'accountant');
            return 'success';
        }
        // Kontrollimi i kredencialeve te logimit per recepsionistin
        $query = $this->db->get_where('receptionist', $credential);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $this->session->set_userdata('receptionist_login', '1');
            $this->session->set_userdata('login_user_id', $row->receptionist_id);
            $this->session->set_userdata('name', $row->name);
            $this->session->set_userdata('login_type', 'receptionist');
            return 'success';
        }

        return 'invalid';
    }

    /*     * * ERRORI STANDART 404 - DEFAULT NOT FOUND PAGE * *     */

    function four_zero_four() {
        $this->load->view('four_zero_four');
    }

    /*     * * RESETIM PASSWORDI ME ANE TE EMAIL-it * *     */

    function reset_password() {
        $account_type = $this->input->post('account_type');
        if ($account_type == "") {
            redirect(base_url(), 'refresh');
        }
        $email = $this->input->post('email');
        $result = $this->email_model->password_reset_email($account_type, $email); 
        if ($result == true) {
            $this->session->set_flashdata('flash_message', get_phrase('password_sent'));
        } else if ($result == false) {
            $this->session->set_flashdata('flash_message', get_phrase('account_not_found'));
        }

        redirect(base_url(), 'refresh');
    }

    /*     * ***** FUNKSIONI I DALJES ****** */

    function logout() {
        $this->session->sess_destroy();
        $this->session->set_flashdata('logout_notification', 'logged_out');
        redirect(base_url(), 'refresh');
    }

}
