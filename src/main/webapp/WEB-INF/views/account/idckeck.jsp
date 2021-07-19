<%@ page contentType = "text/html; charset = utf-8" pageEncoding = "utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String loginId = (String) session.getAttribute("sessionId");
	String id = request.getParameter("id");
	int ckeck=-1;
	//db 읽어오기
	String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	Statement state = null;

	try {
		Class.forName(JDBC_DRIVER);
		con = DriverManager.getConnection("jdbc:mysql://blazingcode.asuscomm.com:6000/whoever?serverTimezone=UTC", "whoever", "Whoever12#");
		state = con.createStatement();
		ResultSet rs;
		String sql;

		sql = " SELECT id FROM user ";
		rs = state.executeQuery(sql);

		while (rs.next()) {
			if(rs.getString("id").equals(id)){
				ckeck=1;
			}
		}

		rs.close();
		state.close();
		con.close();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (state != null)
				state.close();
		} catch (SQLException ex1) {

		}
		try {
			if (con != null)
				con.close();
		} catch (SQLException ex1) {

		}
	}
	if(ckeck==1){
%>
	<b><font color="red"> <%=id%> </font>는 이미 사용중인 아이디입니다.</b>
	<form name="checkForm" method="post" action="idcheck.jsp">
	<b>다른 아이디를 선택하세요. </b> <br/> <br/>
	<input type="text" name="id" />
	<input type="submit" value="ID중복확인"/>
	</form>
<%
	}
	else{
%>
	<center>
	<b>입력하신 <font color="red"><%=id%></font>는 <br/>
	사용하실 수 있는 ID입니다.</b>
	<input type="button" value="닫기" onclick="setid()">
	</center>
<%
	}
%>
<script type="text/javascript">
	function setid()
	{
		opener.document.signup_info.id.value="<%=id%>";
		//값이 안바뀜
		window.opener.document.getElementById("idck").text = "아이디 인증이 완료되었습니다.";
		opener.document.getElementById("idck").style.color="blue";
		opener.document.getElementById("signup_id").readOnly = true;
		
		window.self.close();
	}
</script>
