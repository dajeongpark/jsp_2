package com.dajeong.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dajeong.util.DBConnector;

public class NoticeDAO {
	
	//insert
	public int insert(NoticeDTO ndto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, ndto.getTitle());
		st.setString(2, ndto.getContents());
		st.setString(3, ndto.getWriter());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//delete
	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
		
	}
	
	//update
	public int update(NoticeDTO ndto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?,contents=?,writer=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, ndto.getTitle());
		st.setString(2, ndto.getContents());
		st.setString(3, ndto.getWriter());
		st.setInt(4, ndto.getNum());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
		
	}		
	
	//selectOne
	public NoticeDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		//st.setString(1, title);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO ndto = new NoticeDTO();
		if(rs.next()) {
			ndto.setNum(rs.getInt("num"));
			ndto.setTitle(rs.getString("title"));
			ndto.setContents(rs.getString("contents"));
			ndto.setWriter(rs.getString("writer"));
			ndto.setReg_date(rs.getDate("reg_date"));
			ndto.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ndto;
		
	}
	
	//selectAll
	public ArrayList<NoticeDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select num,title,writer,reg_date,hit from notice order by num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		NoticeDTO ndto = null;
		
		while(rs.next()) {
			ndto = new NoticeDTO();
			ndto.setNum(rs.getInt("num"));
			ndto.setTitle(rs.getString("title"));
			ndto.setWriter(rs.getString("writer"));
			ndto.setReg_date(rs.getDate("reg_date"));
			ndto.setHit(rs.getInt("hit"));
			ar.add(ndto);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
		
	}

}
