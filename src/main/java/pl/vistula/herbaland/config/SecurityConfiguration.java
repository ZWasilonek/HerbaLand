package pl.vistula.herbaland.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.logout.HeaderWriterLogoutHandler;
import org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter;
import pl.vistula.herbaland.repository.UserRepository;
import pl.vistula.herbaland.service.impl.UserDetailsServiceImpl;

import static org.springframework.security.web.header.writers.ClearSiteDataHeaderWriter.Directive.*;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

  private static final ClearSiteDataHeaderWriter.Directive[] SOURCE =
      {CACHE, COOKIES, STORAGE, EXECUTION_CONTEXTS};
  private final UserRepository userRepository;
  private final AccessDeniedHandler accessDeniedHandler;

  @Autowired
  public SecurityConfiguration(UserRepository userRepository,
                               AccessDeniedHandler accessDeniedHandler) {
    this.userRepository = userRepository;
    this.accessDeniedHandler = accessDeniedHandler;
  }

  @Bean
  public UserDetailsService userDetailsService() {
    return new UserDetailsServiceImpl(userRepository);
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.authorizeHttpRequests((authorize) -> authorize
            .antMatchers("/",
                "/register",
                "/resources/**",
                "/file/show/**",
                "/category/**",
                "/search-all-by/**",
                "/search/**",
                "/medicinal-plant/{\\d+}")
            .permitAll()
            .antMatchers(
                "/user/**")
            .hasAnyRole("USER", "ADMIN")
            .antMatchers(
                "**/remove/**",
                "/medicinal-plant/edit/**",
                "/medicinal-plant/create/**",
                "/file/send")
            .hasRole("ADMIN")
            .anyRequest()
            .authenticated()
        ).formLogin((login) -> login
            .loginProcessingUrl("/login")
            .loginPage("/login")
            .usernameParameter("email")
            .passwordParameter("password")
            .defaultSuccessUrl("/")
            .failureUrl("/login?error")
            .permitAll()
        ).logout((logout) -> logout
            .logoutUrl("/logout")
            .addLogoutHandler(new HeaderWriterLogoutHandler(new ClearSiteDataHeaderWriter(SOURCE)))
            //.deleteCookies("JSESSIONID")
            .invalidateHttpSession(true)
            .logoutSuccessUrl("/")
            .permitAll()
        )
        .exceptionHandling().accessDeniedHandler(accessDeniedHandler)
        .and().csrf().disable();
  }

  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public DaoAuthenticationProvider authenticationProvider() {
    DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
    authProvider.setUserDetailsService(userDetailsService());
    authProvider.setPasswordEncoder(passwordEncoder());
    return authProvider;
  }

  @Override
  protected void configure(AuthenticationManagerBuilder auth) {
    auth.authenticationProvider(authenticationProvider());
  }

  @Bean
  public AuthenticationManager customAuthenticationManager() throws Exception {
    return authenticationManager();
  }

}