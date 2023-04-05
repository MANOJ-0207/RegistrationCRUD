/**
 * 
 */
 /**
 * 
 */
 function loadEditRow(sNo,rollNo,name,mail)
 {
	const obj=new XMLHttpRequest();
	var outPutColumn1='<td class="column-center">'+sNo+'</td>';
	var outPutColumn2='<td class="column-center">'+rollNo+'</td>';
	var outPutColumn3='<td><input type="text" value="'+name+'" id="'+rollNo+'Name">';
	var outPutColumn4='<td><input type="text" value="'+mail+'"  id="'+rollNo+'Mail">';
	var outPutColumn5='<td class="column-center"><a class="btn btn-warning+" type="button" href="Edit.jsp?rollNo='+rollNo+'"><i class="bi bi-arrows-angle-expand"></i></a><a onclick="SaveRow(\''+rollNo+'\',\''+sNo+'\');" type="button" class="btn btn-success")><i class="bi bi-save-fill"></i></a></td></form>';
	obj.onreadystatechange=function()
	{
		if(this.readyState==4 && this.status==200)
			document.getElementById(rollNo).innerHTML=outPutColumn1+outPutColumn2+outPutColumn3+outPutColumn4+outPutColumn5;
	}
	obj.open("get","Registered.html",true);
	obj.send();
}
function SaveRow(rollNo,sNo)
 {
	const obj=new XMLHttpRequest();
	var edittedName=document.getElementById(rollNo+'Name').value;
	var edittedMail=document.getElementById(rollNo+'Mail').value;
	obj.onreadystatechange=function()
	{
		let outPutColumn1='<td class="column-center">'+sNo+'</td>';
		let outPutColumn2='<td class="column-center">'+rollNo+'</td>';
		let outPutColumn3='<td>'+edittedName+'</td>';
		let outPutColumn4='<td>'+edittedMail+'</td>';
		let editButton='<a type="button" class="btn btn-info" onclick="loadEditRow(\''+sNo+'\',\''+rollNo+'\',\''+edittedName+'\',\''+edittedMail+'\')"><i class="bi bi-pencil-fill"></i></a>'
		let deleteButton='<button type="button" class="btn btn-danger" onclick="removeRow(\''+rollNo+'\')" ><i class="bi bi-trash-fill"></i></button>'
		let outputColumn5='<td class="column-center">'+editButton+deleteButton+'</td>'
		console.log(edittedName+" "+edittedMail);
		if(this.readyState==4 && this.status==200)
			document.getElementById(rollNo).innerHTML=outPutColumn1+outPutColumn2+outPutColumn3+outPutColumn4+outputColumn5;
	}
	obj.open("get","UpdateEditRow?rollNo="+rollNo+"&name="+edittedName+"&mail="+edittedMail,true);
	obj.send();
}

function removeRow(rollNo)
 {
	console.log(rollNo);
	const obj=new XMLHttpRequest();
	obj.onreadystatechange=function()
	{
		if(this.readyState==4 && this.status==200)
		{
			document.getElementById(rollNo).innerHTML="";
		}
	}
	obj.open("get","DeleteRollNoRow?rollNo="+rollNo,true);
	obj.send();
}