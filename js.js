$(function() {
  $('body').on('click', 'a', function(){
    var language = $(this).attr('id');
    var currentLang = langFromUrl();

    if (language != currentLang) {
      switchLanguage(language);
    }
  });

  loadFlags();
  switchLanguage(langFromUrl());
});

var languageMap = {
  "se": {
    "lead": "Det blev ingen cd.",
    "full": "Några 15-åringar från Dommarhagsskolan tänkte kolla in cd-skivor under lunchrasten. Men affären de gick till hade stängt. Från vänster står Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson och Max Malmström."
  },
  "dk": {
    "lead": "Der blev ingen cd.",
    "full": "Nogle 15-årige drenge fra Dommarhagsskolen tænkte at se på nogle cd'er i frokostpausen. Men butikken de gik til var lukket. Fra venstre står Alfredo Pettersson, Richard Knöos, Tommy Carlberg, Mattias Persson og Max Malmström."
  },
  "us": {
    "lead": "They didn't get any cd.",
    "full": "A few 15 year old boys from Dommarhagsskolan were going to check out CD's during the lunch break. But the store they went to was closed. Standing from the left; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson and Max Malmström."
  },
  "de": {
    "lead": "Sie erhielten kein cd.",
    "full": "Einige 15 jahre alte jungen von Dommarhagsskolan waren im begriff, aus CD's während der mittagspause zu überprüfen. Aber der speicher gingen sie zu waren geschlossen. Stehen vom links; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson und Max Malmström."
  },
  "fr": {
    "lead": "Ils n'ont obtenu aucun cd.",
    "full": "Quelques 15 années de garçons de Dommarhagsskolan allaient vérifier CD's pendant la pause de midi. Mais le magasin elles sont allées à étaient fermées. Se tenir de la gauche ; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson, Max Malmström."
  },
  "es": {
    "lead": "No consiguieron ningún cd.",
    "full": "Algunos 15 años de viejos muchachos de Dommarhagsskolan iban a comprobar fuera de CD's durante la hora de la almuerzo. Pero el almacén fueron a eran cerrados. El estar parado de la izquierda; Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson y Max Malmström."
  }
};

function loadFlags() {
  for (language in languageMap) {
    $('#flags').append(
      '<a id="' + language + '"><img src="flags/' + language + '.png"></a>'
    );
  }
}

function langFromUrl() {
  var defaultLang = 'se';
  var lang = document.location.toString();

  if (lang.match('#')) {
    lang = lang.split('#')[1];
  }
  else {
    lang = defaultLang;
  }

  return lang;
}

function switchLanguage(lang) {
  window.location.hash = lang;

  var text = languageMap[lang]; 
  $('#lead').text(text.lead);
  $('#full').text(text.full);
  $('#splash').prop('alt', text.lead);
}

// vim: set ts=2 sw=2 et:
