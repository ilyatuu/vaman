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
import org.json.JSONObject;


/**
 * Servlet implementation class GetBootTable
 */
@WebServlet("/GetBootTable")
public class GetBootTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query;
	
	PrintWriter pw;
	DbConnect db;
	Connection cnn = null;
	PreparedStatement pstm = null;
	ResultSet rset = null;
	ResultSetMetaData columns;
	
	JSONArray jarr;
	JSONObject jobj,json;
	
	int rtype,rows;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBootTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		response.setContentType("application/json");
		if(!request.getParameterMap().containsKey("tablename"))
			return;
		
		JSONObject opts = new JSONObject();
			opts.put("tablename",request.getParameter("tablename"));
				
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
		
		switch(rtype){
		case 101:
			pw.print(getInterviewerSummary(opts).toString());
			break;
		default:
			pw.print(getBootTable(opts).toString());
			break;
		}
	}
	protected JSONObject getInterviewerSummary(JSONObject opts){
		try{
			query  = "SELECT "+opts.getString("colname")+" as interviewer_name,count(*) as total_va";
			query += " FROM "+opts.getString("tablename");
			query += " GROUP BY interviewer_name";
			query += " ORDER BY interviewer_name ASC;";
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			rows = 0;
			while(rset.next()){
				rows++;
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					//jobj.put( columns.getColumnName(i), rset.getObject(i));
					jobj.put( columns.getColumnLabel(i), rset.getObject(i));
				}
				jarr.put(jobj);
			}
			json = new JSONObject();
			json.put("total", rows);
			json.put("rows", jarr);
			return json;
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//finally block used to close resources
		      try{
		         if(pstm!=null)
		            pstm.close();
		      }catch(SQLException se){
		      }// do nothing
		      try{
		         if(cnn!=null)
		            cnn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		}
		return null;
	}
	protected JSONObject getBootTable(JSONObject opts){
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
}
