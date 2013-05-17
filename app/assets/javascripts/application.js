// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require angular-ui
//= require_tree .

(function($) {
	$.fn.equalHeights = function(minHeight, maxHeight) {
		tallest = (minHeight) ? minHeight : 0;
		this.each(function() {
			if($(this).height() > tallest) {
				tallest = $(this).height();
			}
		});
		if((maxHeight) && tallest > maxHeight) tallest = maxHeight;
		return this.each(function() {
			$(this).height(tallest);
		});
	}
})(jQuery);

/*! waitForImages jQuery Plugin - v1.4.2 - 2013-01-19
* https://github.com/alexanderdickson/waitForImages
* Copyright (c) 2013 Alex Dickson; Licensed MIT */
(function(e){var t="waitForImages";e.waitForImages={hasImageProperties:["backgroundImage","listStyleImage","borderImage","borderCornerImage"]},e.expr[":"].uncached=function(t){if(!e(t).is('img[src!=""]'))return!1;var n=new Image;return n.src=t.src,!n.complete},e.fn.waitForImages=function(n,r,i){var s=0,o=0;e.isPlainObject(arguments[0])&&(i=arguments[0].waitForAll,r=arguments[0].each,n=arguments[0].finished),n=n||e.noop,r=r||e.noop,i=!!i;if(!e.isFunction(n)||!e.isFunction(r))throw new TypeError("An invalid callback was supplied.");return this.each(function(){var u=e(this),a=[],f=e.waitForImages.hasImageProperties||[],l=/url\(\s*(['"]?)(.*?)\1\s*\)/g;i?u.find("*").andSelf().each(function(){var t=e(this);t.is("img:uncached")&&a.push({src:t.attr("src"),element:t[0]}),e.each(f,function(e,n){var r=t.css(n),i;if(!r)return!0;while(i=l.exec(r))a.push({src:i[2],element:t[0]})})}):u.find("img:uncached").each(function(){a.push({src:this.src,element:this})}),s=a.length,o=0,s===0&&n.call(u[0]),e.each(a,function(i,a){var f=new Image;e(f).bind("load."+t+" error."+t,function(e){o++,r.call(a.element,o,s,e.type=="load");if(o==s)return n.call(u[0]),!1}),f.src=a.src})})}})(jQuery);

(function($) {
	
	$('.span4').waitForImages(function() {
    	$(".span4 > section").equalHeights()
	});

	$(window).resize(function(){
		$(".span4 > section").outerHeight('100%').equalHeights();
		$(".span4 > section").outerHeight('100%').equalHeights();
	})

})(jQuery);//= require angular.min
//= require angle-up
//= require_tree ./angular
