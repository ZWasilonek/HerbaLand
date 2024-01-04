package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.service.SecurityService;

@Service
public class SecurityServiceImpl implements SecurityService {

  private final AuthenticationManager authenticationManager;
  private final UserDetailsService userDetailsService;

  @Autowired
  public SecurityServiceImpl(UserDetailsService userDetailsService,
                             AuthenticationManager authenticationManager) {
    this.authenticationManager = authenticationManager;
    this.userDetailsService = userDetailsService;
  }

  @Override
  public void autoLogin(String email, String password) {
    UserDetails userDetails = userDetailsService.loadUserByUsername(email);
    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

    authenticationManager.authenticate(usernamePasswordAuthenticationToken);

    if (usernamePasswordAuthenticationToken.isAuthenticated()) {
      SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
    }
  }

}