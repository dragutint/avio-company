package com.avio.binders;

import com.avio.dao.PilotDao;
import com.avio.domain.Pilot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class PilotBinder extends PropertyEditorSupport {
    @Autowired
    private PilotDao pilotDao;

    public void setAsText(String text) {
        Pilot c = this.pilotDao.getById(Integer.valueOf(text));
        this.setValue(c);
    }
}
