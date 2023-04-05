/**
 * 
 */
function containsSpecialChars(str) 
{
  const specialChars =/[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
  return specialChars.test(str);
}
function validate()
{
	console.log("Checking");
	let name=document.getElementById(name).value;
	name=name.replace(" ","");
	if(containsSpecialChars(name))
	{
		alert("Invalid Name!");
		return false;
	}
	let rollNo=document.forms["registrationForm"]["rollNo"].value;
	console.log(rollNo);
	if(rollNo.length!=6)
	{
		alert("Invalid RollNumber");
		return false;
	}
	return true;
}