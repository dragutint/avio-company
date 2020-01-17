package com.avio.bl.service;

import com.avio.bl.dao.ClientDao;
import com.avio.bl.dao.UserDao;
import com.avio.domain.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    private ClientDao clientDao;
    @Autowired
    private UserDao userDao;

    public Client getById(Integer id) {
        return clientDao.getById(id);
    }

    public Client getByUsername(String username) {
        return clientDao.getByUsername(username);
    }

    public void save(Client c) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);
        c.getUser().setPassword(passwordEncoder.encode(c.getUser().getPassword()));
        userDao.insert(c.getUser());
        clientDao.insert(c);
    }
}
