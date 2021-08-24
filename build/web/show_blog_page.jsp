
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp"%>

<%
        user User=(user)session.getAttribute("currentuser");
        if(User==null)
        {
            response.sendRedirect("login_page.jsp");    
        }
        
        %>

<%
 
   int  postId=Integer.parseInt(request.getParameter("post_id"));
   PostDao dao=new PostDao(ConnectionProvider.getConnection());
   Post posts=dao.getPostByPostId(postId);
   userDao d=new userDao(ConnectionProvider.getConnection());
   user Users=d.getUserByUserId(posts.getUserid());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=posts.getpTitle()%> || Share amigos </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
               clip-path: polygon(50% 0%, 100% 0, 100% 100%, 74% 93%, 23% 99%, 0 91%, 0 0);
            }
            
            .post-title
            {
                font-weight:100;
                font-size: 30px;
            }
            
            .post-content
            {
                font-weight: 100;
                font-size: 20px;
            }
            
            .post-code
            {
                font-weight:100;
            }
            
            .post-user-info
            {
                font-size: 18px;
            }
            
            .post-date
            {
                font-style: italic;
                font-size: 18px;
                font-weight: 100;
            }
            
            .row-user
            {
                border: 0.5px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>
    </head>
    <body>
        
        
                
<!--        navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark  primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-comments-o"></span>Share amigos</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
    <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-male"></span>About</a>
      </li>
      
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-pencil-square-o"></span>Wanna Add Post</a>
      </li>
      &nbsp;&nbsp;&nbsp;
      <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>

    </ul>
    <form class="form-inline my-2 my-lg-0">
       <ul class="navbar-nav mr-auto">
                 <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle-o"></span><%=User.getName()%></a>
      </li>
            <li class="nav-item">
                <a class="nav-link " href="LogoutServlet"><span class="fa fa-user-o"></span>logout</a>
      </li>
       </ul>
    </form>
      
  </div>
</nav>


<!--navbar ending-->

<!--Message starting-->
                           <%
                               Message msg=(Message)session.getAttribute("message");
                               if(msg!=null)
                               {
                                %>
                                <div class="alert <%=msg.getCss()%>" role="alert">
                                    <%= msg.getContent()%>  
                                    </div>
                                    <% 
                                        session.removeAttribute("message");                                        
                                        }
                           %>

                           
 <!--Message ending-->

<!--Post show starts--> 
 
<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2 mt-4">
<div class="card" >
    <div class="card-header primary-background text-white">
        <b class="post-title"> <%=posts.getpTitle()%> </b>  
    </div>
    <img class="card-img-top" src="blog_pics/<%=posts.getpPic()%>" alt="Card image cap">
      <div class="row-md-12  t-3  row-user ">
          <div class="col-md-6 ">
              <p class="post-user-info"><a href="#!"> &nbsp; <%=Users.getName()%> </a> posted on</p>
          </div>
          <div class="col-md-6">
              <p class="post-date"><%=posts.getpDate().toLocaleString() %></p>
          </div>
      </div>
      
    
    <div class="card-body">
      <p class="post-content"> <%=posts.getpContent()%> </p>
      <div class="post-code">
      <pre> <%=posts.getpCode()%> </pre>
      </div>
  </div>
  
  
        <div class="card-footer primary-background"> 
            
            <%
                LikeDao dd=new LikeDao(ConnectionProvider.getConnection());
            %>
            
            <a href="#!" onclick=" doLike(<%= posts.getPid() %>,<%= User.getId() %>)" class="btn btn-outline-light  text-white "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= dd.countLikeOnPost(posts.getPid())%></span></a>
      <!--<a href="#!" class="btn btn-outline-light  text-white "><i class="fa fa-comment-o"></i><span>20</span></a>-->
      <a href="profile.jsp"><button class="btn btn-outline-light text-white" type="submit" >Back</button></a>
  </div>

</div>
        </div>
    </div>    
</div>
 
 <!--Post show ends-->
 
<!--Profile Modal start-->
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Share amigos</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
      </div>
      <div class="modal-body">
                <div class="container text-center ">
              <img src="pic/<%=User.getProfile()%>" class="img-fluid" style="border-radius:50%; width:100px"></img>
              <h4><%=User.getName()%></h4>
        </div>
        <br>
        <div id="profile">
        <table class="table">

  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Id :</td>
      <td><%=User.getId()%></td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Email id :</td>
      <td><%=User.getEmail()%></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Gender :</td>
      <td><%=User.getGender()%></td>
    </tr>
    <tr>    
      <th scope="row">4</th>
      <td>Registered on :</td>
      <td><%=User.getDateTime().toString()%></td>
    </tr>
  </tbody>

</table>
    </div>    
<!--    profile-edit-->
    <div id="edit-profile" style="display:none;">
        <div class="container text-center">
        <h4>Please Edit Carefully</h4>
        <form action="EditServlet" method="post" enctype="multipart/form-data" >
            <table class="table">
                <tr>
      <td>Id :</td>
      <td><%=User.getId()%></td>
                </tr>
                <tr>
      <td>Email id :</td>
      <td><input name="user_email" type="email" class='form-control' value="<%=User.getEmail()%>"></td>
                </tr>
                <tr>
      <td>Name :</td>
      <td><input name="user_name" type="text" class='form-control'  value="<%=User.getName()%>"></td>
                </tr>
                <tr>
      <td>Password :</td>
      <td><input name="user_password" type="password" class='form-control'  value="<%=User.getPassword()%>"></td>
                </tr>
                <tr>
      <td>Gender :</td>
      <td><%=User.getGender().toUpperCase()%></td>
                </tr>
                <tr>
      <td>Select New Profile :</td>
      <td><input name="image" type="file" class="form-control" ></td>
                </tr>
            </table>
                <div class="container">
                    <button type="submit" class="btn btn-outline-light primary-background">Save Changes</button>
                </div>
        </form>
        </div>
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="profile-edit-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!--Modal ends-->
<!--Profile modal ends-->

<!--Add post modal starts-->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please Provide Post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="Post" enctype="multipart/form-data">
                      <div class="form-group">
              <select class="form-control" name="cid">
                  <option selected disabled>---Select Category---</option>
                  <%
                  PostDao postdo=new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> list=postdo.getAllCategories();
                  for(Category c:list)
                  {
                  %>
                  <option value=<%=c.getCid()%>><%=c.getName()%></option>
                  <%
                      }
                      %>
              </select>
          </div>
          <div class="form-group">
          <input name="pTitle" type='text' class='form-control' placeholder="Enter Post Title" >
          </div>
          <div class="form-group">
              <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter Your Content"></textarea>
          </div>
          <div class="form-group">
              <textarea name="pCode" class="form-control" style="height:100px;" placeholder="Enter Your Code (if any)"></textarea>
          </div>
          <div class="form-group">
              <label>Upload File:</label>
               &nbsp;&nbsp;&nbsp;
              <input name="pic" type='file'>
          </div>       

      <div class="container text-center">
        <button type="submit" class="btn btn-outline-light primary-background">POST</button>
      </div>
   </form>
      </div>
    </div>
  </div>
</div>

<!--Add post modal ends--> 






        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function (){
                let editStatus=false;
                $('#profile-edit-button').click(function (){
                    
                    if(editStatus!=true)
                    {
                    $('#profile').hide();
                    $('#edit-profile').show();
                    editStatus=true;
                    $(this).text('Back');
                    }
                    else 
                    {
                    $('#edit-profile').hide();
                    $('#profile').show();
                    editStatus=false;
                    $(this).text('Edit');                    }
                })
            })            
        </script>
        
        
        
        
        <!--Here passing data asyncronusly-->
        
<!--        <script>
            $(document).ready(function(e){
                
                $("#add-post-form").on('submit',function(event){
                    event.preventDefault();
                    console.log("Hey");
                let form=new FormData(this); 
                
                $.ajax({
                    url:"AddPostServlet",
                    type:'Post',
                    data: form,
          success: function(data,textStatus,jqXHR){
   
           },
           error:function(jqXHR,textStatus,errorThrown){
           },
                processData: false,
                contentType: false
                
                })
                })
            })
        </script>-->
        
 
 
        
    </body>
</html>
