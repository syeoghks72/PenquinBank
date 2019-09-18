$(function () {

	/* 상단 메뉴 드롭다운 */
	$(".zeta-menu li").hover(function(){
		$('ul:first',this).show();
	}, function(){
		$('ul:first',this).hide();
	});
	$(".zeta-menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html());
	});
	$(".zeta-menu ul li:has(ul)").find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	
	/* 마이페이지 사이드 메뉴 */
	$(window).ready(function() {
    	initMenu();
	});
	 
	$('.menuitem').hover(function() { 
		var offset = $(this).offset(); 
		$('.slidingBar').offset(offset); 
	}); 
	$('.menu').hover(function() { 
		$('.slidingBar').css({ 
			opacity: 1 
		}); 
	}, function() { 
		$('.slidingBar').css({ 
			opacity: 0 
		}); 
	}) 

	var initMenu = function() { 
		var $initElem = $('.menuitem:first-of-type'); 
		var initOffset = $initElem.offset(); 
		var initSize = { 
			width: $initElem.css('width'), 
			height: $initElem.css('height') 
		} 
		$('.slidingBar')
			.offset(initOffset)
			.css(initSize) 
	}

    $('#myinfoSection .tabContent').not('#tab1').hide();
	$('#myinfoSection .tabContent:first').show();

    $('#myinfoSection  ul.menu li').click(function () {
        $('#myinfoSection  ul.menu li').removeClass('active').css('color', '#333');
        $(this).addClass('active').css('color', 'dodgerblue');
        $('#myinfoSection  .tabContent').hide()
        var activeTab = $(this).attr('rel');
        $('#' + activeTab).fadeIn()
    });
	
	$('#myinfoSection #modifiedBtn').click(function(){
		
            //slideDown 보이게 
        $('#myinfoSection .hideContent').slideDown(500).css({
            'backgroundColor':'#ecf5ff',
            'padding':'20px',
            'margin':'20px 0'
        });
       
	})

	/* 자주묻는질문*/
    $('#faqSection .hideContent').hide();
    $('#faqSection .tabContent').not('#tab1').hide();
    $('#faqSection .tabContent:first').show();

    $('#faqSection ul.tabLine li').click(function () {
        $('#faqSection ul.tabLine li').removeClass('active').css('color', '#333');
        $(this).addClass('active').css('color', 'dodgerblue');
        $('#faqSection .tabContent').hide()
        var activeTab = $(this).attr('rel');
        $('#' + activeTab).fadeIn()
    });
    
    $('#faqSection .tabContent ul .tabList a').click(function(){
        if($(this).next().css('display')=='none'){
            //slideUp 안보이게
            $('.hideContent').slideUp(500).css({
                'backgroundColor':'#f3f3f3',
                'padding':'20px 20px 0',
            });
            //slideDown 보이게 
            $(this).next().slideDown(500).css({
                'backgroundColor':'#f3f3f3',
                'padding':'20px 20px 0',
            });
        }
	})
	
	
	/* 이용가이드 */
    $('#userGuideSection .hideContent').hide();
    $('#userGuideSection .tabContent').not('#tab1').hide();
    $('#userGuideSection .tabContent:first').show();

    $('#userGuideSection ul.tabLine li').click(function () {
        $('#userGuideSection ul.tabLine li').removeClass('active').css('color', '#333');
        $(this).addClass('active').css('color', 'dodgerblue');
        $('#userGuideSection .tabContent').hide()
        var activeTab = $(this).attr('rel');
        $('#' + activeTab).fadeIn()
    });
    
    $('#userGuideSection ul.tabLine li:first').click(function(){
        $('#userGuideSection #tab1').show();
       });
    $('#userGuideSection ul.tabLine li:nth-chile(2)').click(function(){
        $('#userGuideSection #tab2').show();
       });
    $('#userGuideSection ul.tabLine li:nth-chile(3)').click(function(){
        $('#userGuideSection #tab3').show();
       });
    $('#userGuideSection ul.tabLine li:nth-chile(4)').click(function(){
        $('#userGuideSection #tab4').show();
       });


	/* 민원접수 */
    $('#complaintsReceivedSection .hideContent').hide();
    $('#complaintsReceivedSection .tabContent').not('#tab1').hide();
    $('#complaintsReceivedSection .tabContent:first').show();

    $('#complaintsReceivedSection ul.tabLine li').click(function () {
        $('#complaintsReceivedSection ul.tabLine li').removeClass('active').css('color', '#333');
        $(this).addClass('active').css('color', 'dodgerblue');
        $('#complaintsReceivedSection .tabContent').hide()
        var activeTab = $(this).attr('rel');
        $('#' + activeTab).fadeIn()
    });
    
    $('#complaintsReceivedSection ul.tabLine li:first').click(function(){
        $('#complaintsReceivedSection #tab1').show();
       });
    $('#complaintsReceivedSection ul.tabLine li:nth-chile(2)').click(function(){
        $('#complaintsReceivedSection #tab2').show();
       });
    $('#complaintsReceivedSection ul.tabLine li:nth-chile(3)').click(function(){
        $('#complaintsReceivedSection #tab3').show();
       });
    $('#complaintsReceivedSection ul.tabLine li:nth-chile(4)').click(function(){
        $('#complaintsReceivedSection #tab4').show();
	   });
	   

	/* 이벤트 */
    $('#eventSection  .tabContent').not('#tab1').hide();
    $('#eventSection  .tabContent:first').show();

    $('#eventSection  ul.tabLine li').click(function () {
        $('#eventSection  ul.tabLine li').removeClass('active').css('color', '#333');
        $(this).addClass('active').css('color', 'dodgerblue');
        $('#eventSection  .tabContent').hide()
        var activeTab = $(this).attr('rel');
        $('#' + activeTab).fadeIn()
    });
	
	
   
		

});



