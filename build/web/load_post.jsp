

<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row">
<%
    user User=(user)session.getAttribute("currentuser");
    
  PostDao posts=new PostDao(ConnectionProvider.getConnection());
    int catId=Integer.parseInt(request.getParameter("cid"));
    List<Post> list=null;

    if(catId == 0)
    {
        list=posts.getAllPost();
    }
    else
    {
        list=posts.getPostByCategory(catId);
    }
    
    if(list.size()==0)
    {
        out.println("<h3 class='display-4 text-center '>No Post available...</h3>");
    }
    
  for(Post p:list)
  {
%>  

<div class="col-md-12 mt-4">
<div class="card" >
    <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
  <div class="card-body">
      <b> <%=p.getpTitle()%> </b>
      <p> <%=p.getpContent()%> </p>
  </div>
  <div class="card-footer text-center primary-background"> 
            <%
                LikeDao dd=new LikeDao(ConnectionProvider.getConnection());
            %>
            
            <a href="#!" onclick=" doLike(<%= p.getPid() %>,<%= User.getId() %>)" class="btn btn-outline-light  text-white "><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= dd.countLikeOnPost(p.getPid())%></span></a>
      <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light  text-white ">Read More...</a>
      <!--<a href="#!" class="btn btn-outline-light  text-white "><i class="fa fa-comment-o"></i><span>20</span></a>-->
  </div>
</div>
</div>

<%
    }
%>
</div>