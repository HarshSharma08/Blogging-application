<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.user"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%
        user User=(user)session.getAttribute("currentuser");
        if(User==null)
        {
            response.sendRedirect("login_page.jsp");    
        }
        
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
               clip-path: polygon(50% 0%, 100% 0, 100% 100%, 74% 93%, 23% 99%, 0 91%, 0 0);
            }</style>

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
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-level-down"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <%
                  PostDao post=new PostDao(ConnectionProvider.getConnection());
                  ArrayList<Category> list2=post.getAllCategories();
                  for(Category cat:list2)
                  {
                  %>
                  <a onClick="getPost(<%= cat.getCid()%>)" class="dropdown-item" href="#"><%=cat.getName()%></a>
                  <%
                      }
                      %>
          
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-male"></span>About</a>
      </li>
      
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-pencil-square-o"></span>Wanna Add Post</a>
      </li>
      &nbsp;&nbsp;&nbsp;
      <form class="form-inline my-2 my-lg-0" action="search_blog_post.jsp" >
      <input name="title" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
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

 <!--main body starts-->
                        <main>
                            <div class="container">
                               <div class="row mt-4">
                                   <!--first col-->
                                   <div class="col-md-4">
                                       <div class="list-group">
                                         <a href="#" onClick="getPost(0)"  class="list-group-item list-group-item-action primary-background text-white">
                                             All Posts
                                         </a>
                                           <%
                                           PostDao d=new PostDao(ConnectionProvider.getConnection());
                                           ArrayList<Category> list3=d.getAllCategories();
                                           for(Category c:list3)
                                           {
                                           %>
                                           <a href="#" onClick="getPost(<%= c.getCid()%>)" class="list-group-item list-group-item-action"><%=c.getName()%></a>
                                         <%
                                         }
                                         %>
                                       </div>
                                   </div>
                                   <!--second col-->
                                   <div class="col-md-8">
                                       <div class="container text-center"  id="loader"> 
                                           <i class="fa fa-refresh fa-4x fa-spin"></i>
                                           <h3 class="mt-2"> Loading Posts.....  </h3>
                                       </div>
                                       <div class="container-fluid" id="post-container">
                                           
                                       </div>
                                   </div>
                               </div>
                           </div>
                        </main>
 <!--main body ends-->
<!--Profile start-->

<!-- Button trigger modal -->

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
        
<script>
    
    function getPost(catId)
    {
        $.ajax({
            url:"load_post.jsp",
            data: {cid: catId},
            success: function(data,textStatus,jqXHR){
                console.log(data),
                    $("#loader").hide(),
                    $("#post-container").html(data)
            }
        })  
    }
    
    $(document).ready(function(e){
        getPost(0);
    })
</script>



    </body>
</html>
