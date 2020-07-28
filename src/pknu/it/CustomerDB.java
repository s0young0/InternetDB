package pknu.it;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDB {
	 public Connection getConnection() throws Exception{
	  Connection con=null;
	  String url="jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe";
	  String user="db201712028";
	  String passwd="201712028";
	  Class.forName("oracle.jdbc.OracleDriver");
	  con=DriverManager.getConnection(url,user,passwd);
	  return con;
	 }
	 //회원가입
	 public void insertCustomer(CustomerDataBean customer){
	  Connection con=null;
	  PreparedStatement pstmt1=null;
	  PreparedStatement pstmt2=null;
	  PreparedStatement pstmt3=null;
	  ResultSet rs = null;
	  try {
	   con=getConnection();
	   String insertMemberSql="insert into member values(?,?,?)";
	   pstmt1=con.prepareStatement(insertMemberSql);
	   pstmt1.setString(1, customer.getId());
	   pstmt1.setString(2, customer.getPwd());
	   pstmt1.setString(3, "customer");
	   pstmt1.executeUpdate();
	   
	   String searchSql = "select max(customer_no) from customer";
	   pstmt2 = con.prepareStatement(searchSql);
       rs = pstmt2.executeQuery();
             
       String c_noStr = null;
       
       while(rs.next()){
    	   c_noStr = rs.getString("max(customer_no)");
       }
       int c_noInt = Integer.parseInt(c_noStr);
       c_noInt+=1;
	   
	   String insertCustomerSql="insert into customer values(?,?,?,?)";
	   pstmt3=con.prepareStatement(insertCustomerSql);
	   pstmt3.setInt(1, c_noInt);
	   pstmt3.setString(2, customer.getId());
	   pstmt3.setString(3, customer.getName());
	   pstmt3.setString(4, customer.getTel());
	   pstmt3.executeUpdate();
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally {
	   if(rs!=null)try {rs.close();}catch(SQLException ex){}
	   if(pstmt1!=null && pstmt2!=null && pstmt3!=null)try{pstmt1.close(); pstmt2.close(); pstmt3.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	 }

	 public int roleCheck(String id) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try 
		{
			con = getConnection();
			String sql = "select role from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			String role = null;
			if(rs.next()) {
				role = rs.getString("role");
			}
			if(role.equals("customer")) {
				check = 1;
			} else {
				check = 0;
			}
		} catch (Exception e) {
			   e.printStackTrace();
		  }finally{
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		  return check;
	 }
	 
	 public int userCheck(String id,String passwd){
	  int check=-1;
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  String sql="";
	  ResultSet rs=null;
	  try {
	   con=getConnection();
	   sql="select pwd from member where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs=pstmt.executeQuery();

	   if(rs.next()){
	    String dbPass=rs.getString("pwd");
	    if(passwd.equals(dbPass)){
	     check=1;//비밀번호맞음
	    }else{
	     check=0;//비밀번호틀림
	    }
	   }else{
	    check=-1;//아이디없음
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return check;
	 }
	 //회원정보가져오기
	 public CustomerDataBean getCustomer(String id){
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  String sql="";
	  CustomerDataBean customer=null;
	  try {
	   con=getConnection();

	   sql="select * from customer where id=?";
	   pstmt=con.prepareStatement(sql);
	   pstmt.setString(1, id);

	   rs=pstmt.executeQuery();

	   if(rs.next()){
		customer=new CustomerDataBean();
		customer.setId(rs.getString("id"));
		customer.setName(rs.getString("customer_nik"));
		customer.setTel(rs.getString("customer_tel"));
	   }
	  } catch (Exception e) {
	   e.printStackTrace();
	  }finally{
	   if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
	   if(con!=null)try{con.close();}catch(SQLException ex){}
	  }
	  return customer;
	 }

	//회원수정하기
	 public int updateCustomer(CustomerDataBean customer){
		  Connection con=null;
		  PreparedStatement pstmt=null;
		  ResultSet rs=null;
		  String sql="";
		  int check=-1;
		  try {

		   con=getConnection();
		   sql="select pwd from member where id=?";
		   pstmt=con.prepareStatement(sql);
		   pstmt.setString(1, customer.getId());
		   rs=pstmt.executeQuery();
		
		   if(rs.next()){

		    String dbPass=rs.getString("pwd");
		    if(customer.getPwd().equals(dbPass)){
		     check=1; 
		     
		     sql="update customer set customer_nik=?, customer_tel=? where id=?";
		     pstmt=con.prepareStatement(sql);
		     pstmt.setString(1, customer.getName());
		     pstmt.setString(2, customer.getTel());
		     pstmt.setString(3, customer.getId());

		     pstmt.executeUpdate();

		    }else{
		     check=0;
		    }
		   }
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally{
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		  return check;
		 }
	 public int idCheck(String id) {
		 int check=-1;
		  Connection con=null;
		  PreparedStatement pstmt=null;
		  String sql="";
		  ResultSet rs=null;
		  try {
			  con=getConnection();
			   sql="select * from member";
			   pstmt=con.prepareStatement(sql);
			   rs=pstmt.executeQuery();
			   while(rs.next()) {
				   String dbId=rs.getString("id");
				    if(id.equals(dbId)){
				    	check=0;
				    	return check;
				    } else {
				    	check=1;
				    }
			   }
		  }catch (Exception e) {
			  e.printStackTrace();
		  }finally{
			   if(rs!=null)try{rs.close();}catch(SQLException ex){}
			   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			   if(con!=null)try{con.close();}catch(SQLException ex){}
			  }
		 return check;
	 }
}
