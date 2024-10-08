<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<style>
    .black{
        background-color: #525252 !important;
        color: white;
    }
    .green{
        background-color: #5cb85c !important;
        color: white;
    }
    .red{
        background-color: #f34a4a !important;
        color: white;
    }
    .orange{
        background-color: #ffc61d !important;
        color: white;
    }
</style>
<div class="content">
    <div class="header">        
        <?php //$this->load->view('Modules/notifications'); ?>
        <h1 class="page-title" style="font-size: 2em;"><?= $title; ?>  </h1>
    </div>            
    <div class="main-content">
        <div class="row">
            <?php if ($this->session->flashdata("error")): ?>
                <div class="col-md-12">
                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error</strong>
                        <br />
                        <?= $this->session->flashdata("error"); ?>
                    </div>
                </div>
            <?php endif; ?>                           
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="form-FiltrarNoLlamadas" name="form-FiltrarNoLlamadas" method="POST" >
                    <div class="col-md-3 col-md-offset-2">
                        <div class="form-group">
                            <label>Usuario</label>
                            <select id="dropUsuario" name="dropUsuario" class="form-control" >
                                <option value="*">Todos</option>
                                <?php
                                foreach ($ListaUsuarios as $value) {
                                    ?>
                                    <option value="<?= $value["Usuario"]; ?>"><?= $value["Nombre"]; ?></option>
                                    <?php
                                }
                                ?>

                            </select>
                        </div>
                    </div> 
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Fecha Inicial</label>
                            <input type="text" id="FechaIni" name="FechaIni" class="form-control datepicker1" required style="background-color: #ffffff;">
                        </div>
                    </div> 
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Fecha Final</label>
                            <input type="text" id="FechaFin" name="FechaFin" class="form-control datepicker1" required style="background-color: #ffffff;">
                        </div>
                    </div> 
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>Filtrar</label>
                            <div class="btn-toolbar list-toolbar">
                                <button id="btn-FiltrarNoLlamadas" name="btn-FiltrarNoLlamadas" class="btn btn-primary"><i class="fa fa-search"></i> Filtrar Fechas</button>                                            
                            </div>                                    
                        </div>
                    </div>                            
                </form>                        
            </div>
            <div class="col-md-12">
                <table id="<?= $Controller; ?>" class="table table-striped table-bordered" style="width:100%;">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Cuota</th>
                            <th>Saldo</th>
                            <th>Último Pago</th>
                            <th>Programado el</th>
                            <th>Ubicación Física</th>
                            <th>Motivo</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>                    
                </table>
            </div>                            
        </div>

        <div class="modal  fade" id="ModalCall" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="POST" name="form-modal" id="form-modal">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="myModalLabel">Confirmar Llamada</h3>
                        </div>
                        <div class="modal-body">  
                            <div class="row hidden">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Llamada</label>
                                        <input type="text" id="modal-llamada" name="modal-llamada" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Pedido</label>
                                        <input type="text" id="modal-pedido" name="modal-pedido" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Cliente</label>
                                        <input type="text" id="modal-cliente" name="modal-cliente" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" id="modal-nombre" name="modal-nombre" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">                                
                                        <label>Dirección:</label>
                                        <input type="text" value="" class="form-control" readonly id="modal-Direccion" name="modal-Direccion">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">                                
                                        <label>Teléfonos:</label>
                                        <input type="text" value="" class="form-control" readonly id="modal-Telefono" name="modal-Telefono">
                                    </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-md-12">
                                    <div class="form-group">                                
                                        <label>Indique el motivo de la llamada realizada:</label>
                                        <select name="motivo" id="motivo" class="form-control">
                                            <?php
                                            foreach ($Lista1 as $item):
                                                echo '<option value="' . $item['Codigo'] . '">' . $item['Nombre'] . '</option>';
                                            endforeach;
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden" id="divProLlamada">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Programar Llamada para:</label>
                                        <input type="text" value="" class="form-control datepicker8" id="FechaProgramada" name="FechaProgramada">
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden" id="divProPago">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Programar Pago para:</label>
                                        <input type="text" value="" class="form-control datepicker10" id="FechaPago" name="FechaPago">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Valor del Pago :</label>
                                        <input type="number" value="" class="form-control" id="valorPago" name="valorPago">
                                    </div>
                                </div>
                            </div>
                            <div class="row" >
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Observaciones</label>
                                        <textarea value="" rows="6" class="form-control" name="Observaciones" id="Observaciones" style="resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" id="message">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="margin-top: -15px;">
                            <button class="btn btn-default" id="btn-modal-cerrar" name="btn-modal-cerrar" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                            <button class="btn btn-primary" id="btn-modal" name="btn-modal"><i class="fa fa-save"></i> Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                var todayDate = new Date().getDate();
                $('.datepicker10').datetimepicker({
                    format: 'DD/MM/YYYY',
                    locale: 'es',
                    minDate: new Date(new Date().setDate(todayDate - 2)),
                    maxDate: new Date(new Date().setDate(todayDate + 10))
                });
                $('.datepicker8').datetimepicker({
                    format: 'DD/MM/YYYY',
                    locale: 'es',
                    minDate: new Date(new Date().setDate(todayDate)),
                    maxDate: new Date(new Date().setDate(todayDate + 30))
                });
                $('.datepicker1').datetimepicker({
                    format: 'DD/MM/YYYY',
                    locale: 'es',
                    minDate: new Date("09/01/2018"), //01 Septiembre 2018
                    maxDate: new Date(new Date().setDate(todayDate + 60))
                });

                $('#form-FiltrarNoLlamadas').submit(function (e) {
                    e.preventDefault();
                    filtrar();
                });

                $('#btn-FiltrarNoLlamadas').click(function (e) {
                    e.preventDefault();
                    filtrar();
                });

                listar();

                $('#form-modal').submit(function (e) {
                    e.preventDefault();
                    GuardarGestion();
                });

                $('#btn-modal').click(function (e) {
                    e.preventDefault();
                    GuardarGestion();
                });

                $('#motivo').on('change', function () {
                    $('#FechaProgramada').val("");
                    $('#FechaPago').val("");
                    $('#valorPago').val("");
                    $('#divProLlamada').addClass("hidden");
                    $('#divProPago').addClass("hidden");
                    if (this.value == 101) {
                        $('#divProLlamada').addClass("hidden");
                        $('#divProPago').removeClass("hidden");
                    } else if (this.value == 104) {
                        $('#divProLlamada').removeClass("hidden");
                        $('#divProPago').addClass("hidden");
                    } else {
                        $('#divProLlamada').addClass("hidden");
                        $('#divProPago').addClass("hidden");
                    }
                    $('#Observaciones').val("");
                });

                $('#valorPago').on('change', function () {
                    getObserPago();
                });

                $("#FechaPago").on("change", function () {
                    getObserPago();
                });
            });

            function getObserPago() {
                var valorPago = $('#valorPago').val();
                valorPago = valorPago.replace(".", "");
                valorPago = valorPago.replace(",", "");
                var fechaPago = $('#FechaPago').val();
                if (fechaPago != "") {
                    if (valorPago != "" || Number(valorPago) > 0) {
                        var mon = new Intl.NumberFormat().format(valorPago);
                        var ob = "Cliente indica que quiere pagar $" + mon + " el día " + fechaPago + ".";
                        $('#Observaciones').val(ob);
                    } else {
                        $('#Observaciones').val("");
                    }
                } else {
                    $('#Observaciones').val("");
                }
            }

            function listar() {
                $('#<?= $Controller; ?>').DataTable({
                    bDestroy: true,
                    responsive: true,
                    scrollX: true,
                    bSort: false,
                    columns: [
                        {data: "Nombre"},
                        {data: "cuota"},
                        {data: "saldo"},
                        {data: "UltimoPago"},
                        {data: "Fecha"},
                        {data: "Ubicacion"},
                        {data: "Motivo"},
                        {data: "btn"}
                    ],
                    ajax: {
                        method: 'post',
                        url: "<?= base_url(); ?>Cobradores/obtenerVolverLlamarJson/"
                    },
                    language: {
                        url: "<?= base_url('Public/assets/'); ?>/lib/Datetables.js/Spanish.json"
                    },
                    createdRow: function (row, data, dataIndex) {
                        if (data["Motivo"] == "Programar Pago") {
                            $('td', row).addClass('green');
                            $('i', row).addClass('green');
                        } else if (data["Motivo"] == "Cliente no Paga") {
                            $('td', row).addClass('red');
                            $('i', row).addClass('red');
                        } else if (data["Motivo"] == "Llamar más tarde") {
                            $('td', row).addClass('orange');
                            $('i', row).addClass('orange');
                        } else if (data["Motivo"] == "Llamar otro día") {
                            $('td', row).addClass('black');
                            $('i', row).addClass('black');
                        }
                    }
                });
            }

            function filtrar() {
                var pag_usu = $('#dropUsuario').val();
                var pag_fec1 = $('#FechaIni').val();
                var pag_fec2 = $('#FechaFin').val();
                
                $('#<?= $Controller; ?>').DataTable({
                    bDestroy: true,
                    responsive: true,
                    scrollX: true,
                    bSort: false,
                    columns: [
                        {data: "Nombre"},
                        {data: "cuota"},
                        {data: "saldo"},
                        {data: "UltimoPago"},
                        {data: "Fecha"},
                        {data: "Ubicacion"},
                        {data: "Motivo"},
                        {data: "btn"}
                    ],
                    ajax: {
                        method: 'post',
                        url: "<?= base_url(); ?>Cobradores/obtenerVolverLlamarJsonPost/",
                        data: {
                            pag_usu: pag_usu, pag_fec1: pag_fec1, pag_fec2: pag_fec2
                        }
                    },
                    language: {
                        url: "<?= base_url('Public/assets/'); ?>/lib/Datetables.js/Spanish.json"
                    },
                    createdRow: function (row, data, dataIndex) {
                        if (data["Motivo"] == "Programar Pago") {
                            $('td', row).addClass('green');
                            $('i', row).addClass('green');
                        } else if (data["Motivo"] == "Cliente no Paga") {
                            $('td', row).addClass('red');
                            $('i', row).addClass('red');
                        } else if (data["Motivo"] == "Llamar más tarde") {
                            $('td', row).addClass('orange');
                            $('i', row).addClass('orange');
                        } else if (data["Motivo"] == "Llamar otro día") {
                            $('td', row).addClass('black');
                            $('i', row).addClass('black');
                        }
                    }
                });
            }

            function DatosModal(llamada, pedido, cliente, nombre, direccion, telefono) {
                $('#message').html("");
                $('#modal-llamada').val(llamada);
                $('#modal-pedido').val(pedido);
                $('#modal-cliente').val(cliente);
                $('#modal-nombre').val(nombre);
                $('#modal-Direccion').val(direccion);
                $('#modal-Telefono').val(telefono);
                $('#motivo').val("");
                $('#FechaProgramada').val("");
                $('#FechaPago').val("");
                $('#valorPago').val("");
                $('#divProLlamada').addClass("hidden");
                $('#divProPago').addClass("hidden");
                $('#Observaciones').val("");
            }

            function GuardarGestion() {
                var llamada = $('#modal-llamada').val();
                var pedido = $('#modal-pedido').val();
                var cliente = $('#modal-cliente').val();
                var motivo = $('#motivo').val();
                var nombremotivo = $('#motivo option:selected').text();
                var fechaprogramada = $('#FechaProgramada').val();
                var fechaPago = $('#FechaPago').val();
                var valorPago = $('#valorPago').val();
                var observaciones = $('#Observaciones').val();

                if (pedido.toString().length <= 0) {
                    $('#message').html(
                            '<div class="alert alert-danger alert-dismissable fade in">\n\
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                <strong>Error</strong><br />No existe Pedido\n\
                            </div>');
                } else {
                    if (cliente.toString().length <= 0) {
                        $('#message').html(
                                '<div class="alert alert-danger alert-dismissable fade in">\n\
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                    <strong>Error</strong><br />No existe Cliente\n\
                                </div>');
                    } else {
                        if (motivo == "" || motivo == null) {
                            $('#message').html(
                                    '<div class="alert alert-danger alert-dismissable fade in">\n\
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                        <strong>Error</strong><br />Debe indicar un motivo de llamada\n\
                                    </div>');
                        } else {
                            if (observaciones == "") {
                                $('#message').html(
                                        '<div class="alert alert-danger alert-dismissable fade in">\n\
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                            <strong>Error</strong><br />Debe indicar una Observación\n\
                                        </div>');
                            } else {
                                $('#message').html("");
                                var method = "<?= base_url(); ?>Cobradores/AddReCall/";
                                $("body").css({
                                    'cursor': 'wait'
                                })
                                $.ajax({
                                    type: 'post',
                                    url: method,
                                    data: {
                                        llamada: llamada, pedido: pedido, cliente: cliente, motivo: motivo, nombremotivo: nombremotivo,
                                        fechaPago: fechaPago, valorPago: valorPago, fechaprogramada: fechaprogramada, observaciones: observaciones
                                    },
                                    cache: false,
                                    beforeSend: function () {
                                        $('#message').html("");
                                        $('#btn-modal').attr('disabled', 'disabled');
                                        $('#btn-modal').html('<i class="fa fa-save"></i> Guardando...');
                                    },
                                    success: function (data) {
                                        $('#btn-modal').html('<i class="fa fa-save"></i> Guardar');
                                        if (data == 1) {
                                            $('#message').html(
                                                    '<div class="alert alert-success alert-dismissable fade in">\n\
                                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                                        <strong>Se generó el reporte de la llamada. \nDireccionando...</strong>\n\
                                                    </div>');
                                            setTimeout(function () {
                                                $('#btn-modal-cerrar').click();
                                                window.location.reload();
                                            }, 1000);
                                        } else {
                                            $('#btn-modal').prop("disabled", false);
                                            $('#message').html(
                                                    '<div class="alert alert-danger alert-dismissable fade in">\n\
                                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>\n\
                                                        <strong>Error</strong><br />' + data + '\n\
                                                    </div>');
                                        }
                                    }

                                });
                                $("body").css({
                                    'cursor': 'Default'
                                })

                                return false;
                            }
                        }
                    }
                }
            }
        </script>

