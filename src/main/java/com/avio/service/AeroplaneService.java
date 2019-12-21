package com.avio.service;

import com.avio.dao.AeroplaneDao;
import com.avio.domain.Aeroplane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AeroplaneService {

    @Autowired
    private AeroplaneDao aeroplaneDao;

    public List<Aeroplane> find() {
        return aeroplaneDao.find();
    }
}
