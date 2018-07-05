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
    
	private JSONObject jobj,json;
	private JSONArray jarr;
	private PrintWriter pw;
	private int rtype,rows;
	
	private DbConnect db;
	private String query;
	private Connection cnn = null;
	private ResultSet rset = null;
	private PreparedStatement pstm = null;
	ResultSetMetaData columns;
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
	protected JSONObject getSummaryOfCoding(){
		try{
			query  = "SELECT * FROM view_summary_coding;";
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
