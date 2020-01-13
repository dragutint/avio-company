package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Flight {
    private Integer id;
    private Pilot pilot;
    private Aeroplane aeroplane;
    private String airportDepIata;
    private String airportArrIata;
    private String gate;
    private Integer durationInMin;
    private Date timeDep;
    private Date timeArr;
    private Integer freeSeatsBu;
    private Integer freeSeatsEc;
    private Date dateCreated;
    private Date dateUpdated;
    private Double priceEc;
    private Double priceBu;
}
