package com.avio.bl.job;

import com.avio.bl.dao.LockingDao;
import com.avio.bl.dao.util.AbstractJDBCDao;
import com.avio.bl.service.FlightService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@EnableAsync
public class FlightLockJob extends AbstractJDBCDao {
    @Autowired
    private FlightService flightService;
    @Autowired
    private LockingDao lockingDao;

    @Async
    public void unlockFlightAfterDelay(Integer flightId, Integer lockId) throws InterruptedException {
        log.debug("async FlightLockJob(): started delay");
        int i = 1;

        while (i <= 15){
            Thread.sleep(1000);
            i++;
        }

        if(!lockingDao.isFinishedLock(lockId)){
            log.debug("async FlightLockJob(): unlocking flight {}, lockId: {}", flightId, lockId);
            flightService.unlockFlight(flightId);
        }
    }
}
