package iact.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class GetTable
 */
@WebServlet("/GetTable")
public class GetTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String tablename;
	private String query;
	private DbConnect db;
	private Connection cnn = null;
	private PreparedStatement pstm = null;
	private ResultSet rset = null;
	
	PrintWriter pw;
	JSONObject json;
	
	//Data Tables
	int start;
	int length;
	int draw;
	int rectotals;
	String search;
	
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public GetTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		pw = response.getWriter();
		pw.print(getTable("\"VAWHO20161103V10_CORE\""));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		json = new JSONObject();
		pw = response.getWriter();
		response.setContentType("application/json");
		
		if(request.getParameterMap().containsKey("start")){
			start = Integer.parseInt(request.getParameter("start"));
		}
		if(request.getParameterMap().containsKey("length")){
			length = Integer.parseInt(request.getParameter("length"));
		}
		
		if(request.getParameterMap().containsKey("draw")){
			draw = Integer.parseInt(request.getParameter("draw"));
		}
		if(request.getParameterMap().containsKey("search[value]")){
			search = request.getParameter("search[value]");
			System.out.println("Search is "+search);
		}
		
		if(request.getParameterMap().containsKey("searchBy")){
			tablename = request.getParameter("searchBy");
			System.out.println("searchBy is "+tablename);
		}
		
		if(request.getParameterMap().containsKey("searchVal")){
			tablename = request.getParameter("searchVal");
			System.out.println("searchVal is "+tablename);
		}
		
		tablename = "view_individual_va";
		
		JSONObject obj = getDataTable(tablename);
		pw.print(obj.toString());
		
		//if(request.getParameterMap().containsKey("tablename")){
		//	tablename = request.getParameter("tablename");
		//	System.out.println("tablename is "+tablename);
		//	//pw.print(getTable(tablename));
		//}else{
		//	json.put("error", true);
		//	json.put("message", "parameter tablename is not found, please specify this parameter");
		//	pw.print(json.toString());
		//}
		
	}
	protected JSONObject getTable(String tablename){
		JSONObject jtable = new JSONObject();
		jtable.put("tablename", tablename);
		
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM "+tablename;
			
			if(search.isEmpty()){
				query+=" WHERE ";
			}
			
			//pagination
			query += " limit "+length+" offset "+start+";";
			pstm = cnn.prepareStatement(query);
			System.out.println(pstm.toString());
			
			rset = pstm.executeQuery();
			java.sql.ResultSetMetaData columns = rset.getMetaData();
			
			JSONArray jarr = new JSONArray();
			for (int i=1;i<=columns.getColumnCount();i++){
				jarr.put(columns.getColumnName(i));
			}
			jtable.put("columns", jarr);
			
			int row=0;
			JSONArray jrows = new JSONArray();
			while(rset.next()){
				row++;
				jarr = new JSONArray();
				for (int i=1;i<=columns.getColumnCount();i++){
					jarr.put( rset.getObject(i));
				}
				jrows.put(jarr);
				//jtable.put("data", jarr);
			}
			
			JSONObject jtable1 = new JSONObject();
			
			jtable.put("success", true);
			jtable1.put("data", jrows);
			jtable1.put("recordTotal", row);
			jtable1.put("draw", 1);
			jtable1.put("recordFiltered", row);
			jtable.put("datatable",jtable1);
			return jtable;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	protected JSONObject getDataTable(String tablename){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			
			//Get total records
			query = "SELECT count(*) FROM "+tablename;
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			if(rset.next()){
				rectotals = Integer.parseInt((rset.getObject(1).toString()));
			}
			
			query = "SELECT * FROM "+tablename;
			//pagination
			query += " limit "+length+" offset "+start+";";
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			java.sql.ResultSetMetaData columns = rset.getMetaData();
			JSONArray jarr = new JSONArray();
			//int row=0;
			JSONArray jrows = new JSONArray();
			while(rset.next()){
				//row++;
				jarr = new JSONArray();
				for (int i=1;i<=columns.getColumnCount();i++){
					jarr.put( rset.getObject(i));
				}
				jrows.put(jarr);
			}
			
			JSONObject jtable = new JSONObject();
			jtable.put("draw", draw);
			jtable.put("recordsTotal", rectotals);
			jtable.put("recordsFiltered", rectotals);
			jtable.put("data", jrows);	
			return jtable;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
