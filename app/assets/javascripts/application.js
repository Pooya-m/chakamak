// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
//= require typeahead

/*function to_persian(s)
{
  var number = s.replace(/\s+/g, '').split('');
  for(var i = 0; i < number.length ; i++)
  {
    switch(number[i])
    {
      case "0":
        number[i] = "۰";
        break;
      case "1":
        number[i] = "۱";
        break;
      case "2":
        number[i] = "۲";
        break;
      case "3":
        number[i] = "۳";
        break;
      case "4":
        number[i] = "۴";
        break;
      case "5":
        number[i] = "۵";
        break;
      case "6":
        number[i] = "۶";
        break;
      case "7":
        number[i] = "۷";
        break;
      case "8":
        number[i] = "۸";
        break;
      case "9":
        number[i] = "۹";
        break;
    } 
  }
  return number.join('');
}

document.getElementsByClassName("page current")[0].textContent = to_persian(document.getElementsByClassName("page current")[0].textContent);

a = document.getElementsByClassName("page");

for(var i = 0; i < a.length ; i++)
{
  if(a[i].firstElementChild)
   a[i].firstElementChild.text = to_persian(a[i].firstElementChild.text);
} */

$(document).ready(function($) {
$('.typeahead').typeahead({
    prefetch: '/poets.json',
    cache: false
});

});

