package com.avio.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pilot {
    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String licence;
    private Date dateOfBirth;
}
