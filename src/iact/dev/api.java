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
 * Servlet implementation class api
 * Type this in the URL in order to access it
 * https://vatools.net/vman/api?key=123456&type=json
 */
@WebServlet("/api")
public class api extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JSONObject jobj,json;
	private JSONArray jarr;
	private PrintWriter pw;
	
	private DbConnect db;
	private String query;
	private Connection cnn = null;
	private ResultSet rset = null;
	private PreparedStatement pstm = null;
	ResultSetMetaData columns;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public api() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			json = new JSONObject();
			response.setContentType("application/json");
			pw = response.getWriter();
			
			if(!request.getParameterMap().containsKey("key")){
				json.put("message", "API Key not provided");
				pw.print(json);
				return;
			}else{
				if(!validAPIKey(request.getParameter("key"))){
					json.put("message", "Invalid API Key");
					pw.print(json);
					return;
				}
			}
			
			if(request.getParameterMap().containsKey("type")){
				switch(request.getParameter("type")){
				case "json":
					pw.print( getCodedVA(false,0,0) );
					break;
				case "xml":
					json.put("message", "xml request");
					pw.print(json);
					break;
				default:
					json.put("message", "invalid request type");
					pw.print(json);
					break;
				}
			}else{
				json.put("message", "no request type specified");
				pw.print(json);
			}
		}catch(Exception e){
			e.printStackTrace();
			json.put("message", e.toString());
			pw.print(json);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected boolean validAPIKey(String api_key){
		try{
			query = "SELECT 1 FROM _web_users WHERE api_key::varchar LIKE ?";
			db = new DbConnect();
			cnn = db.getConn();
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, api_key);
			
			System.out.println(pstm.toString());
			
			rset = pstm.executeQuery();
			if(rset.next()){
				return true;
			}else{
				return false;
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
	protected JSONArray getCodedVA(boolean paging, int iSet,int iPage){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			if(paging){
				query  = "SELECT va_uri,va_table,icdcode,icdname,";
				query += "COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) as icdid ";
				query += "FROM _web_assignment ";
				query += "LEFT JOIN _web_icd10 b on COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) = b.id ";
				query += "WHERE COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) = COALESCE(coder2_codd,coder2_codc,coder2_codb,coder2_coda) ";
				query += "LIMIT "+iSet+" OFFSET "+iSet+"*"+iPage+" ;";
			}else{
				query  = "SELECT va_uri,va_table,icdcode,icdname,";
				query += "COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) as icdid ";
				query += "FROM _web_assignment ";
				query += "LEFT JOIN _web_icd10 b on COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) = b.id ";
				query += "WHERE COALESCE(coder1_codd,coder1_codc,coder1_codb,coder1_coda) = COALESCE(coder2_codd,coder2_codc,coder2_codb,coder2_coda) ";
			}
			
			pstm = cnn.prepareStatement(query);
			rset = pstm.executeQuery();
			columns = rset.getMetaData();
			jarr = new JSONArray();
			while(rset.next()){
				jobj = new JSONObject();
				for(int i=1;i<=columns.getColumnCount();i++){
					jobj.put(columns.getColumnName(i), rset.getObject(i));
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
