<!DOCTYPE html>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<center>
		<div class="central-div" style="top:10%">
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="registers"> 
                        
				<table>
					<tr>
						<td colspan="2">
							<center><h2>Register New User</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="First Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" class="text" placeholder="Last Name" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="User Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password" required>
						</td>
					</tr>
                                        <tr>
                                            
                                            <td>
                                                <label>User Type</label>
                                                
                                            </td>
						<td>
                                                    <%
                                                    if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
                                                   %> 
                                                    <input type="text" name="usertype" class="text" placeholder="UserType">
                                                    <%
                                                    }
                                                   %>
						</td>
                                                
                                        </tr>
                                        <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" class="text" placeholder="Contact No" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" class="text" placeholder="City" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" class="text" placeholder="Address" required>
						</td>
					</tr>
					
                                        <tr>
						<td>
							<center>
                                                      
							<input type="submit" value="Register Now" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>