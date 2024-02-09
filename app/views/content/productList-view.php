
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
	<h1 class="title">Productos</h1>
	<h2 class="subtitle"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de productos</h2>
</div>
<div class="container pb-6 pt-6">

	<table class="tbl w-100 tbl-striped" id="tblListaProductos">
		<thead>
			<tr>
				<th>Img</th>
				<th>Nombre</th>
				<th>Referencia</th>
				<th>Talla</th>
				<th>Precio</th>
				<th>Cantidad</th>
				<th>Categoria</th>
				<?php   if ($_SESSION['usuario']=='Administrador') { ?>
					<th>Acción</th>
				<?php 	} ?>
			</tr>
		</thead>
		<tbody id="tblProductos">
			<?php
				$conexion=mysqli_connect("localhost","root","","ventas") or die("Problemas con la conexion");
				// $conexion=mysqli_connect("localhost","u801406368_rootTenis","Tenis.2901","u801406368_ventaspl") or die("Problemas con la conexion");
				
				$campos="producto.producto_id,producto.producto_codigo,producto.producto_nombre,producto.producto_talla,producto_stock_total,producto.producto_precio_venta,producto.producto_foto,categoria.categoria_nombre";
			
				$seleccionarProductos = mysqli_query($conexion,"SELECT $campos FROM producto INNER JOIN categoria ON producto.categoria_id=categoria.categoria_id ORDER BY producto_nombre ASC");
				
				$tabla = '';

				while ($producto = mysqli_fetch_array($seleccionarProductos)) {
					$tabla .= '<tr>';
			
					$tabla.='
					<td>
						<figure class="media-left">
							<p class="image is-64x64">';
								if(is_file("./app/views/productos/".$producto['producto_foto'])){
									$tabla.='<img src="'.APP_URL.'app/views/productos/'.$producto['producto_foto'].'">';
								}else{
									$tabla.='<img src="'.APP_URL.'app/views/productos/default.png">';
								}
					$tabla.='</p>
						</figure>
					</td>
						<td><p>'.$producto['producto_nombre'].'</p></td>
						<td><p> '.$producto['producto_codigo'].'</p></td> 
						<td><p> '.$producto['producto_talla'].'</p></td> 
						<td><p> '.MONEDA_SIMBOLO.number_format($producto['producto_precio_venta'],MONEDA_DECIMALES,MONEDA_SEPARADOR_DECIMAL,MONEDA_SEPARADOR_MILLAR)." ".MONEDA_NOMBRE.'</p></td>
						<td><p> '.$producto['producto_stock_total'].'</p></td>
						<td><p> '.$producto['categoria_nombre'].'</p></td>
					';	
					if ($_SESSION['usuario']=='Administrador') {
						$tabla.='
							<td>
								<div class="has-text-right">
									<button type="button" class="button is-link is-outlined is-rounded is-small btn-sale-options" onclick="print_ticket(\''.APP_URL.'app/pdf/etiqueta.php?code='.$producto['producto_id'].'\')" title="Imprimir etiqueta de. '.$producto['producto_nombre'].'" >
										<i class="fas fa-tags fa-fw"></i>
									</button>

									<a href="'.APP_URL.'productPhoto/'.$producto['producto_id'].'/" class="button is-info is-rounded is-small">
										<i class="far fa-image fa-fw"></i>
									</a>

									<a href="'.APP_URL.'productUpdate/'.$producto['producto_id'].'/" class="button is-success is-rounded is-small">
										<i class="fas fa-sync fa-fw"></i>
									</a>

									<form class="FormularioAjax is-inline-block" action="'.APP_URL.'app/ajax/productoAjax.php" method="POST" autocomplete="off" >

										<input type="hidden" name="modulo_producto" value="eliminar">
										<input type="hidden" name="producto_id" value="'.$producto['producto_id'].'">

										<button type="submit" class="button is-danger is-rounded is-small">
											<i class="far fa-trash-alt fa-fw"></i>
										</button>
									</form>
								</div>
							</td>
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
		$('#tblListaProductos').DataTable({
			"language": {
				"url": "../app/views/content/extensions/datatables/Spanish.json"
			},
			responsive: "true",
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