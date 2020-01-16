package com.avio.domain.administration;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Client {
    private Integer id;
    private String firstName;
    private String lastName;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    private Date dateOfBirth;
    private String gender;
    private String email;
    private String country;
    private String contact;
    private Long passportNum;
    private User user;
}
