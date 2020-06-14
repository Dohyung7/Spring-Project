package org.zerock.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		
		String sql = "update tbl_member set userid=?, userpw=?, username=? where userid=20161888";
			
			Connection con =null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode(""+1234));
				pstmt.setString(1, ""+201618881);
				pstmt.setString(3, "관리자");

				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
			}
			
		
		
	}
	
	/*
	@Test
	public void testInsetAuth() {
		
		
		String sql = "insert into tbl_member_auth (userid, auth) values(?,?)";
		
for (int i = 0; i < 100; i++) {
			
			Connection con =null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
					pstmt.setString(1,"20161888");
					pstmt.setString(2, "ROLE_USER");
				
				
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
			}
			
		}
	}*/
}
