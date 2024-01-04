package pl.vistula.herbaland.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.repository.UserRepository;
import pl.vistula.herbaland.service.generic.GenericServiceImpl;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl extends GenericServiceImpl<User, UserRepository>
    implements UserDetailsService {

  @Autowired
  public UserDetailsServiceImpl(UserRepository repository) {
    super(repository);
  }

  @Override
  public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    User user = repository.findByEmail(email);

    if (user != null && user.isEnabled()) {
      Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
      for (AuthorizationRole role : user.getAuthorizationRoles()) {
        grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
      }
      return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), grantedAuthorities);
    } else {
      throw new UsernameNotFoundException("User not found.");
    }
  }

}