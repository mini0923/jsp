function loginFormCheck(e){
	e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
	if(e.value.length > e.maxLength) {
		e.value = e.value.slice(0, e.maxLength);
	}
	
	var f = document.loginForm;
	
	f.action = loginAction.jsp;
	f.submit();
}