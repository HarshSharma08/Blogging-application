
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author harsh
 */
public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catid;
    private int userid;

    public Post(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catid,int userid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userid = userid;
        
    }
    
    public Post(){
    
    }

    public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catid,int userid) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catid = catid;
        this.userid = userid;
    }

    public int getPid() {
        return pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public int getCatid() {
        return catid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
    
}
