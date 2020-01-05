package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
    private Integer id;
    private String firstName;
    private String lastName;
    private Double price;
    private Long passportNum;
    private Reservation reservation;
    private Integer flightId;
    private ClassType classType;
}
