<%@ include file="header.jsp" %>  			


<%@page import = "java.util.regex.Pattern"%>
<%!int counter = 0;%>


<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	String rePassword = request.getParameter("rePassword");
	String fullName = request.getParameter("fullName");
	String region = request.getParameter("region");
	String gender = request.getParameter("gender");
	String comment = request.getParameter("comment");
	String agreement = request.getParameter("agreement");
	StringBuilder errorText = new StringBuilder("<ul>");
	boolean isError = false;
	boolean isShownForm = true;
	
if (counter>0) {

	if(login == null || login.isEmpty()) {
		isError = true;
		errorText.append("<li>Login is empty</li>");
	} else {
		if (!Pattern.matches("^(.+)@(.+)$", login)) {
		isError = true;
		errorText.append("<li>Incorrect login: must be valid Email</li>");
		}
	}
	
	if(password == null || password.isEmpty()){
		isError = true;
		errorText.append("<li>Password is empty</li>");
	} else {
		if (!Pattern.matches("(?=.*[A-Z])(?=.*[a-z])(?=(.*\\d){2})[A-Za-z\\d]{8,}", password)) {
		isError = true;
		errorText.append("<li>Password is too weak. It must contain letters, capital letters, minimum 2 digits, minimum length 8</li>");
		}
	}
		
	if(rePassword == null || rePassword.isEmpty()){
		isError = true;
		errorText.append("<li>Retyped password is empty</li>");
	} else {
		if (!rePassword.equals(password)) {
			isError = true;
			errorText.append("<li>Password and retyped password aren't the same</li>");
		}
	}
		
	if(fullName == null || fullName.isEmpty()){
		isError = true;
		errorText.append("<li>Name is empty</li>");
	}
	
	if(region == null || region.isEmpty()){
		isError = true;
		errorText.append("<li>Region is empty</li>");
	} else {
		
		if (!("Lviv".equals(region) || "Kyiv".equals(region) || "Kharkiv".equals(region))){
			isError = true;
			errorText.append("<li>Choose correct region</li>");
		}
	}
	
	if(gender == null || gender.isEmpty()){
		isError = true;
		errorText.append("<li>Choose gender</li>");
	} else {
		if (!("M".equals(gender) || "F".equals(gender))){
			isError = true;
			errorText.append("<li>Choose correct gender</li>");		
		}
	}
	
	if(agreement == null || agreement.isEmpty()){
		isError = true;
		errorText.append("<li>You must check agree checkbox</li>");
	}
	
	errorText.append("</ul>");
	errorText.trimToSize();
	
	if(!isError){
		out.write("Registration successful");
		isShownForm=false;
	}
		
} 
	counter++;
%>


<%
if (isShownForm) {
%>	
	
	<center>
		   <form action="">
			   <table border="0">
				  <tr>
					 <td width="100">Login</td>
					 <td ><input type="email" name="login" value="<%=login!=null ? login:""%>" /></td>
				  </tr>
				  <tr>
					 <td>Password</td>
					 <td><input type="password" name="password" /></td>
				  </tr>
				  <tr>
					 <td>Re-Password</td>
					 <td><input type="password" name="rePassword" /></td>
				  </tr>
				  <tr>
					 <td>Full name</td>
					 <td><input type="text" name="fullName" value="<%=fullName!=null ? fullName:""%>" /></td>
				  </tr>
				  <tr>
					 <td>Region</td>
					 <td>
						 <select name = "region">
						 <option value = "Lviv" <%="Lviv".equals(region) ? "selected":""%>>Lviv region</option>
						 <option value = "Kyiv" <%="Kyiv".equals(region) ? "selected":""%>>Kyiv region</option>
						 <option value = "Kharkiv" <%="Kharkiv".equals(region) ? "selected":""%>>Kharkiv region</option>
						 </select>
					 </td>
				  </tr>
				  <tr>
					 <td>Gender</td>
						<td>
							F <input type="radio" value = "F" name="gender" <%="F".equals(gender) ? "checked":""%>/>
							M <input type="radio" value = "M" name="gender" <%="M".equals(gender) ? "checked":""%>/>
						</td>
				  </tr>
				  <tr>
					 <td>Comment</td>
						<td>
							<textarea cols = "10" rows = "5" name = "comment"><%=comment!=null ? comment:""%></textarea>
						</td>
						
						
						<%if (isError) {
						 out.write("<td>"+errorText.toString()+"</td>");
					 } 
						 %>
						 
				  </tr>
				  <tr>
					 <td>I agree to terms</td>
						<td>
							<input type="checkbox" name="agreement"/>
						</td>
				  </tr>
				  <tr>
					 <td align="center" colspan="2"><input type="submit" value="Send" /></td>
				  </tr>
			   </table>
		   </form>
	  </center>

<%	
}
%>
   
<%@ include file="footer.jsp" %>  

				
				
				
				
                
			  
