<html>
<head>
	<title>Det blev visst ingen CD-skiva.</title>
	<link rel="stylesheet" type="text/css" href="default.css">
</head>

<%
'Response.Flush

If Request.Querystring("do") = "check" Then

	If Request.Form("user") = "utancd" AND Request.Form("pwd") = "limpmacka" Then
		Session("admin") = "true"
		Session.Timeout = 10
		Response.Redirect "pw.asp"
	Else
		Response.Write "<font color=""red""><b>Seri�st? Vad har du h�r att g�ra? Ska du hacka sidan s� sn�lla, brutforcea eller n�got vettigt ist�llet?</b></font>"
	End If
End If

If Request.Querystring("do") = "logout" Then
	Session.Abandon
	Response.Redirect "pw.asp"
End If
%>


<body bgcolor="#cccccc">

<% If Session("admin") <> "true" Then %>

<form name="form1" method="post" action="pw.asp?do=check">
	<table width="300">
		<tr>
			<td colspan="2">
			Detta �r en liten login f�r att modifiera sidan om man s� k�nner f�r det. Denna skall inte vara k�nd f�r allm�nheten, men om du nu �r n�gon t�nt som f�tt tag p� denna sida s� �r det lika bra att du suddar /pw.asp och bes�ker <a href="http://det-blev-ingen-cd.com">rootmappen</a> ist�llet.
			<br>
			<hr color="#0000000" size="1">
			</td>
		</tr>
		<tr>
			<td><b>User</b></td>
			<td><input type="text" name="user" class="gb_input"></td>
		</tr>
		<tr>
			<td><b>Password</b></td>
			<td><input type="password" name="pwd" class="gb_input"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="sub" class="gb_input" value=" Logga in "></td>
		</tr>
	</table>
</form>

<% ElseIf Session("admin") = "true" Then %>

<b><font size="3">Nuvarande l�senord</font></b>
<hr color="#000000" size="1" width="165" align="left">

<table width="200">
	<tr>
		<td colspan="2"><b><a href="http://kontrollpanel.gate9.se" target="_blank">Gate9 - Kontrollpanelen</a></b></td>
	</tr>
		<td>7288</td>
		<td>f02734</td>
	</tr>
	<tr>
		<td colspan="2"><a href="http://stats.gate9.se" target="_blank">Gate9 - Statistik</a></td>
	</tr>
	<tr>
		<td>7288</td>
		<td>z399g7tj</td>
	</tr>
</table>

<br><br>
<a href="pw.asp?do=logout">Logga ut</a>

<% End If %>

</body>
</html>