<%@page import="myPackage.classes.EditUser"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

                        <% EditUser user=pDAO.getUserDetails(session.getAttribute("userId").toString());%>
<div class="central-div" style="top:10%">
    <link rel="stylesheet" type="text/css" href="style.css">
    <form>
                        <input type="hidden" name="page" value="profile"> 
                        
				<table>
                                    <tr>
						<td colspan="2">
							<center><h2>Edit Profile</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" value="<%=user.getFirstName() %>" class="text" placeholder="First Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" value="<%=user.getLastName() %>" class="text" placeholder="Last Name" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" value="<%=user.getUserName() %>" class="text" placeholder="User Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" value="<%=user.getEmail() %>" class="text" placeholder="Email" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="text" value="<%=user.getPassword() %>" name="pass" class="text" placeholder="Password" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" value="<%=user.getContact() %>" class="text" placeholder="Contact No" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" value="<%=user.getCity() %>" class="text" placeholder="City" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" value="<%=user.getAddress() %>" class="text" placeholder="Address" required>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
                                                            <%
            if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
        %>
        <a href="controller.jsp"><span class="button">Update</span></a>
                                                            <a href="adm-page.jsp?pgprt=0"><span class="button">Back</span></a>
                                                             <%
           }else{
               %>
               <a href="controller.jsp"><span class="button">Update</span></a>
                                                            <a href="std-page.jsp?pgprt=0"><span class="button">Back</span></a>
               <%
           }
		%>	
                                                        </center>
						</td>
					</tr>
				</table>
			</form>
		</div>
                                                