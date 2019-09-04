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
	String query,colname;
	
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
		if(request.getParameterMap().containsKey("notcoded"))	opts.put("notcoded", request.getParameter("notcoded"));
		if(request.getParameterMap().containsKey("discordant"))	opts.put("discordant", request.getParameter("discordant"));
		
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
		case 102:
			pw.print(getVARecords(opts));
			break;
		case 103:
			pw.print(getVAtoAssign(opts));
			break;
		case 104:
			pw.print(getAssignedVA(opts));
			break;
		default:
			pw.print(getBootTable(opts).toString());
			break;
		}
	}
	
	/**
	 * Get assigned VA to a coder
	 * **/
	protected JSONObject getAssignedVA(JSONObject opts) {
		
		if(opts.getString("tablename").equals("none")) {
			json = new JSONObject();
			json.put("total", 0);
			json.put("rows", "");
			return json;
		}
		try {
			query  = " select count(*) from _web_assignment a";
			
			if(opts.has("notcoded")) {
				if(opts.getInt("notcoded") == 1)
					query += " where (coder1_id="+opts.getInt("userId")+" and coder1_coda is null) or (coder2_id="+opts.getInt("userId")+" and coder2_coda is null)";
			}else {
				query += " where (coder1_id="+opts.getInt("userId")+" or coder2_id="+opts.getInt("userId")+")";
			}
			
			
			if(opts.has("discordant")) {
				if(opts.getInt("discordant") == 1) {
					query += " and (coder1_coda is not null and coder2_coda is not null) and (returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) != returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd)) ";
				}
			}
			
			if(opts.has("searchBy") && opts.has("searchVal")) {
				query += " and "+opts.getString("searchBy")+" ilike '%"+opts.getString("searchVal")+"%'";
			}
			
			query += ";";
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			if(rset.next()) {
				rows = rset.getInt(1);
			}
			
			query  = " select a.va_uri,";
			query += " case";
			query += " when a.coder1_id = "+opts.getInt("userId")+" then a.coder1_assigned_date";
			query += " when a.coder2_id = "+opts.getInt("userId")+" then a.coder2_assigned_date";
			query += " end as assigned_date,";
			
			query += " case";
			query += " when a.coder1_id = "+opts.getInt("userId")+" then b.icdname";
			query += " when a.coder2_id = "+opts.getInt("userId")+" then c.icdname";
			query += " else null";
			query += " end as coda,";
			
			query += " case";
			query += " when a.coder1_id = "+opts.getInt("userId")+" then d.icdname";
			query += " when a.coder2_id = "+opts.getInt("userId")+" then e.icdname";
			query += " else null";
			query += " end as codb,";
			
			query += " case";
			query += " when a.coder1_id = "+opts.getInt("userId")+" then f.icdname";
			query += " when a.coder2_id = "+opts.getInt("userId")+" then g.icdname";
			query += " else null";
			query += " end as codc,";
			
			query += " case";
			query += " when a.coder1_id = "+opts.getInt("userId")+" then h.icdname";
			query += " when a.coder2_id = "+opts.getInt("userId")+" then i.icdname";
			query += " else null";
			query += " end as codd,";
			
			query += " a.* ";
			
			query += " from _web_assignment a";
			query += " left join _web_icd10 b on a.coder1_coda = b.id";
			query += " left join _web_icd10 c on a.coder2_coda = c.id";
			query += " left join _web_icd10 d on a.coder1_codb = d.id";
			query += " left join _web_icd10 e on a.coder2_codb = e.id";
			query += " left join _web_icd10 f on a.coder1_codc = f.id";
			query += " left join _web_icd10 g on a.coder2_codc = g.id";
			query += " left join _web_icd10 h on a.coder1_codd = h.id";
			query += " left join _web_icd10 i on a.coder2_codd = i.id";
			
			if(opts.has("notcoded")) {
				if(opts.getInt("notcoded") == 1)
					query += " where (coder1_id="+opts.getInt("userId")+" and coder1_coda is null) or (coder2_id="+opts.getInt("userId")+" and coder2_coda is null)";
			}else {
				query += " where (coder1_id="+opts.getInt("userId")+" or coder2_id="+opts.getInt("userId")+")";
			}
			if(opts.has("discordant")) {
				if(opts.getInt("discordant") == 1) {
					query += " and (coder1_coda is not null and coder2_coda is not null) and (returnUnderline(coder1_coda,coder1_codb,coder1_codc,coder1_codd) != returnUnderline(coder2_coda,coder2_codb,coder2_codc,coder2_codd)) ";
				}
			}
			if(opts.has("searchBy") && opts.has("searchVal")) {
				query += " and "+opts.getString("searchBy")+" ilike '%"+opts.getString("searchVal")+"%'";
			}
			
			if(opts.has("orderBy") && opts.has("orderVal")) {
				query += " order by \""+opts.getString("orderBy")+"\" "+opts.getString("orderVal");
			}
			
			if(opts.has("limit") && opts.has("offset")) {
				query += " limit "+opts.getInt("limit")+" offset "+opts.getInt("offset");
			}
			
			query += ";"; //terminate sql
			
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);	
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					colname = columns.getColumnName(i);
					jobj.put( colname, rset.getObject(i));
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
	/** 
	 * Get VA in order to assign to coder/physician 
	 * **/
	protected JSONObject getVAtoAssign(JSONObject opts) {
		if(opts.getString("tablename").equals("none")) {
			json = new JSONObject();
			json.put("total", 0);
			json.put("rows", "");
			return json;
		}
		try{
			query  = "select count(*) from "+opts.getString("tablename")+";";
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			
			rset = pstm.executeQuery();
			if(rset.next()) {
				rows = rset.getInt(1);
			}
			query = "SELECT ";
			query += "MAX(b.coder1_id) AS coder1_id,";
			query += "MAX(b.coder2_id) AS coder2_id,";
			query += "MAX(c.fullname::text) AS coder1,";
			query += "MAX(d.fullname::text) AS coder2,";
			query += "a.\"_URI\",";
			query += "'"+opts.getString("tablename")+"' AS va_table,";
					
			switch(opts.getString("tablename")) {
			case "\"WHOVAV14TZ_CORE2\"":
				query += "MAX(a.\"RESPONDENT_BACKGR_GROUP_INTERVIEWER_ID10010A\"::text) AS interviewer_name,";
				query += "MAX(a.\"RESPONDENT_BACKGR_GROUP_INTERVIEWER_ID10010B\") AS interviewer_phone,";
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10012\"::date) AS interview_date,";
				query += "MAX(a.\"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057\"::text) AS death_location,";
				query += "MAX(a.\"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_R\"::text) AS death_loc_level1,";
				query += "MAX(a.\"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_D\"::text) AS death_loc_level2,";
				query += "MAX(a.\"CONSNTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057_GRUP_ID10057_V\"::text) AS death_loc_level3,";
				break;
			default:
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10010\"::text) AS interviewer_name,";
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10010_PHONE\") AS interviewer_phone,";
				query += "MAX(a.\"TODAY\"::date) AS interview_date,";
				query += "MAX(a.\"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_ID10057\"::text) AS death_location,";
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10005_R\"::text) AS death_loc_level1,";
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10005_D\"::text) AS death_loc_level2,";
				query += "MAX(a.\"RESPONDENT_BACKGR_ID10005_V\"::text) AS death_loc_level3,";
				break;
			}
			
			query += "CASE";
			query += " WHEN max(a.\"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_CHILD\"::text) = '1'::text THEN 'CHILD'::text";
			query += " WHEN max(a.\"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_NEONATAL\"::text) = '1'::text THEN 'NEONATAL'::text";
			query += " WHEN max(a.\"CONSENTED_DECEASED_CRVS_INFO_ON_DECEASED_IS_ADULT\"::text) = '1'::text THEN 'ADULT'::text";
			query += " ELSE NULL::text ";
			query += "END AS death_category";
			
			query += " FROM "+opts.getString("tablename")+" a";
			query += " LEFT JOIN _web_assignment b ON a.\"_URI\"::text = b.va_uri::text";
			query += " LEFT JOIN _web_users c ON b.coder1_id = c.id";
			query += " LEFT JOIN _web_users d ON b.coder2_id = d.id";
			query += " GROUP BY a.\"_URI\"";
			
			if(opts.has("orderBy") && opts.has("orderVal")) {
				query += " ORDER BY \""+opts.getString("orderBy")+"\" "+opts.getString("orderVal")+" ";
			}
			
			if(opts.has("limit") && opts.has("offset")) {
				query += " LIMIT "+opts.getInt("limit")+" OFFSET "+opts.getInt("offset")+";";
			}
			
			if ( DbConnect.cType == ConnectionType.mySQL ){
				query = query.replace("ilike", "like");
			}
			
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					colname = columns.getColumnName(i);
					jobj.put( colname, rset.getObject(i));
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
	protected JSONObject getVARecords(JSONObject opts) {
		try{
			query  = "select count(*) from "+opts.getString("tablename");
			if(opts.has("searchBy") && opts.has("searchVal")) {
				query += " where "+opts.getString("searchBy")+" ilike '%"+opts.getString("searchVal")+"%';";
			}else {
				query +=";";
			}
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			if(rset.next()) {
				rows = rset.getInt(1);
			}
			query = "select * from "+opts.getString("tablename");
			
			if(opts.has("searchBy") && opts.has("searchVal")) {
				query += " where "+opts.getString("searchBy")+" ilike '%"+opts.getString("searchVal")+"%'";
			}
			
			if(opts.has("orderBy") && opts.has("orderVal")) {
				query += " order by \""+opts.getString("orderBy")+"\" "+opts.getString("orderVal")+" ";
			}
			
			if ( DbConnect.cType == ConnectionType.mySQL ){
				query = query.replace("ilike", "like");
			}
			
			if(opts.has("limit") && opts.has("offset")) {
				query += " limit "+opts.getInt("limit")+" offset "+opts.getInt("offset")+";";
			}
			
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for (int i=1;i<=columns.getColumnCount();i++){
					colname = columns.getColumnName(i);
					
//					if(colname.indexOf("_ID") > 0){
//						colname = colname.substring(colname.indexOf("_ID")+1, colname.length());
//					}
					jobj.put( colname, rset.getObject(i));
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
