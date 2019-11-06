package com.baizhi.entity;

import java.io.Serializable;
import java.util.Date;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

@Document(indexName = "dangdang",type = "jieduanceshi")
public class Supplier implements Serializable {
    @Id
    private String id;
    @Field(type= FieldType.Text,analyzer = "ik_max_word")
    private String name;
    @Field(type= FieldType.Text,analyzer = "ik_max_word")
    private String leader;
    @Field(type = FieldType.Keyword)
    private String phone;
    private Date createDate;

    public Supplier(String id, String name, String leader, String phone, Date createDate) {
        this.id = id;
        this.name = name;
        this.leader = leader;
        this.phone = phone;
        this.createDate = createDate;
    }

    public Supplier() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", leader='" + leader + '\'' +
                ", phone='" + phone + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}
