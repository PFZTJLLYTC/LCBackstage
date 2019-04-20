package com.liancheng.lcweb.service.impl;

import com.liancheng.lcweb.VO.ResultVO;
import com.liancheng.lcweb.domain.User;
import com.liancheng.lcweb.enums.ResultEnums;
import com.liancheng.lcweb.exception.LcException;
import com.liancheng.lcweb.form.UserInfoForm;
import com.liancheng.lcweb.form.UserLoginForm;
import com.liancheng.lcweb.repository.UserRepository;
import com.liancheng.lcweb.service.UserService;
import com.liancheng.lcweb.utils.ResultVOUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public User getUser(String mobile, String password) {
        return userRepository.findByMobileAndPassword(mobile,password);
    }

    @Override
    public void addUser(UserInfoForm userRegisterForm) {

        if (findByMobile(userRegisterForm.getMobile())!=null){

            log.error("号码已经被注册");
            throw new LcException(ResultEnums.USER_MOBILE_ALREADY_EXISTS);
        }
        User user = new User();
        BeanUtils.copyProperties(userRegisterForm,user);
        user.setId(UUID.randomUUID().toString());
        user.setTakeTimes(0);

        userRepository.save(user);
    }


    @Override
    public User userLogin(UserLoginForm user){
        return getUser(user.getMobile(),user.getPassword());
    }

    @Override
    public User findByMobile(String mobile) {
        return userRepository.findByMobile(mobile);
    }

    @Override
    public User findbyEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<User> findByUserName(String userName) {
        return userRepository.findByUsername(userName);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findOne(String id) {

        Optional<User> user = userRepository.findById(id);
        if (!user.isPresent()){
            throw new LcException(ResultEnums.NO_SUCH_USER);
        }
        return user.get();

    }

    @Override
    public void deleteOne(String id) {

        User user = findOne(id);
        userRepository.delete(user);


    }

    @Override
    public void changeInfo(String userId, UserInfoForm userChangeInfoForm) {

        User user = findOne(userId);
        if (user==null){
            throw new LcException(ResultEnums.NO_SUCH_USER);
        }
        user.setUsername(userChangeInfoForm.getUsername());
        user.setEmail(userChangeInfoForm.getEmail());
        user.setMobile(userChangeInfoForm.getEmail());

        userRepository.save(user);
    }
}
