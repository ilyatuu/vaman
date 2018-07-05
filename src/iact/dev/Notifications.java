package iact.dev;

import iact.dev.DbConnect.ConnectionType;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Notifications
 */
@WebServlet("/Notifications")
public class Notifications extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query;
	
	PrintWriter pw;
	DbConnect db;
	Connection cnn = null;
	PreparedStatement pstm = null;
	ResultSet rset = null;
	ResultSetMetaData columns;
	
	JSONArray jarr;
	JSONObject jobj,json,opts;
	
	int rtype,rows;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notifications() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		opts = new JSONObject();
		opts.put("tablename","_web_notifications");
		if(request.getParameterMap().containsKey("searchVal")){
			if(!request.getParameter("searchVal").isEmpty()){
				opts.put("searchVal",request.getParameter("searchVal"));
				opts.put("searchBy", request.getParameter("searchBy"));
			}
		}
		if(request.getParameterMap().containsKey("orderVal")){
			if(!request.getParameter("orderVal").isEmpty()){
				opts.put("orderVal",request.getParameter("orderVal"));
				opts.put("orderBy",request.getParameter("orderBy"));
			}			
		}
		if(request.getParameterMap().containsKey("limit"))
			opts.put("limit",request.getParameter("limit"));
		else
			opts.put("limit","10");
		
		if(request.getParameterMap().containsKey("offset"))
			opts.put("offset",request.getParameter("offset"));
		else
			opts.put("offset","0");
		
		response.setContentType("application/json");
		pw = response.getWriter();
		switch(rtype){
		case 1://get notifications by id
			break;
		default://list all notifications with pagination
			pw.print(getNotifications(opts));
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		opts = new JSONObject();
		if(request.getParameterMap().containsKey("tablename")){
			opts.put("tablename",request.getParameter("tablename"));
		}else{
			opts.put("tablename", "_web_notifications");
		}
				
		if(request.getParameterMap().containsKey("searchVal")){
			if(!request.getParameter("searchVal").isEmpty()){
				opts.put("searchVal",request.getParameter("searchVal"));
				opts.put("searchBy", request.getParameter("searchBy"));
			}
		}
		
		if(request.getParameterMap().containsKey("orderVal")){
			if(!request.getParameter("orderVal").isEmpty()){
				opts.put("orderVal",request.getParameter("orderVal"));
				opts.put("orderBy",request.getParameter("orderBy"));
			}			
		}
		if(request.getParameterMap().containsKey("limit"))		opts.put("limit",request.getParameter("limit"));
		if(request.getParameterMap().containsKey("offset"))		opts.put("offset",request.getParameter("offset"));
		if(request.getParameterMap().containsKey("groupBy"))	opts.put("groupBy",request.getParameter("groupBy"));
		if(request.getParameterMap().containsKey("userId"))		opts.put("userId", request.getParameter("userId"));
		if(request.getParameterMap().containsKey("rtype"))		rtype = Integer.parseInt(request.getParameter("rtype"));
		if(request.getParameterMap().containsKey("colname"))	opts.put("colname", request.getParameter("colname"));
		
		if(request.getParameterMap().containsKey("columns[]")){
			jarr = new JSONArray( request.getParameterValues("columns[]") );
			opts.put("columns", jarr);
		}
		
		response.setContentType("application/json");
		pw = response.getWriter();
		if(request.getParameterMap().containsKey("rtype")){
			rtype = Integer.parseInt(request.getParameter("rtype"));
		}
		switch(rtype){
		case 1://get notifications by id
			break;
		case 2://add notification
			NotifRec rec = new NotifRec();
			rec.setfName(request.getParameter("event_fname"));
			rec.setlName(request.getParameter("event_lname"));
			rec.setSex(request.getParameter("event_sex"));
			rec.setAge(Integer.parseInt(request.getParameter("event_age")));
			rec.setAgeUnit(request.getParameter("age_unit"));
			rec.setEventType(request.getParameter("event_type"));
			rec.setEventDate(request.getParameter("event_date"));
			rec.setNotifName(request.getParameter("notified_by"));
			rec.setNotifPhone(request.getParameter("notified_by_phone"));
			rec.setNotifDate(request.getParameter("notification_date"));
			rec.setNotifId(request.getParameter("notification_id"));
			rec.setNotifMethod(request.getParameter("notified_by_method"));
			rec.setLocLevel1(request.getParameter("location_level1"));
			rec.setLocLevel2(request.getParameter("location_level2"));
			rec.setLocLevel3(request.getParameter("location_level3"));
			rec.setLocDetails(request.getParameter("location_details"));
			
			opts = new JSONObject();
			if(addNotification(rec)){
				opts.put("success", true);
				opts.put("message", "record added");
				System.out.println("record added");
			}else{
				opts.put("success", false);
				opts.put("message", "failed to add message");
				System.out.println("failed to add message");
			};
			pw.print(opts);
			
			break;
		default://list all notifications with pagination
			pw.print(getNotifications(opts));
			break;
		}
	}
	protected JSONObject getNotifications(JSONObject opts){
		try{
			query = "SELECT COUNT(*) FROM "+opts.getString("tablename")+";";
			if(opts.has("searchVal")){
				if(opts.getString("searchBy").equalsIgnoreCase("c1name")){
					query = query.replace(";", "")+" WHERE c1name ilike '%"+opts.getString("searchVal")+"%' OR c2name ilike '%"+opts.getString("searchVal") +"%';";
				}else{
					query = query.replace(";", "")+" WHERE "+opts.getString("searchBy")+" ilike '%"+opts.getString("searchVal")+"%';";
				}
			}
			
			if(opts.has("userId")){
				if(!opts.has("searchVal")){
					query = query.replace(";", "")+" WHERE (c1id ="+opts.getInt("userId")+" OR c2id="+opts.getInt("userId")+");";
				}else{
					query = query.replace(";", "")+" AND (c1id ="+opts.getInt("userId")+" OR c2id="+opts.getInt("userId")+");";
				}
			}
			
			
			db = new DbConnect();
			//Fix for changing between mysql and postgres
			if ( DbConnect.cType == ConnectionType.mySQL ){
				query = query.replace("ilike", "like");
			}
			//check for numeric values to improve the sql statement
			try{
				if(opts.has("searchVal"))
					Integer.parseInt(opts.getString("searchVal"));
				query = query.replace("ilike", "="); 	//for postgres
				query = query.replace("like", "=");  	//for mysql
				query = query.replace("%","");			//for within search key
			}catch(NumberFormatException e){
				
			}
			
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			Integer rows=0;
			if(rset.next()){
				rows = rset.getInt(1);
			}
			
			if( opts.has("orderBy") ){
				query = query.replace(";", "") + " order by " + opts.getString("orderBy") + " " + opts.getString("orderVal") + ";";
			}
			
			query = query.replace(";", "") + " limit "+opts.getString("limit")+" offset "+opts.getString("offset")+";";
			
			query = query.replace("COUNT(*)", "*");
			
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					jobj.put( columns.getColumnName(i), rset.getObject(i));
					//System.out.println(columns.getColumnTypeName(i));
				}
				jarr.put(jobj);
			}
			json = new JSONObject();
			json.put("total", rows);
			json.put("rows", jarr);
			return json;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}catch(JSONException e){
			e.printStackTrace();
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
		         if(pstm!=null)
		            cnn.close();
		      }catch(SQLException se){
		      }// do nothing
		      try{
		         if(cnn!=null)
		            cnn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		}
	}
	protected JSONObject getNotification(int id){
		return null;
	}
	protected boolean addNotification(NotifRec rec){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query  = "INSERT INTO _web_notifications(event_fname,event_lname,event_sex,event_age,age_unit,";
			query += "event_type,event_date,notif_by,notif_phone,notif_date,notif_id,notif_method,loc_level1,loc_level2,loc_level3,loc_details)";
			query += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, rec.getfName());
			pstm.setString(2, rec.getlName());
			pstm.setString(3, rec.getSex());
			pstm.setInt(4, rec.getAge());
			pstm.setString(5, rec.getAgeUnit());
			pstm.setString(6, rec.getEventType());
			pstm.setDate(7, rec.getEventDate());
			pstm.setString(8, rec.getNotifName());
			pstm.setString(9, rec.getNotifPhone());
			pstm.setDate(10, rec.getNotifDate());
			pstm.setString(11, rec.getNotifId());
			pstm.setString(12, rec.getNotifMethod());
			pstm.setString(13, rec.getLocLevel1());
			pstm.setString(14, rec.getLocLevel2());
			pstm.setString(15, rec.getLocLevel3());
			pstm.setString(16, rec.getLocDetails());
			
			if(pstm.executeUpdate()==1){
				return true;
			}else{
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(JSONException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
		         if(pstm!=null)
		            cnn.close();
		      }catch(SQLException se){
		      }// do nothing
		      try{
		         if(cnn!=null)
		            cnn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		}
		return false;
	}

}
