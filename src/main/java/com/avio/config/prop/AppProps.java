package com.avio.config.prop;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

@Repository
public class AppProps {

    @Getter
    @Value("${datasource.jndi.name}")
    private String datasourceJndiName;

    @Getter
    @Value("${currency.api.key}")
    private String currencyApiKey;
}
