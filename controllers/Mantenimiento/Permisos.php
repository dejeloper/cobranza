<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Permisos extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->viewControl = 'Permisos';
        $this->load->model('Usuarios_model');
        $this->load->model('Usuarios_model');
        $this->load->model('TiposDocumentos_model');
        $this->load->model('Permisos_model');
        $this->load->model('Perfiles_model');
        $this->load->model('Estados_model');
        $this->load->model('Login_model');
        if (!$this->session->userdata('Login')) {
            $this->session->set_flashdata("error", "Debe iniciar sesión antes de continuar. Después irá a: http://".$_SERVER[HTTP_HOST].$_SERVER[REQUEST_URI] );
            $url = str_replace("/", "|", $_SERVER["REQUEST_URI"]);
            redirect(site_url("Login/index/" . substr($url, 1)));
        }
    }

    public function index() {
        redirect(site_url('Mantenimiento/' . $this->viewControl . "/Admin/"));
    }

    public function Admin() {
        $idPermiso = 8;
        $page = validarPermisoPagina($idPermiso);
        $dataPermisos = $this->Permisos_model->obtenerPermisos();

        $data = new stdClass();
        $data->Controller = "Permisos";
        $data->title = "Administración Permisos";
        $data->subtitle = "Listado de Permisos";
        $data->contenido = $this->viewControl . '/Admin';
        $data->ListaDatos = $dataPermisos;

        $this->load->view('frontend', $data);
    }

    public function Usuarios() {
        $idPermiso = 9;
        $page = validarPermisoPagina($idPermiso);
        $dataUsers = $this->Usuarios_model->obtenerUsuariosEP();

        $data = new stdClass();
        $data->Controller = "Permisos";
        $data->title = "Administración Permisos";
        $data->subtitle = "Listado de Usuarios";
        $data->contenido = $this->viewControl . '/Usuarios';
        $data->ListaDatos = $dataUsers;

        $this->load->view('frontend', $data);
    }

    public function Crear() {
        $idPermiso = 58;
        $page = validarPermisoPagina($idPermiso);
        $dataTipoPer = $this->Permisos_model->obtenerTiposPermisos();

        $data = new stdClass();
        $data->Controller = "Permisos";
        $data->title = "Crear Permisos";
        $data->subtitle = "Creacion de Permisos";
        $data->contenido = $this->viewControl . '/Crear';
        $data->ListaTipoPer = $dataTipoPer;

        $this->load->view('frontend', $data);
    }

    public function NewPermission() {
        $idPermiso = 120;
        $page = validarPermisoAcciones($idPermiso);
        
        if ($page) {
            $nombre = ucwords(strtolower(trim($this->input->post('nombre'))));
            $tipo = trim($this->input->post('tipo'));
            $controlador = trim($this->input->post('controlador'));

            //Datos Auditoría
            $user = $this->session->userdata('Usuario');
            $fecha = date("Y-m-d H:i:s");

            //Data Permiso
            $dataPermiso = array(
                "Nombre" => $nombre,
                "Tipo" => $tipo,
                "Controlador" => $controlador,
                "Habilitado" => 1,
                "UsuarioCreacion" => $user,
                "FechaCreacion" => $fecha
            );

            try {
                if ($this->Permisos_model->save($dataPermiso)) {
                    echo 1;
                } else {
                    echo "No se ha podido crear el permiso, inténtelo de nuevo";
                }
            } catch (Exception $e) {
                echo 'Ha habido una excepción: ' . $e->getMessage() . "<br>";
            }
        } else {
            echo "No tiene permisos para crear más permisos";
        }
    }

    public function Usuario($usuario) {
        $idPermiso = 10;
        $page = validarPermisoPagina($idPermiso);

        if (isset($usuario)) {
            $dataUser = $this->Usuarios_model->obtenerUsuarioPorCodEP($usuario);
            if (isset($dataUser) && $dataUser != FALSE) {
                $data = new stdClass();
                $data->Controller = "Permisos";
                $data->title = "Asignar Permisos";
                $data->subtitle = "Asignar Permisos a Usuario: " . $dataUser[0]["Nombre"];
                $data->contenido = $this->viewControl . '/Usuario';
                $data->dataUser = $dataUser;
                $data->usuarioPermisos = $usuario;

                $this->load->view('frontend', $data);
            }
        }
    }

    public function SearchpermUserControler() {
        $idPermiso = 8;
        $page = validarPermisoAcciones($idPermiso);
        if ($page) {
            $controlador = $this->input->post("controlador");
            $tipo = $this->input->post("tipo");
            $usuarioPermiso = $this->input->post("usuarioPermiso");
            if ($controlador == '*'){
                $controlador = null;
            }
            if ($tipo == '*'){
                $tipo = null;
            }
            $listaPermisos = $this->Permisos_model->obtenerPermisosXControl($controlador, $tipo);

            //var_dump($listaPermisos);
            if ($listaPermisos == FALSE) {
                echo 0;
            } else {
                $html = '';
                foreach ($listaPermisos as $value) {
                    $codigo = $value['Codigo'];
                    $nombre = $value['Nombre'];
                    $TipoPermiso = $value['TipoPermiso'];
                    $listaPermisosUsu = $this->Permisos_model->validarPermisosXUsuario($codigo, $usuarioPermiso);
                    $habilitado = "";

                    if ($listaPermisosUsu != FALSE) {
                        if ($listaPermisosUsu[0]["Habilitado"] == 1) {
                            $habilitado = 'checked = "yes"';
                        }
                    }

                    $html = $html . '<div class="col-md-4">
                                <div class="form-check">
                                    <input class="form-check-input checkboxPermisos" type="checkbox" value="' . $codigo . '" id="permiso_' . $codigo . '" ' . $habilitado . '>
                                    <label class="form-check-label" for="permiso_' . $codigo . '">
                                        ' . $codigo . '. '. $TipoPermiso.": ".$nombre . '
                                    </label>
                                </div>
                            </div>';
                }
                echo $html; 
            }
        } else {
            echo '<div class="alert alert-danger alert-dismissable fade in">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error</strong><br />No tiene permisos para ver la lista de permisos
                </div>';
        }
    }

    public function guardarPermisosUsuarios() { 
        $idPermiso = 10;
        $page = validarPermisoAcciones($idPermiso);
        if ($page) {       
            $idPermiso = $this->input->post("idPermiso");
            $usuarioPermiso = $this->input->post("usuarioPermiso");

            if ($idPermiso == null || $idPermiso == "") {
                echo "No se puede agregar el permiso. Falta Código del permiso.";
            } else {
                if ($usuarioPermiso == null || $usuarioPermiso == "") {
                    echo "No se puede agregar el permiso. Falta Usuario al que se le aplica el permiso.";
                } else {
                    $response = "0";
                    $permisoUsu = $this->Permisos_model->validarPermisosXUsuario($idPermiso, $usuarioPermiso);

                    if (isset($permisoUsu) && $permisoUsu != FALSE) {
                        $response = $this->updatePermisosUsu($permisoUsu[0]["Codigo"], $permisoUsu[0]["Habilitado"]);
                    } else {
                        $response = $this->savePermisosUsu($idPermiso, $usuarioPermiso);
                    }

                    return $response;
                }
            }
        } else {
            echo "No tiene permisos para asignar permisos.";
        }
    }

    public function savePermisosUsu($idPermiso, $usuarioPermiso) {
        //Datos Auditoría
        $user = $this->session->userdata('Usuario');
        $fecha = date("Y-m-d H:i:s");

        try {
            $permiso = array(
                'Permiso' => $idPermiso,
                'Usuario' => $usuarioPermiso,
                'Habilitado' => 1,
                'UsuarioCreacion' => $user,
                'FechaCreacion' => $fecha
            );

            if ($this->Permisos_model->savePermisosUsuarios($permiso)) {
                echo 1;
            } else {
                echo 0;
            }
        } catch (Exception $e) {
            echo 'Ha habido una excepción: ' . $e->getMessage() . "<br>";
        }
    }

    public function updatePermisosUsu($codigo, $habilitado) {
        //Datos Auditoría
        $user = $this->session->userdata('Usuario');
        $fecha = date("Y-m-d H:i:s");

        try {
            $habilitado = ($habilitado) ? 0 : 1;
            $permiso = array(
                'Habilitado' => $habilitado,
                'UsuarioModificacion' => $user,
                'FechaModificacion' => $fecha
            );

            if ($this->Permisos_model->updatePermisosUsuarios($codigo, $permiso)) {
                echo 1;
            } else {
                echo 0;
            }
        } catch (Exception $e) {
            echo 'Ha habido una excepción: ' . $e->getMessage() . "<br>";
        }
    }

}

?>
