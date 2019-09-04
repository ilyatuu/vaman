package iact.dev;

import java.util.Properties;
import java.io.InputStream;

public class Settings {
	private static Properties props;
	
	public static String page_title;
	public static String page_sub_title;
	public static String va_type;
	
	public static boolean add_quotes;
	public static String admin_level1;
	public static String admin_level2;
	public static String admin_level3;
	public static String admin_level4;
	
	public static String interviewers_name_table;
	public static String interviewers_name_column;
	public static String interviewers_phone_column;
	
	
	
	
	
	//Get values form the settings file (st.properties) 
	static {
		synchronized(Settings.class){
			try{
				if(props==null){
					InputStream in = Settings.class.getClassLoader().getResourceAsStream("st.properties");
					props = new Properties();
					props.load(in);
					in.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//Load page settings
		page_title = props.getProperty("app.page_title");
		page_sub_title = props.getProperty("app.page_sub_title");
		
		//Load VA parameters
		va_type = props.getProperty("app.va_type");
		add_quotes = Boolean.parseBoolean(props.getProperty("app.add_quotes"));
		
		//Load structure
		admin_level1 = props.getProperty("app.admin_level1");
		admin_level2 = props.getProperty("app.admin_level2");
		admin_level3 = props.getProperty("app.admin_level3");
		admin_level4 = props.getProperty("app.admin_level4");
		
		interviewers_name_table = props.getProperty("app.interviewers_name_table");
		interviewers_name_column = props.getProperty("app.interviewers_name_column");
		interviewers_phone_column = props.getProperty("app.interviewers_phone_column");
	}
	

}
