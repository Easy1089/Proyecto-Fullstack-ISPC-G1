(function(a){var s={Android:function(){return navigator.userAgent.match(/Android/i)},BlackBerry:function(){return navigator.userAgent.match(/BlackBerry/i)},iOS:function(){return navigator.userAgent.match(/iPhone|iPad|iPod/i)},Opera:function(){return navigator.userAgent.match(/Opera Mini/i)},Windows:function(){return navigator.userAgent.match(/IEMobile/i)},any:function(){return(s.Android()||s.BlackBerry()||s.iOS()||s.Opera()||s.Windows())}};var r=function(){a('[data-inviewport="yes"]').waypoint(function(){a(this).trigger("on-appear")},{offset:"90%",triggerOnce:true});a(window).on("load",function(){setTimeout(function(){a.waypoints("refresh")},100)})};var d=function(){if(a().countTo){a(".counter").on("on-appear",function(){a(this).find(".numb-count").each(function(){var A=a(this).data("to"),z=a(this).data("speed");a(this).countTo({to:A,speed:z})})})}};var j=function(){if(a().owlCarousel){a(".flat-carousel-box").each(function(){var z=a(this),A=z.data("auto"),D=z.data("column"),E=z.data("column2"),F=z.data("column3"),C=Number(z.data("gap")),B=z.data("dots"),G=z.data("nav");z.find(".owl-carousel").owlCarousel({margin:C,loop:true,dots:B,nav:true,navigation:true,pagination:true,autoplay:A,autoplayTimeout:5000,responsive:{0:{items:F},765:{items:E},1000:{items:D}}})})}};var h=function(){if(a().isotope){var z=a(".isotope-product");z.imagesLoaded(function(){z.isotope({itemSelector:".product-item",transitionDuration:"1s",layoutMode:"fitRows"})});a(".flat-filter li").on("click",function(){var A=a(this).find("a").attr("data-filter");a(".flat-filter li").removeClass("active");a(this).addClass("active");z.isotope({filter:A});return false})}};var i=function(){if(a().isotope){var z=a(".isotope-post");z.imagesLoaded(function(){z.isotope({itemSelector:".post-wrap",transitionDuration:"1s",layoutMode:"fitRows"})});a(".flat-filter li").on("click",function(){var A=a(this).find("a").attr("data-filter");a(".flat-filter li").removeClass("active");a(this).addClass("active");z.isotope({filter:A});return false})}};var m=function(){if(a().gmap3){var z=JSON.parse('[{"address":"Westwell Leacon, Ashford, Vương Quốc Anh","content":""}]');a(".flat-map").gmap3({map:{options:{zoom:10,center:[51.1946026,0.8140602,14.5],mapTypeId:"Wizym",mapTypeControlOptions:{mapTypeIds:["Wizym",google.maps.MapTypeId.SATELLITE,google.maps.MapTypeId.HYBRID]},scrollwheel:true},},})}a.each(z,function(A,B){a(".flat-map").gmap3({marker:{values:[{address:B.address,options:{icon:"./image/icon-map.png"}}]},styledmaptype:{id:"Wizym",options:{name:"Wizym"},styles:[{featureType:"administrative",elementType:"all",stylers:[{saturation:"-100"}]},{featureType:"administrative.province",elementType:"all",stylers:[{visibility:"off"}]},{featureType:"landscape",elementType:"all",stylers:[{saturation:-100},{lightness:65},{visibility:"on"}]},{featureType:"poi",elementType:"all",stylers:[{saturation:-100},{lightness:"50"},{visibility:"simplified"}]},{featureType:"road",elementType:"all",stylers:[{saturation:"-100"}]},{featureType:"road.highway",elementType:"all",stylers:[{visibility:"simplified"}]},{featureType:"road.arterial",elementType:"all",stylers:[{lightness:"30"}]},{featureType:"road.local",elementType:"all",stylers:[{lightness:"40"}]},{featureType:"transit",elementType:"all",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"water",elementType:"geometry",stylers:[{hue:"#ffff00"},{lightness:-25},{saturation:-97}]},{featureType:"water",elementType:"labels",stylers:[{lightness:-25},{saturation:-100}]}]}})})};var w=function(){a(document).on("click",function(A){var z=A.target.id;if((z!=="input-search")){a(".header-search-form").removeClass("show")}});a(".header-search-icon").on("click",function(z){z.stopPropagation()});a(".header-search-form").on("click",function(z){z.stopPropagation()});a(".header-search-icon").on("click",function(z){if(!a(".header-search-form").hasClass("show")){a(".header-search-form").addClass("show");z.preventDefault()}else{a(".header-search-form").removeClass("show")}z.preventDefault()})};var x=function(){a(".woocommerce-tabs").each(function(){a(".tab").on("click",function(z){var A=a(this).data("id");a(".tab-content").hide();a(A).show();a(".tabs li a").removeClass("active");a(this).addClass("active");return false})})};var k=function(){if(a().slider){a(function(){a("#slide-range").slider({range:true,min:0,max:120,values:[30,120],slide:function(z,A){a("#amount").html("$"+A.values[0]+" - $"+A.values[1])}});a("#amount").html(a("#slide-range").slider("values",0)+"$ - "+a("#slide-range").slider("values",1)+"$")})}};var e=function(){a(".box-filter").hide();a(".show-filter").on("click",function(){a(".box-filter").slideToggle(1000);a(".filter-shop li.filter-list").toggleClass("active");a(this).toggleClass("active")});a(".box-filter .btn-close").on("click",function(){a(".box-filter").slideToggle(1000);a(".show-filter").removeClass("active");a(".filter-shop li.filter-list").removeClass("active")})};var v=function(){var z="desktop";a(window).on("load resize",function(){var C="desktop";if(matchMedia("only screen and (max-width: 991px)").matches){C="mobile"}if(C!==z){z=C;if(C==="mobile"){var B=a("#mainnav").attr("id","mainnav-mobi").hide();var D=a("#mainnav-mobi").find("li:has(ul)");a("#header .container-header ").after(B);D.children("ul").hide();D.children("a").after('<span class="btn-submenu"></span>');a(".btn-menu").removeClass("active")}else{var A=a("#mainnav-mobi").attr("id","mainnav").removeAttr("style");A.find(".submenu").removeAttr("style");a("#header .container-header ").find(".nav-wrap").append(A);a(".btn-submenu").remove()}}});a(".mobile-button").on("click",function(){a("#mainnav-mobi").slideToggle(300);a(this).toggleClass("active")});a(document).on("click","#mainnav-mobi li .btn-submenu",function(A){a(this).toggleClass("active").next("ul").slideToggle(300);A.stopImmediatePropagation()})};var q=function(){a("#header").each(function(){var z=a("#header");a(window).on("load",function(){var B=a("#header");var D=a("#header").offset().top;var C=a("#header").height();var A=a("<div>",{height:C}).insertAfter(B);A.hide();a(window).on("load scroll",function(){if(a(window).scrollTop()>D){a("#header").addClass("fixed-header");A.show()}else{a("#header").removeClass("fixed-header");A.hide()}})})})};var c=function(){a(".count-time").each(function(){var A=a(".count-time").data("day"),D=a(".count-time").data("month")-1,G=a(".count-time").data("year"),B=a(".count-time").data("hour"),C=a(".count-time").data("minute"),E=a(".count-time").data("second");var z=new Date(G,D,A,B,C,E).getTime();var F=setInterval(function(){var L=new Date().getTime();var I=z-L;var H=Math.floor(I/(1000*60*60*24));var J=Math.floor((I%(1000*60*60*24))/(1000*60*60));var K=Math.floor((I%(1000*60*60))/(1000*60));var M=Math.floor((I%(1000*60))/1000);a(".days .numb").html(H);a(".hours .numb").html(J);a(".minutes .numb").html(K);a(".seconds .numb").html(M);if(I<0){clearInterval(F);a(".days .numb").html("0");a(".hours .numb").html("0");a(".minutes .numb").html("0");a(".seconds .numb").html("0")}},1000)})};var n=function(){a(window).scroll(function(){if(a(this).scrollTop()>800){a("#scroll-top").addClass("show")}else{a("#scroll-top").removeClass("show")}});a("#scroll-top").on("click",function(){a("html, body").animate({scrollTop:0},1000,"easeInOutExpo");return false})};var g=function(){if(a().magnificPopup){a(".flat-icon").each(function(){a(this).find(".zoom-popup").magnificPopup({disableOn:700,type:"image",gallery:{enabled:true},mainClass:"mfp-fade",removalDelay:160,preloader:false,fixedContentPos:true})})}};var y=function(){a(".zoom-pic").each(function(){a(".zoom-pic").fancybox()})};var t=function(){a(".filter-shop").each(function(){a(this).closest("body").find(".flat-products").addClass("grid");a(this).find(".grid ").addClass("active");a(this).find(".grid").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".flat-products").removeClass("list");a(this).closest("body").find(".flat-products").addClass("grid")});a(this).find(".list").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".flat-products").removeClass("grid");a(this).closest("body").find(".flat-products").addClass("list")})})};var o=function(){a(".filter-shop").each(function(){a(this).closest("body").find(".main-shop-fullwidth").addClass("grid");a(this).find(".grid ").addClass("active");a(this).find(".grid").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".main-shop-fullwidth").removeClass("list");a(this).closest("body").find(".main-shop-fullwidth").addClass("grid")});a(this).find(".list").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".main-shop-fullwidth").removeClass("grid");a(this).closest("body").find(".main-shop-fullwidth").addClass("list")})})};var p=function(){a(".filter-shop").each(function(){a(this).closest("body").find(".main-shop-right").addClass("grid");a(this).find(".grid ").addClass("active");a(this).find(".grid").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".main-shop-right").removeClass("list");a(this).closest("body").find(".main-shop-right").addClass("grid")});a(this).find(".list").on("click",function(){a(this).siblings().removeClass("active");a(this).addClass("active");a(this).closest("body").find(".main-shop-right").removeClass("grid");a(this).closest("body").find(".main-shop-right").addClass("list")})})};var u=function(){a(window).on("load",function(){a(".loader").fadeOut();a("#loading-overlay").delay(500).fadeOut("slow",function(){a(this).remove()})})};var l=function(){var D=window.devicePixelRatio>1?true:false;var z=a(".logo img");var B=z.data("retina");var A=a(".logo-ft img");var C=A.data("retina");if(D&&B){z.attr({src:z.data("retina"),width:z.data("width"),height:z.data("height")})}if(D&&C){A.attr({src:A.data("retina"),width:A.data("width"),height:A.data("height")})}};var b=function(){a("#contactform").each(function(){a(this).validate({submitHandler:function(A){var z=a(A),C=z.serialize(),B=a("<div />",{"class":"loading"});a.ajax({type:"POST",url:z.attr("action"),data:C,beforeSend:function(){z.find(".form-submit").append(B)},success:function(E){var F,D;if(E==="Success"){F="Message Sent Successfully To Email Administrator. ( You can change the email management a very easy way to get the message of customers in the user manual )";D="msg-success"}else{F="Error sending email.";D="msg-error"}z.prepend(a("<div />",{"class":"flat-alert "+D,text:F}).append(a('<a class="close" href="#"><i class="fa fa-close"></i></a>')));z.find(":input").not(".submit").val("")},complete:function(F,E,D){z.find(".loading").remove()}})}})})};var f=function(){if(a().owlCarousel){a(".themesflat-gallery").each(function(){var z=a(this),A=z.data("auto"),C=z.data("column"),D=z.data("column2"),E=z.data("column3"),B=Number(z.data("gap"));z.find(".owl-carousel").owlCarousel({margin:B,nav:false,thumb:true,dots:false,thumbImage:true,navigation:false,pagination:false,autoplay:A,autoplayTimeout:5000,responsive:{0:{items:E},600:{items:D},1000:{items:C}}})})}};a(function(){k();x();j();e();h();i();w();n();c();m();v();q();g();r();t();o();p();y();f();l();b();u();a(window).load(function(){r()})})})(jQuery);