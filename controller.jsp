    
<%@page import="java.time.LocalTime"%>
<%@page import="myPackage.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<%
    
if(request.getParameter("page").toString().equals("login")){
if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString())){
    session.setAttribute("userStatus", "1");
    session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
    response.sendRedirect("dashboard.jsp");

}else{
    request.getSession().setAttribute("userStatus", "-1");
    response.sendRedirect("login.jsp");
}

}else if(request.getParameter("page").toString().equals("register")){
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
     
    pDAO.addNewStudent(fName,lName,uName,email,pass,contactNo,city,address);
    response.sendRedirect("std-page.jsp?pgprt=1");  
}
else if(request.getParameter("page").toString().equals("registers")){
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        String usertype=request.getParameter("usertype");
    pDAO.addNewAdmin(fName,lName,uName,email,pass,usertype,contactNo,city,address);
    response.sendRedirect("adm-page.jsp?pgprt=1");  
}else if(request.getParameter("page").toString().equals("questions")){
    if(request.getParameter("operation").toString().equals("addnew")){
        String question=request.getParameter("question");
        String coursename=request.getParameter("coursename");
        String opt1=request.getParameter("opt1");
        String opt2=request.getParameter("opt2");
        String opt3=request.getParameter("opt3");
        String opt4=request.getParameter("opt4");
        String correct=request.getParameter("correct");
        int qid=Integer.parseInt(request.getParameter("questionid"));
        pDAO.addQuestion(coursename, question, opt1, opt2, opt3, opt4, correct, qid);
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=3");
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO.delQuestion(Integer.parseInt(request.getParameter("qid")));
        response.sendRedirect("adm-page.jsp?pgprt=3");   
    }
    else {
            
            response.sendRedirect("showall.jsp");
    }

}

else if(request.getParameter("page").toString().equals("profile")){
        
        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uName=request.getParameter("uname");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        int u=pDAO.getUserId(uName);
    pDAO.updateStudent(u,fName,lName,uName,email,pass,contactNo,city,address);
    response.sendRedirect("dashboard.jsp");
}
else if(request.getParameter("page").toString().equals("courses")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),
                request.getParameter("time"));
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adm-page.jsp?pgprt=2");
    }

}else if(request.getParameter("page").toString().equals("accounts")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delUser(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adm-page.jsp?pgprt=1");
    }

}else if(request.getParameter("page").toString().equals("exams")){
    if(request.getParameter("operation").toString().equals("startexam")){
        String cName=request.getParameter("coursename");
        int userId=Integer.parseInt(session.getAttribute("userId").toString());
        int a=pDAO.getCourseTimeByName(cName);
        int examId=pDAO.startExam(cName,userId);
        
        session.setAttribute("total",a);
        session.setAttribute("examId",examId);
        session.setAttribute("userId",userId);
        session.setAttribute("examStarted","1");
        response.sendRedirect("std-page.jsp?pgprt=1&coursename="+cName);
    }else if(request.getParameter("operation").toString().equals("submitted")){
        try{
        String time=LocalTime.now().toString();
        int size=Integer.parseInt(request.getParameter("size"));
        int eId=Integer.parseInt(session.getAttribute("examId").toString());
        int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
        
        session.removeAttribute("examStarted");
        for(int i=0;i<size;i++){
            String question=request.getParameter("question"+i);
            String ans=request.getParameter("ans"+i);
            
            int qid=Integer.parseInt(request.getParameter("qid"+i));
            
            pDAO.insertAnswer(eId,qid,question,ans);
            
        }
        
        pDAO.calculateResult(eId,tMarks,time,size);
        
        response.sendRedirect("std-page.jsp?pgprt=1&showresult="+1);
        
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }

}else if(request.getParameter("page").toString().equals("logout")){
    session.setAttribute("userStatus","0");
    session.removeAttribute("examId");
    session.removeAttribute("examStarted");
    response.sendRedirect("index.jsp");
}

%>