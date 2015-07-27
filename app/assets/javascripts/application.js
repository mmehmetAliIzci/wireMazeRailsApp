// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require tinymce
//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
//= require bootstrap
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.de.js


$(document).on("page:load ready", 
	function(){

	    $("input.datepicker").datepicker({
	    	format: "yyyy-mm-dd",
	    	autoclose: true,
	    	todayHighlight: true
	    });

	    $(".result_list").on("click", ".pagination a" , function(){
	    	$.get(this.href,null,null,"script");
	    	return false;
	    });

	}

);

