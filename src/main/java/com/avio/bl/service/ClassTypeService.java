package com.avio.bl.service;

import com.avio.bl.dao.ClassTypeDao;
import com.avio.domain.ClassType;
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
