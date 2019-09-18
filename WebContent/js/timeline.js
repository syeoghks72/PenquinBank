

changeLookup = function() {	
    var lookupSelect = document.getElementById("monthlyLookup");
    var selectValue = lookupSelect.options[lookupSelect.selectedIndex].value;
	if(selectValue!='44/12') location.href="timeline.do?StringDate="+selectValue;
	else {
		var today = new Date();
		var year = today.getFullYear()-1;
		location.href="timeline.do?StringDate="+selectValue+"&beforeYear="+year;
	}
}

changeBeforeLookup = function() {
	 var lookupSelect = document.getElementById("monthlyLookup");
     var selectValue = lookupSelect.options[lookupSelect.selectedIndex].value;
	 var lookupBeforeYear = document.getElementById("selectBeforeYears");
	 var selectYear = lookupBeforeYear.options[lookupBeforeYear.selectedIndex].value;
	 location.href="timeline.do?StringDate="+selectValue+"&beforeYear="+selectYear;
}

