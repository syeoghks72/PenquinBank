

/* 실시간 인기 검색어 */
$(function()
{
    var searchTicker = function()
    {
        setTimeout(function(){
            $('#searchTicker li:first').animate( {marginTop: '-20px'}, 400, function()
            {
                $(this).detach().appendTo('ul#searchTicker').removeAttr('style');
            });
            searchTicker();
        }, 2000);
    };
    searchTicker();
});





/* 한줄 공지사항 */
$(function(){
    var noticeTicker = function()
    {
        timer = setTimeout(function(){
            $('#noticeTicker li:first').animate( {marginTop: '-20px'}, 400, function()
            {
                $(this).detach().appendTo('ul#noticeTicker').removeAttr('style');
            });
            noticeTicker();
        }, 2000);         
      };

  // 마우스를 올렸을 때 기능 정지
  var noticeTickerover = function()
  {
    $('#noticeTicker').mouseover(function(){
      clearTimeout(timer);
    });
    $('#noticeTicker').mouseout(function(){
      noticeTicker();
    });  
  };
  noticeTickerover();

  //끝
    noticeTicker();
});
