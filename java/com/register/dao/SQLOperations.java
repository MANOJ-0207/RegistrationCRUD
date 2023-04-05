package com.register.dao;
import com.register.util.DButil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class SQLOperations 
{
	public static void insertValue(RowData rowData) throws SQLException
	{
		Connection connection=DButil.createConnection();
		Statement statement=connection.createStatement();
		String rollNo=rowData.getRollNo();
		String name=rowData.getName();
		String email=rowData.getMail();
		String query="insert into registerdata values('"+rollNo+"','"+name+"','"+email+"')";
		statement.execute(query);
	}
	public static List<RowData> selectAll() throws SQLException
	{
		Connection connection=DButil.createConnection();
		Statement statement=connection.createStatement();
		String query="select * from registerdata";
		ResultSet resultSet=statement.executeQuery(query);
		ArrayList<RowData>rows=new ArrayList<>();
		while(resultSet.next())
		{
			String rollNo=resultSet.getString(1);
			String name=resultSet.getString(2);
			String mail=resultSet.getString(3);
			RowData row=new RowData(rollNo,name,mail);
			rows.add(row);
		}
		return rows;
	}
	public static RowData select(String rollNo) throws SQLException
	{
		Connection connection=DButil.createConnection();
		Statement statement=connection.createStatement();
		String query="select * from registerdata where RegNo='"+rollNo+"'";;
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			String regNo=resultSet.getString(1);
			String name=resultSet.getString(2);
			String mail=resultSet.getString(3);
			RowData rowData=new RowData(regNo,name,mail);
			return rowData;
		}
		return null;
	}
	public static void delete(String rollNo) throws SQLException
	{
		Connection connection=DButil.createConnection();
		Statement statement=connection.createStatement();
		String query="delete from registerdata where RegNo='"+rollNo+"'";
		statement.executeUpdate(query);
		connection.close();
	}
	public static void updateRow(String rollNo,String name,String mail) throws SQLException
	{
		Connection connection=DButil.createConnection();
		Statement statement=connection.createStatement();
		String query="update registerdata set Name='"+name+"',Mail='"+mail+"' where RegNo='"+rollNo+"'";
		statement.executeUpdate(query);
		connection.close();
	}
//	set @sl:=0;
//	select @sl:=@sl+1 as 'S.No',RegNo,Name from registerdata
	public static void main(String[] args) throws SQLException 
	{
//		Scanner sc=new Scanner(System.in);
//		String id=sc.next();
//		String name=sc.next();
//		String mail=sc.next();
//		insertValue(new RowData(id,name,mail));
//		sc.close();
		System.out.println(selectAll());
	}
}
