// JavaScript Document
var navHidden = false;

function showNav()
{
	if(navHidden){
		$("#nav-footer .footdiv, #nav-footer .divbottom").show();
		//$("#nav-footer").animate({"height": "auto"}, 500, function() {
			$('#nav-footer .title a').html('收起导航');
			$('#nav-footer .title a').removeClass('up');
			$('#nav-footer .title a').addClass('down');
			navHidden = false;
		//});
	}
}
function hideNav(){
	if(!navHidden){
		$("#nav-footer .footdiv, #nav-footer .divbottom").hide();
		//$("#nav-footer").animate({"height": "46px"}, 500, function() {
			$('#nav-footer .title a').html('展开导航');
			$('#nav-footer .title a').removeClass('down');
			$('#nav-footer .title a').addClass('up');
			navHidden = true;
		//});
	}
}



function jq_switch($target,now){
	$target.find('.divs').find('.subdiv').hide();
	$target.find('.divs').find('.subdiv').eq(now).show();
	$target.find('.selector').find('a').eq(now).addClass('now');
	$target.find('.selector').find('a').mouseover(function(){
		var num = parseInt($(this).attr('name')) - 1;
		$(this).parent().find('a').removeClass('now');
		$(this).addClass('now');
		$target.find('.divs').find('.subdiv').hide();
		$target.find('.divs').find('.subdiv').eq(num).show();
	});
}

//for drop menu
var timeout         = 300;

var closetimer		= 0;

var ddmenuitem      = 0;

function jsddm_open()
{
	jsddm_canceltimer();

	jsddm_close();

	ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
	if ($(this).find('ul').length > 0) {
		$(this).css('border-bottom', '1px solid #790001');
	}
}


function jsddm_close()
{
	if(ddmenuitem) {
		$("#nav li").css('border-bottom', '1px solid white');
		ddmenuitem.css('visibility', 'hidden');
	}
}


function jsddm_timer()
{
	closetimer = window.setTimeout(jsddm_close, timeout);
}



function jsddm_canceltimer()
{
	if(closetimer)

	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

//document.onclick = jsddm_close;

//for border
var b = '<!-- borders for decoration --><div class="left-border border png_bg"></div><div class="right-border border png_bg"></div><div class="hard_corner_left_top corner png_bg"></div><div class="hard_corner_right_top corner png_bg"></div><div class="hard_corner_left_bottom corner png_bg"></div><div class="hard_corner_right_bottom corner png_bg"></div><div class="topper png_bg"></div><div class="bottom png_bg"></div><!-- borders end -->';


var newsTimer = 0;
var startTimer = 0;
function startMarquee() {
	if ((newsTimer == null) || (newsTimer == 0)) {
		newsTimer = setInterval(marqueeNews, 100);
	}
}
function pauseMarquee(timeval) {
	clearInterval(newsTimer);
	newsTimer =  0;
	startTimer = setTimeout(startMarquee, timeval);
}
function marqueeNews() {
	var ul1_top = parseInt($("#news-items .subdiv .ul1").css("top"))-10;
	var ul2_top = parseInt($("#news-items .subdiv .ul2").css("top"))-10;
	$("#news-items .subdiv .ul1").css("top", ul1_top);
	$("#news-items .subdiv .ul2").css("top", ul2_top);
	if (ul1_top < -136) {
		$("#news-items .subdiv .ul1").css("top", 135);
		pauseMarquee(15000);
	}
	if (ul2_top < -136) {
		$("#news-items .subdiv .ul2").css("top", 135);
		pauseMarquee(15000);
	}
}
function stopMarquee() {
	clearInterval(startTimer);
	clearInterval(newsTimer);
	newsTimer = 0;
}

$(document).ready(function(){
	$('#jsddm > li').bind('mouseover', jsddm_open);
	$('#jsddm > li').bind('mouseout',  jsddm_timer);

	var news = $('#news');
	var nav_footer =  $('#nav-footer');
	var now = 0;
	jq_switch(news,now);
	jq_switch(nav_footer,now);

	navHidden = false;
	//setTimeout(hideNav,5000);
	$('#nav-footer .divtitle .title a').bind("click", function() {
		if (navHidden) {
			showNav();
		} else {
			hideNav();
		}
	});

	$('.jsborder').each(function(i){
		var ie6 = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
		$(this).prepend(b);
		$(this).find('.border').height($(this).outerHeight()-7);
		$(this).find('.topper').width($(this).outerWidth()-8);
		$(this).find('.bottom').width($(this).outerWidth()-8);
	});
});

