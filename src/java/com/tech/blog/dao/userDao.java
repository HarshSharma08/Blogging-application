package com.tech.blog.dao;

import com.tech.blog.entities.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class userDao {
private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(user User){
        boolean f=false;
        try
        {
            String query="Insert into user(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, User.getName());
            pstmt.setString(2,User.getEmail());
            pstmt.setString(3,User.getPassword());
            pstmt.setString(4,User.getGender());
            pstmt.executeUpdate();
         System.out.println(User.getName());
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public user getUserByEmailandPassword(String email,String Password)
    {
        user User=null;
        
        try
        {
            
            String query="Select * from user where email=? and password=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, Password);
            
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
                User=new user();
                User.setId(set.getInt("id"));
                User.setName(set.getString("name"));
                User.setEmail(set.getString("email"));
                User.setPassword(set.getString("password"));
                User.setGender(set.getString("gender"));
                User.setDateTime(set.getTimestamp("rdate"));
                User.setProfile(set.getString("profile"));
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return User;
    }
    
    public boolean updateUser(user User)
    { 
        boolean f=false;
        try
        {   
                    String query="UPDATE user SET name = ?, email = ? , password = ? , gender = ? , profile = ?  WHERE id = ? ";
                    PreparedStatement pstmt=con.prepareStatement(query);
                    pstmt.setString(1, User.getName());
                    pstmt.setString(2, User.getEmail());
                    pstmt.setString(3, User.getPassword());
                    pstmt.setString(4, User.getGender());
                    pstmt.setString(5, User.getProfile());
                    pstmt.setInt(6, User.getId());
                    pstmt.executeUpdate();
                    System.out.println("Name "+User.getName());        
                    System.out.println("User "+User.getId());        
                    System.out.println("Query "+query.toString());                    
                    f=true; 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
          public user getUserByUserId(int Userid)
     {
         user User=null;
         try
         {
             String query="Select * from user where id=?";
             PreparedStatement p=this.con.prepareStatement(query);
             p.setInt(1,Userid);
             ResultSet rs=p.executeQuery();
             while(rs.next())
                {
                    int id=rs.getInt("id");
                    String name=rs.getString("name");
                    String email=rs.getString("email");
                    String password=rs.getString("password");
                    String gender=rs.getString("gender");
                    Timestamp rdate=rs.getTimestamp("rdate");
                    String profile=rs.getString("profile");
                    User=new user(id,name,email,password,gender,rdate,profile);
              
                 }
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return User;
     }

    
}
