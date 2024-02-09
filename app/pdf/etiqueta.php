<?php

	$code=(isset($_GET['code'])) ? $_GET['code'] : 0;

	/*---------- Incluyendo configuraciones ----------*/
    require_once "../../config/app.php";
    require_once "../../autoload.php";


	$conexion=mysqli_connect("localhost","root","","ventas") or die("Problemas con la conexion");
				// $conexion=mysqli_connect("localhost","u801406368_rootTenis","Tenis.2901","u801406368_ventaspl") or die("Problemas con la conexion");

    $seleccionarProductos = mysqli_query($conexion,"SELECT * FROM producto WHERE producto_id = $code");

    $row = mysqli_num_rows($seleccionarProductos);
				
	if($row==1){
        $seleccionarProducto = mysqli_query($conexion,"SELECT * FROM producto WHERE producto_id = $code");
        
		/*---------- Datos del producto ----------*/
        $datos_producto = mysqli_fetch_array($seleccionarProducto);

		require "./code128.php";

		$pdf = new PDF_Code128('P','mm',array(80,80));
		$pdf->AliasNbPages();
		$pdf->SetMargins(1,2,1);
        $pdf->AddPage();
        
        $pdf->SetTextColor(0,0,0);
        
        $pdf->Code128(5,$pdf->GetY(),$datos_producto['producto_codigo'],70,20);
        $pdf->SetXY(0,$pdf->GetY()+21);
        $pdf->SetFont('Arial','',14);
        $pdf->MultiCell(0,5,iconv("UTF-8", "ISO-8859-1",$datos_producto['producto_codigo']),0,'C',false);
        $pdf->MultiCell(0,5,iconv("UTF-8", "ISO-8859-1",$datos_producto['producto_nombre']),0,'C',false);
        $pdf->MultiCell(0,5,iconv("UTF-8", "ISO-8859-1",'Talla '.$datos_producto['producto_talla']),0,'C',false);

        $pdf->Ln(9);
		$pdf->Output("I","Etiquta_Producto_".$datos_producto['producto_nombre'].".pdf",true,true);

	}else{
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title><?php echo APP_NAME; ?></title>
	<?php include '../views/inc/head.php'; ?>
</head>
<body>
    <div class="main-container">
        <section class="hero-body">
            <div class="hero-body">
                <p class="has-text-centered has-text-white pb-3">
                    <i class="fas fa-rocket fa-5x"></i>
                </p>
                <p class="title has-text-white">¡Ocurrió un error!</p>
                <p class="subtitle has-text-white">No hemos encontrado datos del producto</p>
            </div>
        </section>
    </div>
	<?php include '../views/inc/script.php'; ?>
</body>
</html>
<?php } ?>