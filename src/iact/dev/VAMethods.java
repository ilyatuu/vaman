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
 * Servlet implementation class VAMethods
 */
@WebServlet("/VAMethods")
public class VAMethods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private JSONObject jobj,json,opts;
	private JSONArray jarr,jcols,tblColumns;
	private PrintWriter pw;
	private int rtype,rows;
	
	private DbConnect db;
	private String query,tblName,colDate,colIntv;
	private Connection cnn = null;
	private ResultSet rset = null;
	private PreparedStatement pstm = null;
	ResultSetMetaData columns;
	
	private iact.dev.VA vas;
	
	int fYear;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VAMethods() {
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
		try{
			response.setContentType("application/json");
			pw = response.getWriter();
			rtype = Integer.parseInt(request.getParameter("rtype"));
			
			jobj = new JSONObject();
			if(request.getParameterMap().containsKey("vaid"))		jobj.put("vaid",request.getParameter("vaid"));
			if(request.getParameterMap().containsKey("coderid"))	jobj.put("coderid",request.getParameter("coderid"));
			if(request.getParameterMap().containsKey("codertype"))	jobj.put("codertype",request.getParameter("codertype"));
			if(request.getParameterMap().containsKey("colname"))	jobj.put("colname",request.getParameter("colname"));
			if(request.getParameterMap().containsKey("colvalue"))	jobj.put("colvalue",request.getParameter("colvalue"));
			if(request.getParameterMap().containsKey("newvalue"))	jobj.put("newvalue",request.getParameter("newvalue"));
			if(request.getParameterMap().containsKey("tablename"))	jobj.put("tablename",request.getParameter("tablename"));
			if(request.getParameterMap().containsKey("colname"))	jobj.put("colname",request.getParameter("colname"));
			
			if(request.getParameterMap().containsKey("dataarray[]")){
				jarr = new JSONArray( request.getParameterValues("dataarray[]") );
				jobj.put("dataarray", jarr);
			}
			
			switch(rtype){
			case 16:
				pw.print(getSummaryOfCoding());
				break;
			case 17:
				pw.print( SelectVAMessages( request.getParameter("vaid") ) );
				break;
			case 21://Update _web_assigmnets COD Values
				if(UpdateCoDInfo(jobj)){
					pw.print(true);
				}
				break;
			case 31:
				//Update interviewer name on the VA
				if(UpdateInterviewerNameOnVA(jobj)){
					pw.print(true);
				}
				break;
			case 41:
				//get ODK Forms
				pw.print(getODKForms());
				break;
			case 42:
				opts = new JSONObject(request.getParameter("data"));
				pw.print(getLocationTree(opts));
				break;
			case 51:
				
				tblName = request.getParameter("tblName");
				tblColumns = new JSONArray(request.getParameter("tblColumns"));
				colDate = request.getParameter("searchBy");
				colIntv = request.getParameter("colIntv");
				fYear = Integer.parseInt(request.getParameter("searchVal"));
				
				opts = new JSONObject();
				opts.put("limit", Integer.parseInt(request.getParameter("limit")));
				opts.put("offset", Integer.parseInt(request.getParameter("offset")));
				
				if(request.getParameterMap().containsKey("orderVal")){
					opts.put("orderBy", request.getParameter("orderBy"));
					opts.put("orderVal", request.getParameter("orderVal"));
				}
				if(request.getParameterMap().containsKey("searchInt")) {
					opts.put("searchInt", request.getParameter("searchInt"));
				}
				
				pw.print(getInterviwerSubmission(tblName,colIntv,colDate,tblColumns, fYear,opts));
				break;
			case 61:
				tblName = request.getParameter("tblName");
				rows = Integer.parseInt(request.getParameter("limitTo"));
				vas = new VA();
				
				JSONObject json = new JSONObject();
				
				
				json.put("all", vas.getCodedVA(tblName, "all", rows));
				json.put("adults", vas.getCodedVA(tblName, "adults", rows));
				json.put("children", vas.getCodedVA(tblName, "children", rows));
				json.put("neonates", vas.getCodedVA(tblName, "neonates", rows));
				
				//System.out.print(json);
				
				pw.print(json);
				break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pw.close();
		}
	}
	protected boolean UpdateInterviewerNameOnVA(JSONObject data) throws SQLException{
		try{
			db = new DbConnect();
			cnn = db.getConn();
			cnn.setAutoCommit(false);
			query = "UPDATE "+data.getString("tablename")+" SET "+data.getString("colname")+"=? "
					+ "WHERE "+data.getString("colname")+"=?;";
			pstm = cnn.prepareStatement(query);
			
			for(int i=0;i < jarr.length();i++){
				pstm.setString(1, data.getString("newvalue"));
				pstm.setString(2, data.getJSONArray("dataarray").getString(i));
				pstm.addBatch();
			}
			pstm.executeBatch();
			cnn.commit();
			return true;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			cnn.rollback();
			return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
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
	}
	protected boolean UpdateCoDInfo(JSONObject updateInfo) throws SQLException{
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query  = "UPDATE _web_assignment SET "+updateInfo.getString("colname")+"=? ";
			query += "WHERE va_uri=? AND "+updateInfo.getString("codertype")+"=?";
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, updateInfo.getInt("colvalue"));
			pstm.setString(2, updateInfo.getString("vaid"));
			pstm.setInt(3, updateInfo.getInt("coderid"));
			System.out.println(pstm.toString());
			if(pstm.executeUpdate()==1){
				return true;
			}
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return false;
		}catch(Exception e){
			e.printStackTrace();
			return false;
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
		return false;
	}
	protected JSONObject getLocationTree(JSONObject opts) {
		try{
			
			jcols = opts.getJSONArray("death_loc_columns");
			
			db = new DbConnect();
			cnn = db.getConn();
			
			
			for(int level = jcols.length();level>0;level--) {
				switch(level) {
				case 0:
					query  = "select distinct "+jcols.getString(level)+" from "+opts.getString("formname")+";";
					pstm = cnn.prepareStatement(query);
					rset = pstm.executeQuery();
					break;
				case 1:
					break;
				case 2:
					query  = "select distinct "+
								jcols.getString(level)+","+jcols.getString(level-1)+
								" from "+opts.getString("formname")+";";
					pstm = cnn.prepareStatement(query);
					rset = pstm.executeQuery();
					break;
				}
				
			}	
			while(rset.next()){
				rows++;
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					jobj.put( columns.getColumnName(i), rset.getObject(i));
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
	protected JSONArray getODKForms() {
		try{
			query  = "SELECT DISTINCT \"PERSIST_AS_TABLE_NAME\" FROM _form_data_model where \"PERSIST_AS_TABLE_NAME\" like '%CORE%';";
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				jobj.put("name", rset.getString(1));
				jarr.put(jobj);
			}
			return jarr;
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
	
	protected JSONObject getInterviwerSubmission(String tblName,String colIntv, String dateCol, JSONArray tblColumns, int intvYear,JSONObject opts) {
		try{
			
			query  = "select count(distinct "+colIntv+") from "+tblName+" ";
			query += "where extract(year from "+dateCol+")="+intvYear+";";
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			json = new JSONObject();
			while(rset.next()) {
				json.put("total", rset.getInt(1));
			}
			
			query  = "select ";
			for(Object column:tblColumns) {
				if(column instanceof JSONObject) {
					JSONObject col = (JSONObject) column;
					query += col.getString("name")+" as "+col.getString("shortname")+",";
				}
			}
			query += "sum(case when extract(month from "+dateCol+") = 1 then 1 else 0 end) \"jan\",";
			query += "sum(case when extract(month from "+dateCol+") = 2 then 1 else 0 end) \"feb\",";
			query += "sum(case when extract(month from "+dateCol+") = 3 then 1 else 0 end) \"mar\",";
			query += "sum(case when extract(month from "+dateCol+") = 4 then 1 else 0 end) \"apr\",";
			query += "sum(case when extract(month from "+dateCol+") = 5 then 1 else 0 end) \"may\",";
			query += "sum(case when extract(month from "+dateCol+") = 6 then 1 else 0 end) \"jun\",";
			query += "sum(case when extract(month from "+dateCol+") = 7 then 1 else 0 end) \"jul\",";
			query += "sum(case when extract(month from "+dateCol+") = 8 then 1 else 0 end) \"aug\",";
			query += "sum(case when extract(month from "+dateCol+") = 9 then 1 else 0 end) \"sep\",";
			query += "sum(case when extract(month from "+dateCol+") = 10 then 1 else 0 end) \"oct\",";
			query += "sum(case when extract(month from "+dateCol+") = 11 then 1 else 0 end) \"nov\",";
			query += "sum(case when extract(month from "+dateCol+") = 12 then 1 else 0 end) \"dec\" ";
			query += " from "+tblName;
			query += " where extract(year from "+dateCol+")=?";
			
			if(opts.has("searchInt")) {
				query += " and "+colIntv+" ilike '%"+opts.getString("searchInt")+"%'";
			}
			query += " group by 1,2,3 ";
			
			if(opts.has("orderBy")) {
				query += "order by "+opts.getString("orderBy")+" "+opts.getString("orderVal");
			}
			
			query += " limit "+opts.getInt("limit")+" offset "+opts.getInt("offset")+";";
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, intvYear);
			
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					jobj.put( columns.getColumnName(i), rset.getObject(i));
				}
				jarr.put(jobj);
			}
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
	protected JSONObject getSummaryOfCoding() {
		try{
			query  = "select a.fullname, count(*) as assigned,";
			query += "sum(case when (a.id = coder1_id and coder1_coda is not null) or (a.id = coder2_id and coder2_coda is not null) then 1 else 0 end) as coded,";
			query += "sum(case when returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) = returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd) then 1 else 0 end) as concordant,";
			query += "sum(case when returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) != returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd) then 1 else 0 end) as discordant";
			query += " from _web_users a";
			query += " right join _web_assignment b on a.id = b.coder1_id or a.id = b.coder2_id";
			query += " group by 1;";
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
	protected JSONArray SelectVAMessages(String vaid){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query  = "SELECT a.id,a.msg_from,b.fullname as fromId,a.msg_to,c.fullname as toId,msg_text,msg_va,msg_date ";
			query += "FROM _web_messages a ";
			query += "LEFT JOIN _web_users b ON a.msg_from = b.id ";
			query += "LEFT JOIN _web_users c ON a.msg_to = c.id ";
			query += " WHERE msg_va = ?;";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, vaid);
			rset = pstm.executeQuery();
			
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					jobj.put( columns.getColumnName(i), rset.getObject(i));
				}
				jarr.put(jobj);
			}
			return jarr;
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
