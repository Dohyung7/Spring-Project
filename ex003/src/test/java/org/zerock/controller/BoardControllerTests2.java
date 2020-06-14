package org.zerock.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests2 {
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER = "book_ex";
	private static final String PW = "book_ex";

	@Test //JUnit이 테스트하는 코드
	public void testConnection() throws Exception {
	        Class.forName(DRIVER);
	        try(Connection conn= DriverManager.getConnection(URL, USER, PW)) {
	        	log.info(URL + USER + PW);
	        	log.info("gdgd");
	        }catch(Exception e) {
	                e.printStackTrace();
	        }
	}
}
