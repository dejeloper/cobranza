<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Log_model extends CI_Model {

    public function obtenerLogPorUser($usuario) {
        $this->db->where('Usuario', $usuario);
        $this->db->order_by("Codigo", "DESC");
        $this->db->limit(2000);
        $query = $this->db->get("Log");
        //echo $this->db->last_query();
        if ($query->num_rows() <= 0) {
            return false;
        } else {
            return $query->result_array();
        }
    }

    public function obtenerLogPorCod($Codigo) {
        $this->db->where('Codigo', $Codigo);
        $query = $this->db->get("Log");
        if ($query->num_rows() <= 0) {
            return false;
        } else {
            return $query->result_array();
        }
    }

    public function save($data) {
        if ($this->db->insert("Log", $data)) {
            return $error = $this->db->error();
        } else {
            return 1;
        }
    }

}
