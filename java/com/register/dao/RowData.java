package com.register.dao;
public class RowData 
{
	public RowData(String rollNo, String name,String mail) 
	{
		super();
		this.rollNo = rollNo;
		this.name = name;
		this.mail=mail;
	}
	private String rollNo;
	private String name;
	private String mail;
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}
	@Override
	public String toString() {
		return "RowData [rollNo=" + rollNo + ", name=" + name + ", mail=" + mail + "]";
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
}
//
//for(rowdata rd:rows) {
//<tr>
//	<td>rd.getrollno()</td>
//	<td>rd.getName()</td>
//	<td>rd.getMail()</td>
//</tr>
//}
