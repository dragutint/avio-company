package com.avio.config.security;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@ComponentScan({"com.avio"})
@EnableGlobalMethodSecurity(prePostEnabled=true)
@PropertySource("classpath:avio.app.properties")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
 
    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    Environment env;
    
	@Autowired
	AuthenticationService authenticationService;
	 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(authenticationService).passwordEncoder(passwordEncoder());
    }
 
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(12);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http
        .authorizeRequests()
                .anyRequest().permitAll()
//        	.antMatchers("/reserve").hasAnyRole("admin", "client")
            .and()
        .formLogin()
            .loginPage("/login")
            .permitAll()
            .and()
            .exceptionHandling().accessDeniedPage("/unauthorized-access")
        .and()
            .csrf().disable().cors();
    }
}