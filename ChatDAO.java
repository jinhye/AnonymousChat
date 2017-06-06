package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {
	private static final String O = "oracle.jdbc.driver.OracleDriver";
	private static final String U = "jdbc:oracle:thin:@localhost:1521:ORCL";
	private static final String I = "scott";
	private static final String P = "tiger";
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ChatDAO(){
		try{		
			Class.forName(O);
			System.out.println("ok one");
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void connect(){
		try{
			con = DriverManager.getConnection(U, I, P);
			System.out.println("ok two");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void disConnect(){
		if(rs != null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}	
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}		
		if(con != null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Chat> getChatList(String nowTime){
		connect();
		String sql = "select * from chat where chatTime > ? order by chatTime";
		ArrayList<Chat> chatList = new ArrayList<>();
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nowTime);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Chat chat = new Chat();
				chat.setChatName(rs.getString("chatName"));
				chat.setChatContent(rs.getString("chatContent"));
				chat.setChatTime(rs.getString("chatTime"));
				chatList.add(chat);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnect();
		}
		return chatList;
	}
	
	public int submit(String chatName, String chatContent){
		connect();
		String sql = "insert into Chat values(?, ?, now())";
		ArrayList<Chat> chatList = new ArrayList<>();
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnect();
		}
		return -1;
	}
}
