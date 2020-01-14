package com.avio.domain.helper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchFilterForm {
    private String fromIata;
    private String toIata;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    private Date departureDate;
    @DateTimeFormat(pattern = "YYYY-MM-DD")
    private Date returnDate;
}
