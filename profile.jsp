<%@page import="myPackage.classes.EditUser"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<%
           EditUser user=pDAO.getUserDetails(session.getAttribute("userId").toString());
            if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
        %>
         <!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a class="active" href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;">
        
                                
        
            <%
           }else{
               %>
               
               <!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>
					<div class="left-menu">
						<a class="active" href="std-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;">
               <%
           }
           if(request.getParameter("pedt")==null){
           
               %>
           <div class="title">Profile</div>
           <div class="profile ">
               <div>
               <table id="one-column-emphasis" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
        <tr>
            <th>Your Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>City</th>
            <th>Address</th> 
        </tr>
    </thead>
    <tbody>
            <td><%=user.getFirstName()+" " %><%=user.getLastName() %></td>
            <td><%=user.getEmail() %></td>
            <td><%=user.getContact() %></td>
            <td><%=user.getCity() %></td>
            <td><%=user.getAddress() %></td>
    </tbody>
               </table>
               </div>
               <%
               if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
               %>
               <br/>
               <a href="edit-user.jsp"><span class="add-btn">Edit Profile</span></a>
               <% 
               }else{
               %><br/>
               <a href="edit-user.jsp"><span class="add-btn">Edit Profile</span></a>
               <% 
               }
               %>
           
           <%
           }
               %>
              
    
        </div>
    </div>