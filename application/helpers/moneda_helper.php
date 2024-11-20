<?php

defined('BASEPATH') or exit('No direct script access allowed');

function money_format_cop($valor)
{
	// Crear el formateador de moneda para pesos colombianos (COP)
	$formatter = new NumberFormatter('es_CO', NumberFormatter::CURRENCY);

	// Formatear el valor como pesos colombianos
	$formattedMoney = $formatter->formatCurrency($valor, 'COP');

	// Eliminar los decimales y cualquier coma
	$formattedMoney = preg_replace('/,00$/', '', $formattedMoney); // Elimina ,00 si está presente
	// $formattedMoney = preg_replace('/\.\d+$/', '', $formattedMoney); // Elimina cualquier decimal

	return $formattedMoney;
}
