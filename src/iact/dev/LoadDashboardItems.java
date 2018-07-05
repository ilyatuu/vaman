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
 * Servlet implementation class LoadDashboardItems
 */
@WebServlet(description = "Load dashboard items such as tables and graphs. It returns json object", urlPatterns = { "/LoadDashboardItems" })
public class LoadDashboardItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DbConnect db;
	private String query;
	private Connection cnn = null;
	private ResultSet rset = null;
	private ResultSetMetaData columns = null;
	private PreparedStatement pstm = null;
	
	private int rows, userid, rtype;
	private JSONArray jarr;
	private JSONObject json,jobj;
	
	private PrintWriter pw;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadDashboardItems() {
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
		pw = response.getWriter();
		
		if(request.getParameterMap().containsKey("userid")){
			userid = Integer.parseInt(request.getParameter("userid"));
		}
		if(request.getParameterMap().containsKey("rtype")){
			rtype = Integer.parseInt(request.getParameter("rtype"));
		}
		
		switch(rtype){
		case 1:
			pw.print(getDashboardItems2(userid).toString());
			break;
		default:
			pw.print(getDashboardItems(userid).toString());
			break;
		}
	}
	
	protected JSONObject getDashboardItems(int userid){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM view_summary_va;";
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			rows = 0;
			jarr = new JSONArray();
			while(rset.next()){
				rows++;
				JSONArray row = new JSONArray();
				for (int i=1;i<=columns.getColumnCount();i++){
					//json.put( columns.getColumnName(i), rset.getObject(i));
					row.put(rset.getObject(i));
				}
				jarr.put(row);
			}
			json = new JSONObject();
			//Structure data table return
			//json.put("draw", 1);
			//json.put("recordsTotal", rows);
			//json.put("recordsFiltered", rows);
			json.put("data", jarr);
			
			// Get user summary for physicians
			query = "SELECT ";
			query += "COUNT(CASE WHEN c1ucd  = c2ucd THEN 1 END) as concordant,";
			query += "COUNT(CASE WHEN c1ucd != c2ucd THEN 1 END) as discordant ";
			query += "FROM view_individual_va ";
			query += "WHERE c1id = ? OR c2id = ?;";
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, userid);
			pstm.setInt(2, userid);
			rset = pstm.executeQuery();
			if(rset.next()){
				json.put("concordant", rset.getInt("concordant"));
				json.put("discordant", rset.getInt("discordant"));
			}
			
			return json;
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	protected JSONObject getDashboardItems2(int userid){
		try{
			query  = "SELECT * FROM view_summary_va;";
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
					jobj.put( columns.getColumnName(i), rset.getObject(i));
					//System.out.println(columns.getColumnTypeName(i));
				}
				jarr.put(jobj);
			}
			json = new JSONObject();
			json.put("total", rows);
			json.put("rows", jarr);
			
			// Get user summary for physicians
			query = "SELECT ";
			query += "COUNT(CASE WHEN c1ucd  = c2ucd THEN 1 END) as concordant,";
			query += "COUNT(CASE WHEN c1ucd != c2ucd THEN 1 END) as discordant ";
			query += "FROM view_individual_va ";
			query += "WHERE c1id = ? OR c2id = ?;";
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, userid);
			pstm.setInt(2, userid);
			rset = pstm.executeQuery();
			if(rset.next()){
				json.put("concordant", rset.getInt("concordant"));
				json.put("discordant", rset.getInt("discordant"));
			}			
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
}
