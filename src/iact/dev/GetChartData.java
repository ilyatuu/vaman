package iact.dev;

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
 * Servlet implementation class GetChartData
 */
@WebServlet("/GetChartData")
public class GetChartData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrintWriter pw;
	DbConnect db;
	Connection cnn = null;
	PreparedStatement pstm = null;
	ResultSet rset = null;
	ResultSetMetaData columns;
	String query,tablename;
	
	int rtype;
	
	JSONObject jobj,json,jopt;
	JSONArray jarr1,jarr2,jarr3;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetChartData() {
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
		jopt = new JSONObject();
		
		if(request.getParameterMap().containsKey("tablename"))
			jopt.put("tablename", request.getParameter("tablename"));
		
		if(request.getParameterMap().containsKey("qtype"))
			jopt.put("qtype", request.getParameter("qtype"));
		
		if(request.getParameterMap().containsKey("wherevalue"))
			if(!request.getParameter("wherevalue").isEmpty()){
				jopt.put("wherevalue", request.getParameter("wherevalue"));
				jopt.put("wherecolumn", request.getParameter("wherecolumn"));
			}
			
		if(request.getParameterMap().containsKey("filtervalue"))
			if(!request.getParameter("filtervalue").isEmpty()){
				jopt.put("filtervalue", request.getParameter("filtervalue"));
				jopt.put("filtercolumn", request.getParameter("filtercolumn"));
			}
				
		
		if(request.getParameterMap().containsKey("columns[]")){
			jarr1 = new JSONArray( request.getParameterValues("columns[]") );
			jopt.put("columns", jarr1);
		}

		
		//set content type
		response.setContentType("application/json");
		if(request.getParameterMap().containsKey("rtype")){
			rtype = Integer.parseInt(request.getParameter("rtype"));
			switch(rtype){
			case 1: //
				//Print Results
				pw = response.getWriter();
				pw.print( getChartMonthly(jopt).toString() );
				break;
			default:
				break;
			}
		}else{
			pw.print("No request type set. Function GetChartData");
		}
		
		//;
	}

	protected JSONObject getChartMonthly( JSONObject opts){
		try{
			query = "select 'Total Submission' as dataset,";
			query += "sum(jan) as January,";
			query += "sum(feb) as February,";
			query += "sum(mar) as March,";
			query += "sum(apr) as April,";
			query += "sum(may) as May,";
			query += "sum(jun) as June,";
			query += "sum(jul) as July,";
			query += "sum(aug) as August,";
			query += "sum(sep) as September,";
			query += "sum(oct) as October,";
			query += "sum(nov) as November,";
			query += "sum(dece) as December";
			query +=" FROM "+opts.getString("tablename")+";";
				
			if(opts.has("wherevalue")){
				query = query.replace(";", " ")+"WHERE "+opts.getString("wherecolumn")+" = '"+opts.getString("wherevalue")+"';";
				
				if(opts.has("filtervalue"))
					query = query.replace(";", " ")+"AND "+opts.getString("filtercolumn")+" = '"+opts.getString("filtervalue")+"';";
				
			}else if(opts.has("filtervalue"))
					query = query.replace(";", " ")+"WHERE "+opts.getString("filtercolumn")+" = '"+opts.getString("filtervalue")+"';";
					
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			
			jarr2 = new JSONArray();
			for (int i=2;i<=columns.getColumnCount();i++){
				jarr2.put(columns.getColumnName(i));
			}
			json = new JSONObject();
			json.put("labels", jarr2);
			
			while(rset.next()){
				//Get dataset name
				jobj = new JSONObject();
				jobj.put("name", rset.getObject(1));
				
				//Get dataset values
				jarr3 = new JSONArray();
				for (int i=2;i<=columns.getColumnCount();i++){
					jarr3.put(rset.getObject(i));
				}
				jobj.put("data", jarr3);
			}
			json.put("dataset", jobj);
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
	
	/*
	 * Get chat data
	 * Test button is btn-create-content on the page index.jsp
	 * */
	protected JSONObject getChartData(String squery){
		try{
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(squery);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			
			jarr2 = new JSONArray();
			for (int i=1;i<=columns.getColumnCount();i++){
				jarr2.put(columns.getColumnName(i));
			}
			json = new JSONObject();
			json.put("labels", jarr2);
			
			while(rset.next()){
				
				//Get dataset name
				jobj = new JSONObject();
				jobj.put("name", rset.getObject(1));
				
				//Get dataset values
				jarr3 = new JSONArray();
				for (int i=2;i<=columns.getColumnCount();i++){
					jarr3.put(rset.getObject(i));
				}
				jobj.put("data", jarr3);
			}
			json.put("dataset", jobj);
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
