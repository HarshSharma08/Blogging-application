
package com.tech.blog.entities;

/**
 *
 * @author harsh
 */
public class Like {
    
    private int lid;
    private int pid;
    private int uid;

    public Like(int lid, int pid, int uid) {
        this.lid = lid;
        this.pid = pid;
        this.uid = uid;
    }
    
    public Like()
    {
    }

    public Like(int pid, int uid) {
        this.pid = pid;
        this.uid = uid;
    }

    public int getLid() {
        return lid;
    }

    public int getPid() {
        return pid;
    }

    public int getUid() {
        return uid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
}
