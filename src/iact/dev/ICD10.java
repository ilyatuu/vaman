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
 * Servlet implementation class ICD10
 */
@WebServlet("/ICD10")
public class ICD10 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	int rtype,rows;
	VA va;
	
	String sql;
	DbConnect db;
	Connection cnn = null;
	PreparedStatement pstm = null;
	ResultSet rset = null;
	ResultSetMetaData columns;
	JSONArray jarr;
	JSONObject jobj,json;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ICD10() {
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
			
			switch(rtype){
			case 1:	//get ICD10 list
				va = new VA();
				pw.print(va.getICD10List());
				break;
			case 2://get local ICD10 list
				pw.print( listICD10() );
				break;
			case 3://add ICD10
				json = new JSONObject();
				json.put("icd10code", request.getParameter("icd10code"));
				json.put("icd10name", request.getParameter("icd10name"));
				json.put("icd10category", request.getParameter("icd10category"));
				
				if(addICD10(json)){
					pw.print(true);
				}else{
					pw.print(false);
				}
				pw.close();
				
				break;
			case 4://check exists
				if(checkExist(request.getParameter("icdcode"))){
					pw.print(false);
				}else{
					pw.print(true);
				}
				break;
			}
		}catch(Exception e){
			
		}
	}
	
	protected JSONObject listICD10(){
		try{
			sql  = "SELECT id,icdname,icdcode,concat(icdcode,' | ',icdname) as icdlabel ";
			sql += "FROM _web_icd10;";
			
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(sql);
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
	
	/*
	 * Return BoostrapTable structure. Currently not used
	 * */
	protected JSONObject getICD10(){
		
		try{
			db = new DbConnect();
			cnn = db.getConn();
			
			sql = "SELECT COUNT(*) FROM _web_icd10;";
			pstm = cnn.prepareStatement(sql);
			rset = pstm.executeQuery();
			if(rset.next()){
				rows = rset.getInt(1);
			}
			
			sql  = "SELECT id,icdname,icdcode,concat(icdcode,' | ',icdname) as icdlabel ";
			sql += "FROM _web_icd10;";
			
			pstm = cnn.prepareStatement(sql);
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
	
	protected boolean addICD10(JSONObject rec){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			sql = "INSERT INTO _web_icd10(icdcode,icdname,category_id) VALUES(?,?,?)";
			pstm = cnn.prepareStatement(sql);
			pstm.setString(1, rec.getString("icd10code"));
			pstm.setString(2, rec.getString("icd10name"));
			pstm.setInt(3, rec.getInt("icd10category"));
			if(pstm.executeUpdate()==1){
				return true;
			}
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
		return false;
	}
	protected boolean checkExist(String icdcode){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			sql = "SELECT * FROM _web_icd10 WHERE icdcode=?";
			pstm = cnn.prepareStatement(sql);
			pstm.setString(1, icdcode);			
			rset = pstm.executeQuery();
			if(rset.next()){
				return true;
			}else{
				return false;
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
		return true;
	}
}
