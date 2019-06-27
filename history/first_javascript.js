$(window).load(function() {
	$("a").click(function(){
		
		var _page = $(this).attr('id');
		var _current = document.location.toString();
		
		if (_current.match('#')) _current = _current.split('#')[1];
		else _current = 'sv';
		
		if(_page != _current) {
			switchContent(_page);
		}
	});
	
	var _page = document.location.toString();
	if (_page.match('#')) _page = _page.split('#')[1];
	else _page = 'sv';

	switchContent(_page);
});

function switchContent(lang) {
	var sv = "<b>Det blev ingen cd.</b> Några 15-åringar från Dommarhagsskolan tänkte kolla in cd-skivor under lunchrasten. Men affären de gick till hade stängt. Från vänster står Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson och Max Malmström.";
	var dk = "<b>Der blev ingen cd.</b> Nogle 15-årige drenge fra Dommarhagsskolen tænkte at se på nogle cd'er i frokostpausen. Men butikken de gik til var lukket. Fra venstre står Alfredo Pettersson, Richard Knöos, Tommy Carlberg, Mattias Persson og Max Malmström.";
	var us = "<b>They didn't get any cd.</b> A few 15 year old boys from Dommarhagsskolan were going to check out CD's during the lunch break. But the store they went to was closed. Standing from the left; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson and Max Malmström."
	var de = "<b>Sie erhielten kein cd.</b> Einige 15 jahre alte jungen von Dommarhagsskolan waren im begriff, aus CD's während der mittagspause zu überprüfen. Aber der speicher gingen sie zu waren geschlossen. Stehen vom links; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson und Max Malmström.";
	var fr = "<b>Ils n'ont obtenu aucun cd.</b> Quelques 15 années de garçons de Dommarhagsskolan allaient vérifier CD's pendant la pause de midi. Mais le magasin elles sont allées à étaient fermées. Se tenir de la gauche ; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson, Max Malmström.";
	var es = "<b>No consiguieron ningún cd.</b> Algunos 15 años de viejos muchachos de Dommarhagsskolan iban a comprobar fuera de CD's durante la hora de la almuerzo. Pero el almacén fueron a eran cerrados. El estar parado de la izquierda; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson y Max Malmström.";

	var txt = sv;
	if(lang == "us") txt = us;
	else if (lang == "dk") txt = dk;
	else if (lang == "de") txt = de;
	else if (lang == "fr") txt = fr;
	else if (lang == "es") txt = es;

  //var curPos = $('body').scrollTop()
	window.location.hash = lang;
	$("p").html(txt);
	$('html,body').scrollTop(curPos)           
}
