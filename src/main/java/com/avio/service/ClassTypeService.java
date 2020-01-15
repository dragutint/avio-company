package com.avio.service;

import com.avio.dao.ClassTypeDao;
import com.avio.dao.PilotDao;
import com.avio.domain.ClassType;
import com.avio.domain.Pilot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassTypeService {

    @Autowired
    private ClassTypeDao classTypeDao;

    public List<ClassType> find() {
        return classTypeDao.find();
    }

    public ClassType getById(Integer classType) {
        return classTypeDao.getById(classType);
    }
}
