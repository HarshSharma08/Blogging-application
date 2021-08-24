<%-- 
    Document   : index
    Created on : Jun 30, 2021, 5:04:01 PM
    Author     : harsh
--%>

<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 100%, 74% 93%, 23% 99%, 0 91%, 0 0);
            }
            .title{
                font-weight: 400;
            }
            .content{
                font-weight: 100;
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>
        
        <!--banner-->
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h4>Give your passion a platform today</h4>
                    <h1 class="dislay-3">Create your blog</h1>
                     <h1 class="dislay-3">effortlessly</h1>
                     <p>A blog is a discussion or informational website published on the World Wide Web consisting of discrete, often informal diary-style text entries. Posts are typically displayed in reverse chronological order, so that the most recent post appears first, at the top of the web page</p>
                     
                     <a href="registration_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start! it's free</a>
                     <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
                </div>
            </div>
        </div>
        
        <%
                user User=(user)session.getAttribute("currentuser");
        PostDao dao=new PostDao(ConnectionProvider.getConnection());
        List<Post> p1=dao.getAllPost();
        
        %>
        
        <!--cards-->
        <h4><b> <p class="text-center">RECENT BLOGS</p> </b></h4>
        <div class="container">
                        <div class="row">
                            <%
                                    for(Post p:p1)
  {
%>  

<div class="col-md-6 mt-3">
<div class="card" >
    <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
  <div class="card-body">
      <b class="title"> <%=p.getpTitle()%> </b>
      <p class="content"> <%=p.getpContent()%> </p>
  </div>
  <div class="card-footer text-center primary-background"> 
            <%
                LikeDao dd=new LikeDao(ConnectionProvider.getConnection());
            %>
            
      <a href="login_page.jsp" class="btn btn-outline-light  text-white ">Read More...</a>
      <!--<a href="#!" class="btn btn-outline-light  text-white "><i class="fa fa-comment-o"></i><span>20</span></a>-->
  </div>
</div>
</div>

<%
    }
%>
            </div>

        </div>
        <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
    </body>
</html>
