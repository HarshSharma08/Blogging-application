<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 95%, 77% 100%, 28% 100%, 0 95%, 0 0);
            }
            
        </style>

    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp"%>

        <!--Registration-->
        <main class="d-flex align-items-center p-5  banner-background primary-background" style="height:90vh">
            <div class="container">
                
                   <div class="col-md-5 offset-md-4 mb-10">
                       <div class="card " style="">
                           <div class="card-header text-white primary-background text-center">
                               <span class="fa fa-user-circle-o fa-3x"></span>
                               <br>
                               <p>SIGN UP HERE</p>
                           </div>
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
                           <div class="card-body">
                               <form id="reg-form" action="RegisterServlet" method="post">
                                   
    <div class="form-group">
    <label for="name">Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name"  placeholder="Enter name">
  </div>

                                   
 <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  </div>
                                   
                                   
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                   
  <div class="form-group">
    <label for="gender">Gender</label>
    <input type="radio" id="gender" name="gender" value="Male"> Male
    <input type="radio" id="gender"  name="gender" value="Female"> Female
  </div>
<!--
    <div class="form-group">
        <textarea name="about" cols="20" row="1" id="" class="form-control" placeholder="Enter Something about yourself"></textarea>
  </div>
                                   -->
  <div class="form-check">                                  
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms & conditions*</label>
  </div>
                                   
       <div class="container-fluid text-center">                            
  <button type="submit" class="btn btn-outline-light primary-background">Submit</button>
       </div>
</form>
                         </div>
                       </div>
                   </div>
            </div>
        </main>

        <!--JavaScript-->        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
//        $(document).ready(function(){
//        console.log("loaded...")
//        
//        $('#reg-form').on('submit',function(event){
//       event.preventDefault()
//        
//        let form=new FormData(this);
//        
//        send register servlet
//        $.ajax({
//           url:"RegisterServlet",
//           type:'Post',
//           data:form , 
//           success: function(data,textStatus,jqXHR){
//               console.log(data)
//         swal("Good job!", "You successfully registered!", "success")
//         .then(()=>{
//           window.location="login_page.jsp"
//          });
//           },
//           error:function(jqXHR,textStatus,errorThrown){
//               console.log(jqXHR)
//               swal( "Try again")
//
//           },
//           processData: false,
//           contentType:false
//        });
//        });
//        
//        });
//
            </script>

    </body>
</html>
