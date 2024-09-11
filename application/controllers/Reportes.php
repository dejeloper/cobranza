<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Reportes extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->viewControl = 'Reportes';
        $this->load->model('Reportes_model');
        $this->load->model('Usuarios_model');
        $this->load->model('Pagos_model');
        $this->load->model('Clientes_model');
        $this->load->model('Pedidos_model');
        $this->load->model('Estados_model');
        $this->load->model('Cobradores_model');
        if (!$this->session->userdata('Login')) {
            $this->session->set_flashdata("error", "Debe iniciar sesión antes de continuar. Después irá a: http://".$_SERVER[HTTP_HOST].$_SERVER[REQUEST_URI] );
            $url = str_replace("/", "|", $_SERVER["REQUEST_URI"]);
            redirect(site_url("Login/index/" . substr($url, 1)));
        }
    }

    public function index() {
        $this->session->set_flashdata("error", "No existe ningún el Reporte Indicado.");
        redirect(site_url("Clientes/index/"));
    }

    /* Clientes */

    public function Clientes() { 
        $validationAdmin = validarPermisoAdmin('Reporte de Clientes'); 
        $idPermiso = 36;
        $page = validarPermisoPagina($idPermiso);

        $f1 = date("Y-m-d 00:00:00");
        $f2 = date("Y-m-d 23:59:59");

        $Clientes = $this->ConteoClientes($f1, $f2);
        $data = new stdClass();
        $data->Controller = "Reportes";
        $data->title = "Reporte de Clientes";
        $data->subtitle = "Reporte de Clientes General";
        $data->contenido = $this->viewControl . '/Contador/Clientes';
        $data->Clientes = $Clientes;

        $this->load->view('frontend', $data);
    }

    public function Pagos() {
        $validationAdmin = validarPermisoAdmin('Reporte de Pagos'); 
        $idPermiso = 37; 
        $page = validarPermisoPagina($idPermiso);

        $f1 = date("Y-m-d 00:00:00");
        $f2 = date("Y-m-d 23:59:59");

        $Pagos = $this->ConteoPagos($f1, $f2);
        $data = new stdClass();
        $data->Controller = "Reportes";
        $data->title = "Reporte de Pagos";
        $data->subtitle = "Reporte de Pagos por Estados";
        $data->contenido = $this->viewControl . '/Contador/Pagos';
        $data->Pagos = $Pagos;

        $this->load->view('frontend', $data);
    }

    public function Contador($tipo) {
        switch ($tipo) {
            case "Clientes":
                $this->Clientes();
                break;
            case "Pagos":
                    $this->Pagos();
                    break;

            default:
                break;
        }
    }

    public function Cartera($tipo) {
        switch ($tipo) {
            case "Usuario":
                $this->CarteraUsuarios();
                break;

            default:
                $this->CarteraUsuarios();
                break;
        }
    }

    public function CarteraUsuarios() {
        $validationAdmin = validarPermisoAdmin('Reporte de Cartera por Usuario'); 
        $idPermiso = 38;
        $page = validarPermisoPagina($idPermiso);

        $dataUsuarios = $this->Usuarios_model->obtenerUsuariosEP();
        $fecha1 = date("Y-m-d 00:00:00");
        $fecha2 = date("Y-m-d 23:59:59");
        $dataPagos = $this->datosCarteraUsuarios("*", $fecha1, $fecha2);

        $data = new stdClass();
        $data->Controller = "Reportes";
        $data->title = "Cartera Por Usuarios";
        $data->subtitle = "Reporte de Cartera Por Usuarios";
        $data->contenido = $this->viewControl . '/Cartera/Usuarios';
        $data->ListaUsuarios = $dataUsuarios;
        $data->ListaPagos = $dataPagos;

        $this->load->view('frontend', $data);
    }

    public function datosCarteraUsuariosPost() {
        $usuario = trim($this->input->post('pag_usu'));
        $fecha1 = trim($this->input->post('pag_fec1') . " 00:00:00");
        $fecha1 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha1);
        $fecha2 = trim($this->input->post('pag_fec2') . " 23:59:59");
        $fecha2 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha2);
        $Pagos = $this->datosCarteraUsuarios($usuario, $fecha1, $fecha2);

        echo json_encode($Pagos);
    }

    public function datosCarteraUsuarios($usuario, $fecha1, $fecha2) {
        $Pagos = array();
        try {

            //Pagos
            $pag = $this->Reportes_model->pagosUsuarioFechas($usuario, $fecha1, $fecha2);
            $numPag = 0;
            $valorPag = 0;
            if ($pag != FALSE) {
                foreach ($pag as $value) {
                    $numPag++;
                    $valorPag = $valorPag + $value["Pago"];
                }
            }
            $pag = array();
            $pag["numPag"] = $numPag;
            $pag["valorPag"] = money_format("%.0n", $valorPag);
            $Pagos["pag"] = $pag;
            //Pagos Programados
            $pagopro = $this->Reportes_model->pagosProgramadosUsuarioFechas($usuario, $fecha1, $fecha2);
            $numPagPro = 0;
            $valorPagPro = 0;
            if ($pagopro != FALSE) {
                foreach ($pagopro as $value) {
                    $numPagPro++;
                    $valorPagPro = $valorPagPro + $value["Cuota"];
                }
            }
            $pagopro = array();
            $pagopro["numPagPro"] = $numPagPro;
            $pagopro["valorPagPro"] = money_format("%.0n", $valorPagPro);
            $Pagos["pagopro"] = $pagopro;
            //Pagos Descartados
            $pagodes = $this->Reportes_model->pagosDescartadosUsuarioFechas($usuario, $fecha1, $fecha2);
            $numPagDes = 0;
            $valorPagDes = 0;
            if ($pagodes != FALSE) {
                foreach ($pagodes as $value) {
                    $numPagDes++;
                    $valorPagDes = $valorPagDes + $value["Cuota"];
                }
            }
            $pagodes = array();
            $pagodes["numPagDes"] = $numPagDes;
            $pagodes["valorPagDes"] = money_format("%.0n", $valorPagDes);
            $Pagos["pagodes"] = $pagodes;
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage() . "<br>";
        }
        return $Pagos;
    }

    public function reportesUsuarios() {
        $usuario = "*";
        $fecha1 = date('Y-m-d') . " 00:00:00";
        //$fecha1 = "2018-08-05 00:00:00";
        $fecha2 = date('Y-m-d') . " 23:59:59";
        //$fecha2 = "2018-08-06 23:59:59";

        try {
            $arreglo["data"] = [];
            $i = 0;
            $btn = "";

            $pag = $this->Reportes_model->pagosUsuarioFechas($usuario, $fecha1, $fecha2);
            if ($pag != false) {
                foreach ($pag as $value) {
                    $nombre = $value["NomCliente"];
                    $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaPago"]));
                    $numPago = $value["Codigo"];
                    $btn = '<div style="text-align:center;margin:0px auto;">'
                            . '<a href="' . base_url() . 'Pagos/Consultar/' . $numPago . '/" target="_blank" title="Ver más"><i class="fa fa-search" aria-hidden="true" style="padding:5px;"></i></a>'
                            . '</div>';

                    $p = array(
                        "pedido" => $value["Pedido"],
                        "cliente" => $nombre,
                        "pago" => money_format("%.0n", $value["Pago"]),
                        "estado" => "Pagado",
                        "fecha" => $fecha,
                        "usuario" => $value["UsuarioCreacion"],
                        "btn" => $btn
                    );
                    $arreglo["data"][$i] = $p;
                    $i++;
                }
            }

            $pagopro = $this->Reportes_model->pagosProgramadosUsuarioFechas($usuario, $fecha1, $fecha2);
            if ($pagopro != false) {
                foreach ($pagopro as $value) {
                    $repetido = 0;
                    if ($pag != false) {
                        foreach ($pag as $item) {
                            if ($item["Confirmacion"] === $value["Codigo"]) {
                                $repetido++;
                            }
                        }
                    }
                    if ($repetido == 0) {
                        $numPago = $this->Reportes_model->obtenerPago($value["Codigo"]);
                        $numPago = $numPago[0]["Codigo"];
                        $btn = '<div style="text-align:center;margin:0px auto;">'
                                . '<a href="' . base_url() . 'Pagos/Consultar/' . $numPago . '/" target="_blank" title="Ver más"><i class="fa fa-search" aria-hidden="true" style="padding:5px;"></i></a>'
                                . '</div>';
                        $nombre = $value["NomCliente"];

                        if ($value["FechaModificacion"] == NULL) {
                            $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaCreacion"]));
                        } else {
                            $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaModificacion"]));
                        }

                        $p = array(
                            "pedido" => $value["Pedido"],
                            "cliente" => $nombre,
                            "pago" => money_format("%.0n", $value["Cuota"]),
                            "estado" => $value["NomEstado"],
                            "fecha" => $fecha,
                            "usuario" => $value["UsuarioCreacion"],
                            "btn" => $btn
                        );
                        $arreglo["data"][$i] = $p;
                        $i++;
                    }
                }
            }

            echo json_encode($arreglo);
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage() . "<br>";
        }
    }

    public function reportesUsuariosFiltro() {
        $usuario = trim($this->input->post('pag_usu'));
        $fecha1 = trim($this->input->post('pag_fec1') . " 00:00:00");
        $fecha1 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha1);
        $fecha2 = trim($this->input->post('pag_fec2') . " 23:59:59");
        $fecha2 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha2);

        try {
            $arreglo["data"] = [];
            $i = 0;
            $btn = "";

            $pag = $this->Reportes_model->pagosUsuarioFechas($usuario, $fecha1, $fecha2);
            if ($pag != false) {
                foreach ($pag as $value) {
                    $nombre = $value["NomCliente"];
                    $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaPago"]));
                    $numPago = $value["Codigo"];
                    $btn = '<div style="text-align:center;margin:0px auto;">'
                            . '<a href="' . base_url() . 'Pagos/Consultar/' . $numPago . '/" target="_blank" title="Ver más"><i class="fa fa-search" aria-hidden="true" style="padding:5px;"></i></a>'
                            . '</div>';

                    $p = array(
                        "pedido" => $value["Pedido"],
                        "cliente" => $nombre,
                        "pago" => money_format("%.0n", $value["Pago"]),
                        "estado" => "Pagado",
                        "fecha" => $fecha,
                        "usuario" => $value["UsuarioCreacion"],
                        "btn" => $btn
                    );
                    $arreglo["data"][$i] = $p;
                    $i++;
                }
            }

            $pagopro = $this->Reportes_model->pagosProgramadosUsuarioFechas($usuario, $fecha1, $fecha2);
            if ($pagopro != false) {
                foreach ($pagopro as $value) {
                    $repetido = 0;
                    if ($pag != false) {
                        foreach ($pag as $item) {
                            if ($item["Confirmacion"] === $value["Codigo"]) {
                                $repetido++;
                            }
                        }
                    }
                    if ($repetido == 0) {
                        $numPago = $this->Reportes_model->obtenerPago($value["Codigo"]);
                        $numPago = $numPago[0]["Codigo"];
                        $btn = '<div style="text-align:center;margin:0px auto;">'
                                . '<a href="' . base_url() . 'Pagos/Consultar/' . $numPago . '/" target="_blank" title="Ver más"><i class="fa fa-search" aria-hidden="true" style="padding:5px;"></i></a>'
                                . '</div>';

                        $nombre = $value["NomCliente"];

                        if ($value["FechaModificacion"] == NULL) {
                            $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaCreacion"]));
                        } else {
                            $fecha = date("d/m/Y  h:i:s A", strtotime($value["FechaModificacion"]));
                        }

                        $p = array(
                            "pedido" => $value["Pedido"],
                            "cliente" => $nombre,
                            "pago" => money_format("%.0n", $value["Cuota"]),
                            "estado" => $value["NomEstado"],
                            "fecha" => $fecha,
                            "usuario" => $value["UsuarioCreacion"],
                            "btn" => $btn
                        );
                        $arreglo["data"][$i] = $p;
                        $i++;
                    }
                }
            }
            echo json_encode($arreglo);
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage() . "<br>";
        }
    }

    public function reporteTotalValoresPorEstado() {
        try {
            $arreglo["data"] = [];
            $i = 0; 

            $estados = array(104, 105, 115, 124);
            $reporte = $this->Reportes_model->obtenerTotalValoresPorEstado($estados);

            if ($reporte != false) {
                foreach ($reporte as $value) { 
                    $p = array(
                        "Estado" => $value["Nombre"],
                        "Clientes" => $value["Num_Clientes"],
                        "Valor" => money_format("%.0n", $value["Total"])
                    );
                    $arreglo["data"][$i] = $p; 

                    $i++;
                }  
            }

            echo json_encode($arreglo);
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage() . "<br>";
        }
    }

    public function reporteTotalValores() {
        try {
            $arreglo = []; 

            $estados = array(104, 105, 115, 124);
            $reporte = $this->Reportes_model->obtenerTotalValores($estados);

            if ($reporte != false) { 
                echo money_format("%.0n", $reporte[0]["Total"]);
            } else {
                echo 'Error: No se encontraron datos.';
            }
        } catch (Exception $e) {
            echo 'Error: ' . $e->getMessage() . "<br>";
        }
    }
  
    public function ConteoPagosPost() {
        $fecha1 = trim($this->input->post('pag_fec1') . " 00:00:00");
        $fecha1 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha1);
        $fecha2 = trim($this->input->post('pag_fec2') . " 23:59:59");
        $fecha2 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha2);
        $Pagos = $this->ConteoPagos($fecha1, $fecha2);

        echo json_encode($Pagos);
    }

    public function ConteoPagos($fecha1, $fecha2) {
        $Pagos = array();
        $progH = $this->Reportes_model->AllPayProg();
        $Pagos["ProgH"] = $progH[0]["Num"];
        $todos = $this->Reportes_model->AllPay();
        $Pagos["Todos"] = $todos[0]["Num"];
        $DescH = $this->Reportes_model->AllPayProgDesc();
        $Pagos["DescH"] = $DescH[0]["Num"];
        $NoPagoH = $this->Reportes_model->AllPayProgNoPago();
        $Pagos["NoPagoH"] = $NoPagoH[0]["Num"];
        //Filtro
        $Confir = $this->Reportes_model->PayOk($fecha1, $fecha2);
        $Pagos["Confir"] = $Confir[0]["Num"];
        $PagPro = $this->Reportes_model->PayProg($fecha1, $fecha2);
        $Pagos["PagPro"] = $PagPro[0]["Num"];
        $Desc = $this->Reportes_model->PayProgDesc($fecha1, $fecha2);
        $Pagos["Desc"] = $Desc[0]["Num"];
        $NoPago = $this->Reportes_model->PayProgNoPago($fecha1, $fecha2);
        $Pagos["NoPago"] = $NoPago[0]["Num"];
        //Llamadas Pedidos
        $Llamadas = $this->Pedidos_model->contarPedidos($fecha1, $fecha2);
        $Pagos["Llamadas"] = $Llamadas[0]["Num"];

        return $Pagos;
    }

    public function ConteoClientesPost() {
        $fecha1 = trim($this->input->post('pag_fec1') . " 00:00:00"); 
        $fecha1 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha1);
        $fecha2 = trim($this->input->post('pag_fec2') . " 23:59:59"); 
        $fecha2 = preg_replace('#(\d{2})/(\d{2})/(\d{4})\s(.*)#', '$3-$2-$1 $4', $fecha2);
        $Clientes = $this->ConteoClientes($fecha1, $fecha2);

        $out = array_values($Clientes);
        echo json_encode($out);
    }

    public function ConteoClientes($fecha1, $fecha2) {
        $Clientes = array();
        $Registrados = $this->Clientes_model->AllClients();
        //$Nuevo = $this->Clientes_model->ClientsNew($fecha1, $fecha2);
        $Aldía = $this->Clientes_model->ClientsOk();
        $Deben = $this->Clientes_model->ClientsDeb();
        $Mora = $this->Clientes_model->ClientsMora();
        $DataCredito = $this->Clientes_model->ClientsData();
        $Paz = $this->Clientes_model->ClientsPeace();
        $Devoluciones = $this->Clientes_model->ClientsReturn(); 
        $Reportados = $this->Clientes_model->ClientsReports();        
        $Eliminados = $this->Clientes_model->ClientsDelete();
        
        $Clientes = array(
            0 => intval($Registrados[0]["Num"]),
            1 => intval($Aldía[0]["Num"]),
            2 => intval($Deben[0]["Num"]),
            3 => intval($Mora[0]["Num"]),
            4 => intval($DataCredito[0]["Num"]),
            5 => intval($Devoluciones[0]["Num"]),
            6 => intval($Paz[0]["Num"])
            // ,
            // 7 => intval($Reportados[0]["Num"]),
            // 8 => intval($Eliminados[0]["Num"])
        );
        
        return $Clientes;
    }

}

?>