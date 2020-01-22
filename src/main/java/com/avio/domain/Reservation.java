package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
    private Integer id;
    private Flight flight;
    private Client client;
    private Integer passengersNum;
    private Double price;
    private Date dateCreated;
    private Boolean finished;
}
