
<%@ include file="header.jsp" %>  				
				
<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
%>

<% 
	if(startTime != null && time - Duration.between(startTime, LocalDateTime.now()).getSeconds() < 0) {
		count = 0;
		startTime = null;
	}
	
	out.write("Count: " + count);
	if(count < 3){
		if (login != null) {
		   if ("admin".equals(login) && "123".equals(password)) {
			  out.write("Access granted");
		   } else {
			  count++;
			  if(count == 3){
				 startTime = LocalDateTime.now();
			  }
			  out.write("Access denied");
		   }
		}
	%>   
	   <center>
		   <form action="">
			   <table border="0">
				  <tr>
					 <td width="100">Login</td>
					 <td ><input type="text" name="login" /></td>
				  </tr>
				  <tr>
					 <td>Password</td>
					 <td><input type="text" name="password" /></td>
				  </tr>
				  <tr>
					 <td align="center" colspan="2"><input type="submit" value="Send" /></td>
				  </tr>
			   </table>
		   </form>
	   </center>
<%
}else{
	out.write(" " + (time - Duration.between(startTime, LocalDateTime.now()).getSeconds()));
}
%>
 
<%@ include file="footer.jsp" %>  

				
				
				
				
                
			  
