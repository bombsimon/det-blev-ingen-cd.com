<?php
$title = "Det blev visst ingen cd-skiva!";
$body = "<b>Det blev ingen cd.</b> Några 15-åringar från Dommarhagsskolan tänkte kolla in cd-skivor under lunchrasten. Men affären de gick till hade stängt. Från vänster står Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson och Max Malmström.";

if(isset($_GET['lng'])) {
	switch($_GET['lng']) {
		case "en":
			$title = "Apparently they didn't get any cd.";
			$body = "<b>They didn't get any cd.</b> A few 15 year old boys from Dommarhagsskolan were going to check out CD's during the lunch break. But the store they went to was closed. Standing from the left; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson and Max Malmström.";
			break;
		case "ge":
			$title = "Anscheinend erhielten sie kein cd.";
			$body = "<b>Sie erhielten kein cd.</b> Einige 15 jahre alte jungen von Dommarhagsskolan waren im begriff, aus CD's während der mittagspause zu überprüfen. Aber der speicher gingen sie zu waren geschlossen. Stehen vom links; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson und Max Malmström.";
			break;
		case "fr":
			$title = "Apparemment ils n'ont obtenu aucun cd.";
			$body = "<b>Ils n'ont obtenu aucun cd.</b> Quelques 15 années de garçons de Dommarhagsskolan allaient vérifier CD's pendant la pause de midi. Mais le magasin elles sont allées à étaient fermées. Se tenir de la gauche ; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Max Malmström, Mattias Persson.";
			break;
		case "es":
			$title = "No consiguieron al parecer ningún cd.";
			$body = "<b>No consiguieron ningún cd.</b> Algunos 15 años de viejos muchachos de Dommarhagsskolan iban a comprobar fuera de CD's durante la hora de la almuerzo. Pero el almacén fueron a eran cerrados. El estar parado de la izquierda; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Max Malmström y Mattias Persson.";
			break;
	}
}

?>

<html>
<head>
	<title>
<?php
/*
			if($_GET['lng'] == "" || $_GET['lng'] == "sv"){
				echo "Det blev visst ingen cd-skiva.";
			} elseif($_GET['lng'] == "en"){
				echo "Apparently they didn't get any cd.";
			} elseif($_GET['lng'] == "ge"){
				echo "Anscheinend erhielten sie kein cd.";
			} elseif($_GET['lng'] == "fr"){
				echo "Apparemment ils n'ont obtenu aucun cd.";
			} elseif($_GET['lng'] == "es"){
				echo "No consiguieron al parecer ningún cd.";
			}
 */
		echo $title;
		?>
	</title>
	<link rel="stylesheet" type="text/css" href="default.css">

<script LANGUAGE="JavaScript">
<!--
var sw=screen.width
var r
var c
var cd
if (navigator.appName != "Netscape") {
cd=screen.colorDepth
} else {
cd=screen.pixelDepth
}
r=top.document.referrer;
c=document.location;
document.write ('<IMG SRC="http://stats.gate9.se/registerstat/index.php?acct=830&sw='+sw+'&cd='+cd+'&r='+r+'&c='+c+'" WIDTH="1" HEIGHT="1" NOCACHE>')
//-->
</script>


</head>
<body bgcolor="#cccccc">

<br>

<center>
<center><h1>Stort grattis till Mattias Persson som blivit pappa!</h1></center>
<img src="splash.jpg" style="border: 1px solid #000;" alt="*Sadface*" title="*Sadface*"><br>
<table border="0" width="423">
	<tr>
		<td>
			<a href="?lng=sv"><img src="sv.png" style="border: none;"></a>
			<a href="?lng=en"><img src="us.png" style="border: none;"></a>
			<a href="?lng=ge"><img src="ge.png" style="border: none;"></a>
			<a href="?lng=fr"><img src="fr.png" style="border: none;"></a>
			<a href="?lng=es"><img src="es.png" style="border: none;"></a>
		</td>
		<td align="right"><!--Hosted by <a href="mailto:spekter@det-blev-ingen-cd.com">Spekter</a> and <a href="mailto:sawert@det-blev-ingen-cd.com">Sawert</a>.--></td>
	</tr>
</table>

<br>
<table width="300">
	<tr>
		<td>
		<?php
		echo $body;
		/*
			if($_GET['lng'] == "" || $_GET['lng'] == "sv"){
			 echo "<b>Det blev ingen cd.</b> Några 15-åringar från Dommarhagsskolan tänkte kolla in cd-skivor under lunchrasten. Men affären de gick till hade stängt. Från vänster står Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson och Max Malmström.";
			} elseif($_GET['lng'] == "en"){
				echo "<b>They didn't get any cd.</b> A few 15 year old boys from Dommarhagsskolan were going to check out CD's during the lunch break. But the store they went to was closed. Standing from the left; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson and Max Malmström.";
			} elseif($_GET['lng'] == "ge"){
				echo "<b>Sie erhielten kein cd.</b> Einige 15 jahre alte jungen von Dommarhagsskolan waren im begriff, aus CD's während der mittagspause zu überprüfen. Aber der speicher gingen sie zu waren geschlossen. Stehen vom links; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson und Max Malmström.";
			} elseif($_GET['lng'] == "fr"){
				echo "<b>Ils n'ont obtenu aucun cd.</b> Quelques 15 années de garçons de Dommarhagsskolan allaient vérifier CD's pendant la pause de midi. Mais le magasin elles sont allées à étaient fermées. Se tenir de la gauche ; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Max Malmström, Mattias Persson.";
			} elseif($_GET['lng'] == "es"){
				echo "<b>No consiguieron ningún cd.</b> Algunos 15 años de viejos muchachos de Dommarhagsskolan iban a comprobar fuera de CD's durante la hora de la almuerzo. Pero el almacén fueron a eran cerrados. El estar parado de la izquierda; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Max Malmström y Mattias Persson.";
			}
		*/
		?>
		</td>
	</tr>
</table>
<br>
<br>
<br>
</center>

</body>
</html>
