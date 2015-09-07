//= require jquery
//= require jquery_ujs
//= require jquery.fancybox
//= require jquery.maskedinput-1.3
//= require jquery.easing
//= require jquery.social.share.1.3.min
//= require jquery.annotate
//= require jquery.flexslider
//= require spin
//= require jquery.spin
//= require bootstrap-modal
//= require bootstrap-transition
//= require bootstrap-carousel
//= require_tree ./common
//= require_tree ./application
//= require ckeditor/init
//= require ckeditor/config


// Internet explorer fix
$(function() {
	if (navigator.appName == 'Microsoft Internet Explorer' ||  !!(navigator.userAgent.match(/Trident/) || navigator.userAgent.match(/rv 11/)) || $.browser.msie == 1)
	{
		$('.modal').removeClass('fade');
	}
});

