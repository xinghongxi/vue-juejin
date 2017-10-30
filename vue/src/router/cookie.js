export function setCookie(name,value,day){
	if(day){
		var oDate=new Date();
		oDate.setDate(oDate.getDate()+day);
		oDate.setHours(0,0,0,0);
		document.cookie=name+'='+value+'; path=/; expires='+oDate.toUTCString();
	}else{
		document.cookie=name+'='+value+'; path=/; expires=session;';
	}
}
export function getCookie(name){
	var arr=document.cookie.split('; ');
	var arr2=[];
	var json={};
	for(var i=0; i<arr.length; i++){
		arr2=arr[i].split('=');
		json[arr2[0]]=arr2[1];
	}
	return json[name];
}

export function removeCookie(name){
	setCookie(name,1,-1)
}
