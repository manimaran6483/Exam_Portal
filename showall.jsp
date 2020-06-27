    <%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<head>
    <title>Online Examination System</title>
    <link rel="stylesheet" type="text/css" href="style-backend.css">
    
</head>

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>

					<div class="left-menu">
						<a  href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
                                                <a class="active" href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
						<a href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
					</div>
				</div>
			</div>
            <!-- CONTENT AREA -->
            
                <div class="content-area">
                            
                            <div class="panel" style="max-width: 1000px;float:left">
                                <div class="title">
                                   All Questions
                                </div>
                                <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px" cellpadding="30">
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
            <th scope="col">Correct Option</th>
            <th scope="col">Question No</th>
            <th scope="col">Course</th>
            <th scope="col">Question</th>    
            <th scope="col">Option1</th>
            <th scope="col">Option2</th>
            <th scope="col">Option3</th>
            <th scope="col">Option4</th>
            <th scope="col">Delete</th>
            
            
            
        </tr>
    </thead>
    
                                       
        <% 
            ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
            for(int i=0;i<list.size();i=i+1){
                Questions questions=(Questions)list.get(i);
        %>
        <tr>
        <td><%=questions.getCorrect()%></td>
        <td><%=questions.getQuestionId()%></td>
        <td><%=questions.getCourseName()%></td>        
        <td><%=questions.getQuestion()%></td>
        <td><%=questions.getOpt1()%></td>
        <td><%=questions.getOpt2()%></td>
        <td><%=questions.getOpt3()%></td>
        <td><%=questions.getOpt4()%></td>
        
        
        <td><a  href="controller.jsp?page=courses&operation=del&cname=<%=list.get(i)%>" 
                onclick="return confirm('Are you sure you want to delete this question?');" class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
            </a></td>
    
            <%
            }
            %>
                                </tr>
                            </table>
        </div>
            </div>
                                 