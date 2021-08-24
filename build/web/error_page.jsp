

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something went wrong!</title>
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
        <div class="container-fluid text-center" >
        <img src="img/error.png" alt=""></img>
        <h4 class="display-3">Something went wrong</h4>
        <h5><%=exception%></h5>
        <br>
        <a href="index.jsp" class="btn btn-outline-light primary-background">Home Page</a>
        </div>
    </body>
</html>
