package iact.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class GetDataTable
 */
@WebServlet("/GetDataTable")
public class GetDataTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	JSONObject json,jobj;
	JSONArray jarr,jdata;
	DbConnect db;
	Connection cnn = null;
	PreparedStatement pstm = null;
	ResultSet rset = null;
	ResultSetMetaData columns; 
	
	//Data Tables
	int start;
	int length;
	int draw,rows,filtered;
	
	String query;
	String tablename;
	String searchBy;
	String searchVal;
	String order[];
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDataTable() {
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
		try{
			if(request.getParameterMap().containsKey("tablename")){
				tablename = request.getParameter("tablename");
			}
			query = "SELECT * FROM "+tablename;
			
			//Prepare database connection
			db = new DbConnect();
			cnn = db.getConn();
			rows = getRecordCount(cnn,query.replace("*", "COUNT(*)"));
			
			//Apply filter if exist
			if(request.getParameterMap().containsKey("searchBy")){
				if(request.getParameterMap().containsKey("searchVal")){
					searchBy = request.getParameter("searchBy");
					searchVal = request.getParameter("searchVal");
					if(!searchVal.isEmpty() && !searchBy.equalsIgnoreCase("searchby")){
						query += " WHERE "+searchBy;
						query += " like '%"+searchVal+"%'";
						filtered = getRecordCount(cnn,query.replace("*", "COUNT(*)"));
					}else{
						filtered = rows;
					}
				}
			}
			
			//Apply order by if exist
			for(Entry<String, String[]> entry:request.getParameterMap().entrySet()){
				String name = entry.getKey();
				String value = entry.getValue()[0];
				
				System.out.println("name = " + name);
				System.out.println("value = " + value);
			}
			
			if(request.getParameterMap().containsKey("order[0]")){
				System.out.println("sort");
				order= request.getParameterValues("order");
				if(order.length==1){
					query += " ORDER BY "+request.getParameter("order[0]") + " " + request.getParameter("order[0][dir]");
				}else{
					for(int i=0;i<order.length;i++){
						query += " ORDER BY "+request.getParameter("order["+i+"]") + " " + request.getParameter("order["+i+"][dir]") + ",";
					}
					query = query.substring(0,query.length() - 1); //remove the last comma
				}
				
			}
			
			// Apply pagination
			if(request.getParameterMap().containsKey("length")){
				length = Integer.parseInt(request.getParameter("length"));
				query = query + " limit "+length;
			}
			
			if(request.getParameterMap().containsKey("start")){
				start = Integer.parseInt(request.getParameter("start"));
				query = query + " offset "+start;
			}
			
			query += ";";//Complete the SQL
			
			//Get the draw
			if(request.getParameterMap().containsKey("draw")){
				draw = Integer.parseInt(request.getParameter("draw"));
			}
			
			//Get data
			
			//Set DataTable Return
			jobj = new JSONObject();
			jobj.put("draw", draw);
			jobj.put("recordsTotal", rows);
			jobj.put("recordsFiltered", filtered);
			jobj.put("data", getData(cnn,query));
			
			//Print
			pw = response.getWriter();
			pw.print(jobj.toString());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	protected int getRecordCount(Connection con, String input_query){
		try{
			pstm=con.prepareStatement(input_query);
			rset=pstm.executeQuery();
			if(rset.next()){
				return rset.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	protected JSONArray getData(Connection con, String input_query){
		try{
			pstm = con.prepareStatement(input_query);
			rset = pstm.executeQuery();
			
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				json = new JSONObject();
				for(int i=1;i<=columns.getColumnCount();i++){
					json.put(columns.getColumnName(i), rset.getObject(i));
				}
				jarr.put(json);
			}
			return jarr;
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
