
<?php
$file = fopen("http://e-consulta.sunat.gob.pe/cl-at-ittipcam/tcS01Alias","r");

$n=0;
while(!feof($file))  //captura de encabezados
{
	$fila = fgets($file);  //captura de linea
	$sent[$n] = $fila;
	//echo $n." ".$sent[$n]."<br>";
	$n++;
}
fclose($file);

$m = 95;$f=0;
echo "".$sent[56]."<br>";?>
<table id ="tabla">
	<thead>
		
		<tr>
			<th>Dia</th>
			<th>Compra</th>
			<th>Venta</th>
		</tr>
	</thead>
	<?php
	while($sent[$m] < 32 & $sent[$m+8]>0)
	{
		?>
		<tr>
			<td><?php echo $sent[$m]; ?></td>
			<td><?php echo $sent[$m+4]; ?></td>
			<td><?php echo $sent[$m+8]; ?></td>
		</tr>
		<?php
		if($f==3)
		{
			$m=$m+4;
		}
		$m=$m+14;
		$f++;
	}
	?>
</table>
