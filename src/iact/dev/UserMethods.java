package iact.dev;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class UserMethods
 */
@WebServlet("/UserMethods")
public class UserMethods extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private JSONObject json,jobj;
	private JSONArray jarr;
	private PrintWriter pw;
	private UserRec user;
	private VA va;
	private int rtype,rows;
	
	private DbConnect db;
	private String query;
	private Connection cnn = null;
	private ResultSet rset = null;
	private PreparedStatement pstm = null;
	ResultSetMetaData columns;
	
	
	private DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Date date = new Date();
	private String sqlDate = df.format(date);
       
	private String recId,tableId,username,password;
	private boolean rememberme;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMethods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Authenticate mobile users
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
			HttpSession session = request.getSession(true);
			
			switch(rtype){
			case 1: //Login
				username = request.getParameter("username");
				password = request.getParameter("password");
				rememberme = Boolean.parseBoolean(request.getParameter("rememberme"));
				
				user = Login(username,password);
				response.setContentType("application/json;charset=utf-8");
                json = new JSONObject();
				if(user.isAuthenticated()){
					
					//Set Session
					
					session.setAttribute("username", user.getUsername());
					session.setAttribute("fullname", user.getFullname());
					session.setAttribute("organization", user.getOrganization());
					session.setAttribute("phone", user.getPhone1());
					session.setAttribute("roleid", user.getRole());
					session.setAttribute("userid", user.getUid());
					session.setMaxInactiveInterval(30*60);
					storeLoginSession(user.getUsername(),session.getId());
					
					json.put("success", true);
					json.put("username", user.getUsername());
					json.put("fullname", user.getFullname());
					json.put("message", user.getMessage());
					json.put("sid", session.getId());
					json.put("roleid", user.getRole());
					
					//If remember me is checked, set cookie
					if(rememberme){
						Cookie c = new Cookie("userid", user.getUsername());
					    c.setMaxAge(24*60*60);
					    response.addCookie(c);
					}
					
				}else{
					json.put("success",false);
					json.put("message", user.getMessage());
				}
				
				System.out.println( user.getMessage() );
				pw = response.getWriter();
                pw.print(json.toString());
                pw.close();
				break;
			case 11: //add user
				user = new UserRec();
				user.setUsername(request.getParameter("uname") );
				user.setPassword( request.getParameter("passwd"));
				user.setRole(Integer.parseInt(request.getParameter("role")));
				user.setFullname(request.getParameter("fullname"));
				user.setPhone1(request.getParameter("phone"));
				user.setOrganization(request.getParameter("org"));
				
				json = new JSONObject();
				if( AddUser(user) ){
					json.put("success", true);
					json.put("message", "User successful added");
					pw.print(json);
				}else{
					json.put("success", false);
					json.put("message", "failed to add user");
					pw.print(json);
				}
				pw.close();
				break;
			case 12://check user if exist
				if(UserExist(request.getParameter("uname"))){
					pw.print(false);
				}else{
					pw.print(true);
				}
				break;
			case 13://list users
				//just print the data. 
				pw.print(ListUsers().toString());
				break;
			case 14: //Update user (this method does not update password)
				user = new UserRec();
				user.setUsername(request.getParameter("update_username") );
				user.setRole(Integer.parseInt(request.getParameter("update_roleid")));
				user.setFullname(request.getParameter("update_fullname"));
				user.setPhone1(request.getParameter("update_phone"));
				user.setOrganization(request.getParameter("update_organization"));
				json = new JSONObject();
				if( UpdateUser(user) ){
					json.put("success", true);
					json.put("message", "User successful updated");
					pw.print(json);
				}else{
					json.put("success", false);
					json.put("message", "failed to udpate user");
					pw.print(json);
				}
				pw.close();
				break;
			case 15://Update user and password
				user = new UserRec();
				user.setUsername(request.getParameter("update_username") );
				user.setPassword( request.getParameter("update_passwd"));
				user.setRole(Integer.parseInt(request.getParameter("update_roleid")));
				user.setFullname(request.getParameter("update_fullname"));
				user.setPhone1(request.getParameter("update_phone"));
				user.setOrganization(request.getParameter("update_organization"));
				json = new JSONObject();
				if( UpdateUserAndPassword(user) ){
					json.put("success", true);
					json.put("message", "User successful updated");
					pw.print(json);
				}else{
					json.put("success", false);
					json.put("message", "failed to udpate user");
					pw.print(json);
				}
				pw.close();
				break;
			case 16: //send message
				json = new JSONObject();
				json.put("msgfrom", request.getParameter("msgfrom"));
				json.put("msgto", request.getParameter("msgto"));
				json.put("msgtxt", request.getParameter("msgtxt"));
				json.put("msgva", request.getParameter("msgva"));
				
				if(InsertMessage(json)){
					pw.print(true);
				}else{
					pw.print(false);
				}
				pw.close();
				break;
			case 17://update profile
				user = new UserRec();
				user.setUsername( request.getParameter("update_username").trim() );
				user.setFullname( request.getParameter("update_fullname").trim() );
				user.setOrganization( request.getParameter("update_organization").trim());
				user.setPhone1( request.getParameter("update_phone").trim());
				json = new JSONObject();
				if( UpdateProfile(user) ){
					json.put("success", true);
					json.put("message", "User successful updated");
					pw.print(json);
				}else{
					json.put("success", false);
					json.put("message", "failed to udpate user");
					pw.print(json);
				}
				pw.close();
				break;
			case 18://update password
				user = new UserRec();
				user.setUsername( request.getParameter("username") );
				user.setPassword( request.getParameter("password1").trim() );
				json = new JSONObject();
				if( UpdatePasswd(user) ){
					json.put("success", true);
					json.put("message", "Password updated");
					pw.print(json);
				}else{
					json.put("success", false);
					json.put("message", "Password update failed");
					pw.print(json);
				}
				pw.close();
				break;
			case 2: //Log out
				session = request.getSession(false);
		        System.out.println("User Logout, "+session.getAttribute("username"));
		        if(session != null){
		            session.invalidate();
		        }
				break;
			case 3: //get VA data
				recId = request.getParameter("uri");
				tableId = request.getParameter("tableid");
				
				va = new VA();
				json = new JSONObject();
				json = va.getVARec(recId,tableId);
				pw.print(json.toString());
				
				break;
			case 31: //assign VA
				System.out.println("Assigning VA document to physician");
				json = new JSONObject();
				json.put("assignType",request.getParameter("assignType"));
				json.put("va_table",request.getParameter("va_table"));
				json.put("coderId", Integer.parseInt(request.getParameter("coderId")));
				json.put("coderType", Integer.parseInt(request.getParameter("coderType")));

				jarr = new JSONArray(request.getParameter("vaids").split(","));
				json.put("vaIds", jarr);
				
				va = new VA();
				va.AssignVA(json);
				
				break;
			case 32: //Assign COD
				System.out.println("Assining CoD for ...");
				json = new JSONObject();
				json.put("vaid", request.getParameter("vaid"));
				json.put("userid", request.getParameter("userid"));
				json.put("coda", request.getParameter("cod_a"));
				json.put("codb", request.getParameter("cod_b"));
				json.put("codc", request.getParameter("cod_c"));
				json.put("codd", request.getParameter("cod_d"));
				json.put("notes", request.getParameter("notes"));
				//System.out.println(json.toString());
				va = new VA();
				va.AssignCoD(json);
				break;
			case 33: //get discordant va
				va = new VA();
				pw.print( va.getDiscordantVA(Integer.parseInt(request.getParameter("coderId"))) );
				break;
			case 34:
				//unassign va
				jobj = new JSONObject();
				jobj.put("coderId", request.getParameter("coderId"));
				jobj.put("coderType", request.getParameter("coderType"));
				if(request.getParameterMap().containsKey("dataarray")){
					jarr = new JSONArray( request.getParameterValues("dataarray") );
					jobj.put("vaIds", jarr);
				}
				va = new VA();
				pw.print(va.UnAssignVA(jobj));
				break;
			case 4: //get ICD10 List
				va = new VA();
				pw.print(va.getICD10List());
				break;
			default:
				break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected UserRec validateMobileLogin(String uname, String upass){
		try{
			UserRec user = new UserRec();
			user.setUsername(uname);
			user.setPassword(upass);
			
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM _web_users WHERE username=? AND password=? AND roleid=?;";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, user.getUsername());
			pstm.setString(2, user.getPassword());
			pstm.setInt(3, 4); //Role 4.Mobile User
			rset = pstm.executeQuery();
			if(rset.next()){
				user.setUsername(rset.getObject("username").toString());
				user.setFullname(rset.getObject("fullname").toString());
				user.setOrganization(rset.getObject("organization")==null ? "" : rset.getObject("organization").toString());
				user.setPhone1( rset.getObject("phone")==null ? "": rset.getObject("phone").toString());
				user.setRole(rset.getInt("roleid"));
				user.setUid(rset.getInt("id"));
				user.setMessage("Successful login for user " + user.getUsername());
				user.setIsAutheticated(true);
			}else{
				user.setIsAutheticated(false);
				user.setMessage("Invalid username or password for user "+user.getUsername());
			}
			
		}catch(SQLException e){
			user.setMessage( "Problem with SQL. Class UserMethods" );
			user.setIsAutheticated(false);
			e.printStackTrace();
			return user;
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
		return user;
	}
	protected UserRec Login(String uname, String upass){
		UserRec user = new UserRec();
		user.setUsername(uname);
		user.setPassword(upass);
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM _web_users WHERE username=? AND password=?;";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, user.getUsername());
			pstm.setString(2, user.getPassword());

			rset = pstm.executeQuery();
			json = new JSONObject();
			
			if(rset.next()){
				user.setUsername(rset.getObject("username").toString());
				user.setFullname(rset.getObject("fullname").toString());
				user.setOrganization(rset.getObject("organization")==null ? "" : rset.getObject("organization").toString());
				user.setPhone1( rset.getObject("phone")==null ? "": rset.getObject("phone").toString());
				user.setRole(rset.getInt("roleid"));
				user.setUid(rset.getInt("id"));
				user.setMessage("Successful login for user " + user.getUsername());
				user.setIsAutheticated(true);
			}else{
				user.setIsAutheticated(false);
				user.setMessage("Invalid username or password for user "+user.getUsername());
			}
		}catch(SQLException e){
			user.setMessage( "Communication link failure. Check if MySQL is running" );
			user.setIsAutheticated(false);
			e.printStackTrace();
			return user;
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
		return user;
	}
	protected boolean InsertMessage(JSONObject msg){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "INSERT INTO _web_messages(msg_from,msg_to,msg_date,msg_text,msg_va) VALUES(?,?,?,?,?)";
			pstm = cnn.prepareStatement(query);
			pstm.setInt(1, msg.getInt("msgfrom"));
			pstm.setInt(2, msg.getInt("msgto"));
			pstm.setTimestamp(3, Timestamp.valueOf(sqlDate));
			pstm.setString(4, msg.getString("msgtxt"));
			pstm.setString(5, msg.getString("msgva"));
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
	protected boolean AddUser(UserRec usr){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "INSERT INTO _web_users(username,fullname,password,phone,roleid,organization) VALUES(?,?,?,?,?,?);";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, usr.getUsername());
			pstm.setString(2, usr.getFullname());
			pstm.setString(3, usr.getPassword());
			pstm.setString(4, usr.getPhone1());
			pstm.setInt(5, usr.getRole());
			pstm.setString(6, usr.getOrganization());
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
	protected boolean UpdateUser(UserRec usr){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "UPDATE _web_users SET fullname=?,phone=?,roleid=?,organization=? WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, usr.getFullname());
			pstm.setString(2, usr.getPhone1());
			pstm.setInt(3, usr.getRole());
			pstm.setString(4, usr.getOrganization());
			pstm.setString(5, usr.getUsername());
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
	protected boolean UpdateProfile(UserRec usr){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "UPDATE _web_users SET fullname=?,phone=?,organization=? WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, usr.getFullname());
			pstm.setString(2, usr.getPhone1());
			pstm.setString(3, usr.getOrganization());
			pstm.setString(4, usr.getUsername());
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
	protected boolean UpdatePasswd(UserRec usr){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "UPDATE _web_users SET password=? WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, usr.getPassword());
			pstm.setString(2, usr.getUsername());
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
	protected boolean UpdateUserAndPassword(UserRec usr){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "UPDATE _web_users SET fullname=?,phone=?,roleid=?,organization=?,password=? WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, usr.getFullname());
			pstm.setString(2, usr.getPhone1());
			pstm.setInt(3, usr.getRole());
			pstm.setString(4, usr.getOrganization());
			pstm.setString(5, usr.getPassword());
			pstm.setString(6, usr.getUsername());
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
	protected boolean UserExist(String uname){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "SELECT * FROM _web_users WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setString(1, uname);
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
	
	protected JSONObject ListUsers(){
		try{
			query  = "select id,fullname,phone,organization,rolename,b.roleid,username,'********' as passwd,lastlogin";
			query += " from _web_users a";
			query += " left join _web_roles b on a.roleid=b.roleid;";
			
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
	protected void storeLoginSession(String username, String sessionId){
		try{
			db = new DbConnect();
			cnn = db.getConn();
			query = "UPDATE _web_users SET lastlogin=?, loginsession=? WHERE username=?";
			pstm = cnn.prepareStatement(query);
			pstm.setTimestamp(1, Timestamp.valueOf(sqlDate));
			pstm.setString(2, sessionId);
			pstm.setString(3, username);
			pstm.executeUpdate();
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
	}
	public static String getHash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
