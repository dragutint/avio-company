package com.avio.bl.service;

import com.avio.bl.dao.FlightDao;
import com.avio.bl.dao.FlightLookupDao;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.domain.Flight;
import com.avio.domain.helper.FlightChange;
import com.avio.domain.helper.SocketResponseDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CompletableFuture;

@Service
@Log4j2
@EnableAsync
public class FlightLookupService extends AbstractJDBCDao {
    @Autowired
    private FlightLookupDao flightLookupDao;
    @Autowired
    private FlightDao flightDao;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Async
    public CompletableFuture<String> checkFlights() throws InterruptedException {
        log.debug("async checkFlights(): Checking for new flight changes");

        int i = 1;
        Date currentDate = new Date(System.currentTimeMillis());

        while(i<1000){
            List<FlightChange> changes = flightLookupDao.findNew(currentDate);

            if(changes != null && changes.size() != 0) {
                log.debug("async checkFlights(): Changes found! Number of changes: {}", changes.size());
                for(FlightChange fc : changes){
                    sendFlightChange(fc);
                }
            }

            Thread.sleep(500);
            i++;
        }

        return CompletableFuture.completedFuture("result");
    }

    @Async
    void sendFlightChange(FlightChange fc) {
        flightLookupDao.processFlightChange(fc.getId());

        SocketResponseDTO socketResponseDTO = new SocketResponseDTO();
        Flight f = flightDao.getById(fc.getFlightId());

        socketResponseDTO.setFlightId(fc.getFlightId());
        socketResponseDTO.setFreeSeatsBu(f.getFreeSeatsBu());
        socketResponseDTO.setFreeSeatsEc(f.getFreeSeatsEc());

        this.simpMessagingTemplate.convertAndSend("/topic/flight-change", socketResponseDTO);
    }

}
