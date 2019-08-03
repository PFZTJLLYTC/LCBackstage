package com.liancheng.lcweb.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
@DynamicUpdate
@EntityListeners(AuditingEntityListener.class)
public class Driver {

    //初步内容
    /* 0表示在休息（一般刚刚创建的司机状态为0，需要司机手动改变状态，1表示在路上，2表示可载客）
    初始密码为123456
    * */
    @Id
    private String dnum;//dnum就是phonenum？

    //线路id
    private Integer lineId;

    private String name;

    private String password;

    @NotNull(message = "车牌号")
    private String carNum;

    //计算年龄
    private Date birthday;

    private Integer status;

    private Integer availableSeats;

    //座位类型 0表示4座  1表示7座
    private Integer seatType;

    //改进方向：精确时间
    private Integer workTimes = 0;

    @CreatedDate
    @JsonIgnore
    private Date createTime;

    @LastModifiedDate
    @JsonIgnore
    private Date updateTime;
}
