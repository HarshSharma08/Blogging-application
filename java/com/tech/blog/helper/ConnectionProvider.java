/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;
import java.sql.*;
/**
 *
 * @author harsh
 */
public class ConnectionProvider {
private static Connection con;
public static Connection getConnection()
{
    
    try
    {
        if(con == null)
    {
        System.out.println("Hello");
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/technicalblog","root","root");
        return con;
    }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }   
    return con;
}
}
