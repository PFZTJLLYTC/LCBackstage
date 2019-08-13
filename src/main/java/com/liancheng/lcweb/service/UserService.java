package com.liancheng.lcweb.service;

import com.liancheng.lcweb.domain.AccessToken;
import com.liancheng.lcweb.domain.User;
import com.liancheng.lcweb.form.ChangePasswordForm;
import com.liancheng.lcweb.form.UserInfoForm;
import com.liancheng.lcweb.form.UserLoginForm;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findOne(String id);

    User getUser(String mobile, String password);

    void addUser(UserInfoForm userRegisterForm);

    void changePassword(ChangePasswordForm form);

    User findByMobile(String mobile);

    List<User> findByUserName(String userName);

    AccessToken userLogin(UserLoginForm user);

    void deleteOne(String id);

    void changeInfo(String userId, UserInfoForm userChangeInfoForm);

    void cancelOneOrder(String orderId);

    //删除消息（已读消息直接删除!）
    void deleteMessages(String id);

    //删除选中的消息列表
    void deleteCertainMessages(List<Integer> idList);

}
