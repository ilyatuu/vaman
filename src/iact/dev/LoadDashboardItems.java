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
	private String query,query2,formName,dateColumn;
	private Connection cnn = null;
	private ResultSet rset = null;
	private ResultSetMetaData rcolumns;
	private PreparedStatement pstm = null;
	
	private int userid, rtype;
	private JSONArray jarr,columns;
	private JSONObject json,jobj,jreturn;
	
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
			pw.print(getCoderSummary(userid));
			break;
		case 2:
			formName = request.getParameter("formName");
			dateColumn = request.getParameter("dateColumn");
			columns = new JSONArray(request.getParameter("columns"));
			pw.print(getSummary(formName,dateColumn,columns));
			break;
		default:
			pw.print(getDashboardItems(userid).toString());
			break;
		}
	}
	
	protected JSONObject getSummary(String formName, String dateColumn, JSONArray columns) {
		try{
			
			query  = "select 5 as no,'total' as period,";
			for(Object column:columns) {
				if(column instanceof JSONObject) {
					JSONObject col = (JSONObject) column;
					query += "sum("+col.getString("name")+"::int) as "+col.getString("shortname")+",";
				}
			}
			query = query.substring(0, query.length()-1) + " from "+formName;
			
			
			
			query2 = query.replace("select 5", "select 4").replace("total", "this year") + " where "+dateColumn+"::date > now() - interval '1 year'";
			
			query = query + " union " + query2;
			
			query = query + " union " + query2.replace("select 4", "select 3").replace("this year","this month").replace("1 year","1 month");
			query = query + " union " + query2.replace("select 4", "select 2").replace("this year","this week").replace("1 year","1 week");
			query = query + " union " + query2.replace("select 4", "select 1").replace("this year","today").replace("1 year","1 day");
			query += " order by 1 asc;";
			
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			rcolumns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()) {
				jobj = new JSONObject();
				for (int i=1;i<=rcolumns.getColumnCount();i++){
					jobj.put(rcolumns.getColumnLabel(i), rset.getObject(i));
				}
				jarr.put(jobj);
				
			}
			jreturn = new JSONObject();
			jreturn.put("rows", jarr);
			return jreturn;
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
	protected JSONObject getDashboardItems(int userid){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM view_summary_va;";
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			rcolumns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				JSONArray row = new JSONArray();
				for (int i=1;i<=rcolumns.getColumnCount();i++){
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

	protected JSONObject getCoderSummary(int userid){
		try{
			// Get user summary for physicians
			query  = "select a.fullname, count(*) as assigned,";
			query += "sum(case when (a.id = coder1_id and coder1_coda is not null) or (a.id = coder2_id and coder2_coda is not null) then 1 else 0 end) as coded,";
			query += "sum(case when returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) = returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd) then 1 else 0 end) as concordant,";
			query += "sum(case when returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) != returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd) then 1 else 0 end) as discordant";
			query += " from _web_users a";
			query += " right join _web_assignment b on a.id = b.coder1_id or a.id = b.coder2_id";
			query += " where a.id = ? group by 1;";
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, userid);
			rset = pstm.executeQuery();
			
			if(rset.next()){
				json = new JSONObject();
				json.put("fullname", rset.getString("fullname"));
				json.put("assigned", rset.getInt("assigned"));
				json.put("coded", rset.getInt("coded"));
				json.put("concordant", rset.getInt("concordant"));
				json.put("discordant", rset.getInt("discordant"));
				return json;
			}		
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
