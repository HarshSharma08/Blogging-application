
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author harsh
 */
public class PostDao {
    
     Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list=new ArrayList< >();
        
        try
        {
            String q="Select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next())
            {
                int cid=set.getInt("cid");
                  String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
//                newObj.setCid(cid);
//                newObj.setName(name);
//                newObj.setDescription(description);
                  list.add(c);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    
    
    public boolean savePost(Post p)
    {
        boolean f=false;
        
        try
        {
            String query="Insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,p.getpTitle());
            pstmt.setString(2,p.getpContent());
            pstmt.setString(3,p.getpCode());
            pstmt.setString(4,p.getpPic());
            pstmt.setInt(5,p.getCatid());
            pstmt.setInt(6,p.getUserid());
            System.out.println("Hello");
            pstmt.executeUpdate();
            f=true; 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
     public List<Post> getAllPost()
    {
        List<Post> list=new ArrayList<Post>();
        try
        {
        String query="select * from posts";
        PreparedStatement pmtst=con.prepareStatement(query);   
        ResultSet set=pmtst.executeQuery();
        while(set.next())
        {
            int pid=set.getInt("pid");
            String pTitle=set.getString("pTitle");
            String pContent=set.getString("pContent");
            String pCode=set.getString("pCode");
            String pPic=set.getString("pPic");
            Timestamp date=set.getTimestamp("pDate");
            int catId=set.getInt("catId");
            int userId=set.getInt("userId");
            Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            list.add(post);
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
     
     public List<Post> getPostByCategory(int catId)
     {
         List<Post> list=new ArrayList<Post>();
        try
        {
        String query="select * from posts where catId=?";
        PreparedStatement pmtst=con.prepareStatement(query);
        pmtst.setInt(1, catId);
        ResultSet set=pmtst.executeQuery();
        while(set.next())
        {
            int pid=set.getInt("pid");
            String pTitle=set.getString("pTitle");
            String pContent=set.getString("pContent");
            String pCode=set.getString("pCode");
            String pPic=set.getString("pPic");
            Timestamp date=set.getTimestamp("pDate");
            int userId=set.getInt("userId");
            Post post=new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            list.add(post);
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }         
         return list;
     }

     public Post getPostByPostId(int postId)
     {
         Post post=null;
         try
         {
             String query="Select * from posts where pid=?";
             PreparedStatement p=this.con.prepareStatement(query);
             p.setInt(1,postId);
             ResultSet rs=p.executeQuery();
             while(rs.next())
                {
                    int pid=rs.getInt("pid");
                   String pTitle=rs.getString("pTitle");
                   String pContent=rs.getString("pContent");
                   String pCode=rs.getString("pCode");
                   String pPic=rs.getString("pPic");
                   Timestamp pDate=rs.getTimestamp("pDate");
                   int catId=rs.getInt("catId");
                   int userId=rs.getInt("userId");
                    post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                    System.out.println("object created");
                 }
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return post;
     }

public Post getSearch(String pTitle)
    {
        Post post=null;
        try{
        String query="Select * from posts where pTitle=?";
        PreparedStatement p=con.prepareStatement(query);
        p.setString(1,pTitle);
        ResultSet rs=p.executeQuery();
        while(rs.next())
        {
            int pid=rs.getInt("pid");
            String pTitle2=rs.getString("pTitle");
            String pContent=rs.getString("pContent");
            String pCode=rs.getString("pCode");
            String pPic=rs.getString("pPic");
            Timestamp pDate=rs.getTimestamp("pDate");
            int catId=rs.getInt("catId");
            int userId=rs.getInt("userId");
             post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
        }
       
        }
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return post;
    }


}
