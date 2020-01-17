package com.avio.bl.service;

import com.avio.bl.dao.PilotDao;
import com.avio.domain.Pilot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PilotService {

    @Autowired
    private PilotDao pilotDao;

    public List<Pilot> find() {
        return pilotDao.find();
    }
}
