package com.avio.binders;

import com.avio.dao.AeroplaneDao;
import com.avio.domain.Aeroplane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class AeroplaneBinder extends PropertyEditorSupport {
    @Autowired
    private AeroplaneDao aeroplaneDao;

    public void setAsText(String text) {
        Aeroplane c = this.aeroplaneDao.getById(Integer.valueOf(text));
        this.setValue(c);
    }
}
