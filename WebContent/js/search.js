function check(){
  if(document.search.keyword.value==''){
	alert('키워드를 입력하세요!'); 
	document.search.keyword.focus();
	return false; 
   
	}
}