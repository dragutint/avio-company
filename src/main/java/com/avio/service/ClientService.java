package com.avio.service;

import com.avio.dao.ClientDao;
import com.avio.domain.administration.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

    @Autowired
    private ClientDao clientDao;

    public Client getById(Integer id) {
        return clientDao.getById(id);
    }

    public Client getByUsername(String username) {
        return clientDao.getByUsername(username);
    }
}
