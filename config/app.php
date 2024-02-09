<?php

	// const APP_URL="https://facturacionpl.bltiendas.com/";
	const APP_URL="http://localhost/facturacion_tienda/";
	const APP_NAME="FACTURACION PRO LAPS";
	const APP_SESSION_NAME="POSST";

	/*----------  Tipos de documentos  ----------*/
	const DOCUMENTOS_USUARIOS=["CC","NIT","CE","Otro"];
	
	/*----------  Tipos de clientes  ----------*/
	const TIPO_CLIENTE=["Comun","Mayorista"];

	/*----------  Tipos de clientes  ----------*/
	const FORMA_PAGO=["Efectivo","Transferencia"];

	/*----------  Tipos de unidades de productos  ----------*/
	const PRODUCTO_UNIDAD=["Unidad","Par","Otro"];

	/*----------  Configuración de moneda  ----------*/
	const MONEDA_SIMBOLO="$";
	const MONEDA_NOMBRE="COP";
	const MONEDA_DECIMALES="0";
	const MONEDA_SEPARADOR_MILLAR=".";
	const MONEDA_SEPARADOR_DECIMAL=",";


	/*----------  Marcador de campos obligatorios (Font Awesome) ----------*/
	const CAMPO_OBLIGATORIO='&nbsp; <i class="fas fa-edit "></i> &nbsp;';

	/*----------  Zona horaria  ----------*/
	date_default_timezone_set("America/Bogota");

	/*
		Configuración de zona horaria de tu país, para más información visita
		http://php.net/manual/es/function.date-default-timezone-set.php
		http://php.net/manual/es/timezones.php
	*/