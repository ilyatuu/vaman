package iact.dev;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class NotifRec {
	private String _notification_id;
	private String _fname, _lname, _sex, _ageUnit;
	private String _eventType;
	private String _notificationName, _notificationPhone, _notificationMethod;
	private String _location_level1, _location_level2, _location_level3, _locationDetails;
	private int _age;
	private java.sql.Date _eventDate,_notificationDate;
	SimpleDateFormat sdf;
	java.util.Date jdate;
	
	public void setLocLevel1(String value){ _location_level1 = value;}
	public String getLocLevel1(){return _location_level1;}
	
	public void setLocLevel2(String value){ _location_level2 = value;}
	public String getLocLevel2(){return _location_level2;}
	
	public void setLocLevel3(String value){ _location_level3 = value;}
	public String getLocLevel3(){return _location_level3;}
	
	public void setLocDetails(String value){ _locationDetails = value;}
	public String getLocDetails(){return _locationDetails;}
	
	
	public void setNotifName(String value){_notificationName = value;}
	public String getNotifName(){return _notificationName;}
	
	public void setNotifPhone(String value){_notificationPhone = value;}
	public String getNotifPhone(){return _notificationPhone;}
	
	public void setNotifMethod(String value){_notificationMethod = value;}
	public String getNotifMethod(){return _notificationMethod;}
	
	
	
	public void setAge(int value){_age = value;}
	public int getAge(){ return _age;}
	
	public void setSex(String value){ _sex = value; }
	public String getSex(){return _sex;}
	
	public void setEventDate(String value){
		try {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			jdate = sdf.parse(value);
			_eventDate = new java.sql.Date(jdate.getTime());
		} catch (ParseException e) { e.printStackTrace(); }
	}
	public java.sql.Date getEventDate(){return _eventDate;}
	
	public void setNotifDate(String value){ 
		try {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			jdate = sdf.parse(value);
			_notificationDate = new java.sql.Date(jdate.getTime());
		} catch (ParseException e) { e.printStackTrace(); }
	
	}
	public java.sql.Date getNotifDate(){return _notificationDate;}
	
	
	public void setEventType(String value){ _eventType = value; }
	public String getEventType(){return _eventType;}
	

	public void setAgeUnit(String value){ _ageUnit = value; }
	public String getAgeUnit(){return _ageUnit;}
	
	public void setfName(String value){ _fname = value; }
	public String getfName(){return _fname;}
	
	public void setlName(String value){ _lname = value; }
	public String getlName(){return _lname;}
	
	public void setNotifId(String value){ _notification_id=value; }
	public String getNotifId(){ return _notification_id;}
}
