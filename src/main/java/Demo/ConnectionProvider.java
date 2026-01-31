package Demo;
import java.io.*;
import java.util.*;
import java.sql.*;
public class ConnectionProvider {
	private  String dbHost="localhost";
	private  String dbPort="3306";
	private  String dbUserName="root";
	private  String dbPassword="123456";
	private  String dbName="user_management";
	
	public  Connection getCon() {
		try {
			loadCredentials();
			Class.forName("com.mysql.jdbc.Driver");
			  String dbURL = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;
			  Connection con = DriverManager.getConnection(dbURL, dbUserName, dbPassword);
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
		
	}
	
	private  void loadCredentials() throws Exception {
		try {
			

			
			InputStream fis= this.getClass().getResourceAsStream("dbCredentials.properties");
			Properties prop=new Properties();
			prop.load(fis);
			dbHost = prop.getProperty("dbHost");
			dbPort = prop.getProperty("dbPort");
			dbUserName = prop.getProperty("dbUserName");
			dbPassword = prop.getProperty("dbPassword");
			dbName = prop.getProperty("dbName");
			
			
		} catch (Exception e) {
			throw e;
		}
	}
	
}
