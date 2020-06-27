<%@page import="myPackage.classes.Exams"%>
<%@page import="myPackage.classes.Questions"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>

<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Examination System
					</h2>
					<div class="left-menu">
						<a  href="std-page.jsp?pgprt=0"><h2>Profile</h2></a>
						<a class="active" href="std-page.jsp?pgprt=1"><h2>Exams</h2></a>
						<a  href="std-page.jsp?pgprt=2"><h2>Results</h2></a>
					</div>
				</div>
		
                       </div>
               <!-- CONTENT AREA -->
			<div class="content-area">   
    
        <%
           if(session.getAttribute("examStarted")!=null){
               if(session.getAttribute("examStarted").equals("1")){  
                %>
               <form id="myform" action="controller.jsp">
                   
                   <%
                       ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
                       Questions question;
                       %>
                       <input type="hidden" name="size" value="<%=list.size()%>">
                       <input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">

                       <%
                       for(int i=0;i<list.size();i++){
                           question=(Questions)list.get(i);
                       %>                               
                       <center>
					<div class="question-panel">
						<div class="question" >
						<label class="question-label"><%=i+1 %></label>
						<%=question.getQuestion() %>
                                                </div>
						<div class="answer">
                                                    
							<input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/>
							<label for="c1<%=i%>"><%=question.getOpt1()%></label>
							<input type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" />
							<label for="c2<%=i%>"><%=question.getOpt2()%></label>
							<input type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" />
							<label for="c3<%=i%>"><%=question.getOpt3()%></label>
							<input type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/>
							<label for="c4<%=i%>" ><%=question.getOpt4()%></label>							
						</div>
					</div>
                       <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                       <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">
                       <%
                       }                       
                       %>   
                   <input type="hidden" name="page" value="exams">
                   <input type="hidden" name="operation" value="submitted"> 
                   <input type="submit" class="add-btn" value="Done">
               </form>
    <%
               }
           }
           else if(request.getParameter("showresult")!=null){%>
        
                            <%
               if(request.getParameter("showresult").equals("1")){
                  Exams result= pDAO.getResultByExamId(Integer.parseInt(session.getAttribute("examId").toString()));
           %>
           
           
           <div class="panel" style="float: left;max-width: 900px">
           <div class="title">Result of Recent Exam</div>
           <div class="profile">
               <span class="tag">Exam Date</span><span class="val"><%=result.getDate() %></span><br/>
               <span class="tag">Start Time</span><span class="val"><%=result.getStartTime() %></span><br/>
               <span class="tag">End Time</span><span class="val"><%=result.getEndTime() %></span><br/>
               <span class="tag">Course Name</span><span class="val"><%=result.getcName() %></span><br/>
               <span class="tag">Obt Marks</span><span class="val"><%=result.getObtMarks() %></span><br/>
               <span class="tag">Total Marks</span><span class="val"><%=result.gettMarks() %></span><br/>
               <span class="tag">Result</span><span class="val"><%=result.getStatus() %></span></h2>
           </div>
           <p></p>
           <p></p>
           <p></p>
           <p></p>
           <p></p>
           </div>
           <%
           }
           }else if(session.getAttribute("examStarted")==null ){
        %>
        <div class="panel form-style-6" style="float: left;max-width: 900px; padding-top: 40px;">
            <div class="title" style="margin-top: -60px;">Select Course to Take Exam</div>
       <br/>
           
               <form action="controller.jsp">
                   <br/><br>
                <label>Select Course</label>
                <input type="hidden" name="page" value="exams">
                <input type="hidden" name="operation" value="startexam">
                <select name="coursename" class="text">
        <% 
            ArrayList list1=pDAO.getAllCourses();
            
            for(int i=0;i<list1.size();i=i+2){
        %>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
            <%
            }
            %>
            </select>
            <input type="submit" value="Take Exam" class="form-button">
            </form>
         
        </div>
       <% }%>
    
</div>
       