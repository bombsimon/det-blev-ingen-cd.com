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
		Response.Write "<font color=""red""><b>Seriöst? Vad har du här att göra? Ska du hacka sidan så snälla, brutforcea eller något vettigt istället?</b></font>"
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
			Detta är en liten login för att modifiera sidan om man så känner för det. Denna skall inte vara känd för allmänheten, men om du nu är någon tönt som fått tag på denna sida så är det lika bra att du suddar /pw.asp och besöker <a href="http://det-blev-ingen-cd.com">rootmappen</a> istället.
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

<b><font size="3">Nuvarande lösenord</font></b>
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