package iact.dev;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;



public class DbConnect {
	private static Properties props;
	public enum ConnectionType{ mySQL, pgSQL; }
	public static ConnectionType cType;
	// TODO Auto-generated method stub
	public Connection getConn() throws Exception{
		
		try{
			
			synchronized(DbConnect.class){
				if(props == null){
					InputStream in = this.getClass().getClassLoader().getResourceAsStream("db.properties");
					System.out.println("reading db.properties");
					props = new Properties();
					props.load(in);
					in.close();
				}
			}
			String driver = props.getProperty("db.driver"); 
			if (driver != null) {
				if(driver.contains("mysql")){
					try{
						Class.forName("com.mysql.jdbc.Driver");
						cType = ConnectionType.mySQL;
					}catch(ClassNotFoundException e){
						System.out.println("Missing JDBC Driver. Please include mysql connector it in your library path");
						throw e;
					}
				}else if(driver.contains("postgresql")){
					try{
						Class.forName("org.postgresql.Driver");
						cType = ConnectionType.pgSQL;
					}catch(ClassNotFoundException e){
						System.out.println("Missing JDBC Driver. Please include postgresql connector it in your library path");
						throw e;
					}
				}else{
					System.out.println("Invalid db.driver settings. Please look at your db.properties file");
				}
				
				String db = props.getProperty("db.name");
	            String url = props.getProperty("db.url");  
	            String user = props.getProperty("db.user");  
	            String pass = props.getProperty("db.pass");
	            
	            if(driver.contains("mysql")){
	            	return DriverManager.getConnection(url+db, user, pass);
	            }
	            if(driver.contains("postgresql")){
		            String schema = props.getProperty("db.schema");    
		            return DriverManager.getConnection(url+db+"?currentSchema="+schema, user, pass);
	            } 
			}
			 return null;
		}catch(Exception e){
				throw e;
		}
	}

}
