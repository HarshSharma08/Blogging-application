
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author harsh
 */
public class LikeDao {
    private Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid)
    {
        boolean f=false;
        try
        {
            String q="Insert into liked(pid,uid)values(?,?)";
            PreparedStatement p=con.prepareStatement(q);
            p.setInt(1,pid);
            p.setInt(2,uid);
            p.executeUpdate();
            f=true; 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        try
        {
            String query="select count(*) from liked where pid=? ";
            PreparedStatement p=con.prepareStatement(query);
            p.setInt(1,pid);
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                count=set.getInt("count(*)");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }        
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        try
        {
            PreparedStatement p=this.con.prepareStatement("Select * from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet rs=p.executeQuery();
            if(rs.next())
            {
                f=true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        try{
        PreparedStatement p=this.con.prepareStatement("delete from liked where pid=? and uid=?");  
        p.setInt(1,pid);
        p.setInt(2, uid);
        p.executeUpdate();
        f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }        
        return f;
    }
}
