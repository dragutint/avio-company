package com.avio.bl.service;

import com.avio.config.prop.AppProps;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Log4j2
public class CurrencyService {
    @Autowired
    private AppProps appProps;

    public List<String> getAllCurrencies() {
        List<String> list = new ArrayList<>();
        list.add("EUR");
        list.add("RSD");
        list.add("USD");
        list.add("CHF");
        list.add("AUD");
        return list;
    }

    public Double convert(String from, String to, Double amount) throws UnirestException {
        String path = "https://api.kursna-lista.info/{api-key}/konvertor/{from}/{to}/{amount}";
        return Unirest.get(path)
                .routeParam("api-key", appProps.getCurrencyApiKey())
                .routeParam("from", from)
                .routeParam("to", to)
                .routeParam("amount", String.valueOf(amount))
                .asJson()
                .getBody()
                .getObject()
                .getJSONObject("result")
                .getDouble("value");
    }
}
