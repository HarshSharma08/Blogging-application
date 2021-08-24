
package com.tech.blog.entities;

/**
 *
 * @author harsh
 */
public class Category {
    private int cid;
    private String name;
    private String description;

    public Category(int cid, String name, String description) {
        this.cid = cid;
        this.name = name;
        this.description = description;
    }
    
    public Category(){
        
    }

    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    //Getters
    
    public int getCid() {
        return cid;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
    
    //setters

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setName(String name) {
        this.name = name;
    }   

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
