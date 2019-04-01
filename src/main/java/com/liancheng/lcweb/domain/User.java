package com.liancheng.lcweb.domain;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
@DynamicUpdate
@EntityListeners(AuditingEntityListener.class)
public class User {

    @Id
    private String unum;

    private String username;

    @NotNull(message = "密码不能为为空")
    private String password;

    @NotNull(message = "手机号不能为为空")
    private String mobile;

    //private String address; 当前位置，根据定位得到？

    @Email//必须为电子邮件
    private String email;

    private Boolean emailVerifiled;

    @CreatedDate
    private Date creatTime;

    @LastModifiedDate
    private Date updateTime;


}
