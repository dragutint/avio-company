package com.avio.service;

import com.avio.dao.UserDao;
import com.avio.domain.administration.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User getByUsername(String username) {
        return userDao.getByUsername(username);
    }
}
