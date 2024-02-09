

<!-- data tables -->
<link id="theme-style" rel="stylesheet" href="../app/views/content/extensions/portal.css">
<script src="../app/views/content/extensions/js/jquery.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/JSZip-2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/pdfmake-0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/pdfmake-0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/DataTables-1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/DataTables-1.10.24/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/Buttons-1.7.0/js/buttons.bootstrap4.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/Buttons-1.7.0/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="../app/views/content/extensions/datatables/Buttons-1.7.0/js/buttons.print.min.js"></script>

<div class="container is-fluid mb-6">
	<h1 class="title">Ventas</h1>
	<h2 class="subtitle"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de productos</h2>
</div>
<div class="container pb-6 pt-6">

	<table class="tbl w-100 tbl-striped" id="tblListaVentas">
		<thead>
			<tr>
				<th>NRO.</th>
				<th>Codigo</th>
				<th>Fecha</th>
				<th>Cliente</th>
				<th>Vendedor</th>
				<th>Total</th>
				<th>Forma de pago</th>
				<?php   if ($_SESSION['usuario']=='Administrador') { ?>
					<th>Acción</th>
				<?php 	} ?>
			</tr>
		</thead>
		<tbody id="tblVentas">
			<?php
				$conexion=mysqli_connect("localhost","root","","ventas") or die("Problemas con la conexion");
				// $conexion=mysqli_connect("localhost","u801406368_rootTenis","Tenis.2901","u801406368_ventaspl") or die("Problemas con la conexion");
				
				$campos_tablas="venta.venta_id,venta.venta_codigo,venta.venta_fecha,venta.venta_hora,venta.venta_total,venta.forma_pago,venta.usuario_id,venta.cliente_id,venta.caja_id,usuario.usuario_id,usuario.usuario_nombre,usuario.usuario_apellido,cliente.cliente_id,cliente.cliente_nombre,cliente.cliente_apellido";

				$seleccionarVentas = mysqli_query($conexion,"SELECT $campos_tablas FROM venta INNER JOIN cliente ON venta.cliente_id=cliente.cliente_id INNER JOIN usuario ON venta.usuario_id=usuario.usuario_id ORDER BY venta.venta_id DESC");
				
				$tabla = '';

				while ($rows = mysqli_fetch_array($seleccionarVentas)) {
					$tabla .= '<tr>';
			
					$tabla.='
							<td><p>'.$rows['venta_id'].'<p></td>
							<td><p>'.$rows['venta_codigo'].'<p></td>
							<td><p>'.date("d-m-Y", strtotime($rows['venta_fecha'])).' '.$rows['venta_hora'].'<p></td>
							<td><p>'.$rows['cliente_nombre'].' '.$rows['cliente_apellido'].'<p></td>
							<td><p>'.$rows['usuario_nombre'].' '.$rows['usuario_apellido'].'<p></td>
							<td><p>'.MONEDA_SIMBOLO.number_format($rows['venta_total'],MONEDA_DECIMALES,MONEDA_SEPARADOR_DECIMAL,MONEDA_SEPARADOR_MILLAR).' '.MONEDA_NOMBRE.'<p></td>
							<td><p>'.$rows['forma_pago'].'<p></td>
			                
					';	
					if ($_SESSION['usuario']=='Administrador') {
						$tabla.='
						<td><p>
							
							<button type="button" class="button is-link is-outlined is-rounded is-small btn-sale-options" onclick="print_ticket(\''.APP_URL.'app/pdf/ticket.php?code='.$rows['venta_codigo'].'\')" title="Imprimir ticket Nro. '.$rows['venta_id'].'" >
								<i class="fas fa-receipt fa-fw"></i>
							</button>

							<a href="'.APP_URL.'saleDetail/'.$rows['venta_codigo'].'/" class="button is-link is-rounded is-small" title="Informacion de venta Nro. '.$rows['venta_id'].'" >
								<i class="fas fa-shopping-bag fa-fw"></i>
							</a>

							<form class="FormularioAjax is-inline-block" action="'.APP_URL.'app/ajax/ventaAjax.php" method="POST" autocomplete="off" >

								<input type="hidden" name="modulo_venta" value="eliminar_venta">
								<input type="hidden" name="venta_id" value="'.$rows['venta_id'].'">

								<button type="submit" class="button is-danger is-rounded is-small" title="Eliminar venta Nro. '.$rows['venta_id'].'" >
									<i class="far fa-trash-alt fa-fw"></i>
								</button>
							</form>

						<p></td>
						';
					}
					$tabla .= '</tr>';
				}
				

				echo $tabla;
			?>
		</tbody>
	</table>
	<?php  	include "./app/views/inc/print_invoice_script.php";	?>
</div>

<script>
	tblInit();
	function tblInit() {
		$('#tblListaVentas').DataTable({
			"language": {
				"url": "../app/views/content/extensions/datatables/Spanish.json"
			},
			responsive: "true",
			"order": [ 0, 'desc' ],
			scrollCollapse: true,
			scrollX: true,
			dom: 'fBrtipl',
			buttons: [
				{
					extend:     'excelHtml5',
					text:       '<i class="fas fa-file-excel"></i>',
					titleattr:  'Exportar a Excel',
					className:  'button is-success is-rounded'
				}
			]
		});
	}
	
</script>