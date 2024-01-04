package pl.vistula.herbaland.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.facade.FacadeUserService;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("userFromSession")
public class SessionController {

  @Autowired
  public HttpSession httpSession;
  @Autowired
  FacadeUserService facadeUserService;


  @ModelAttribute("userFromSession")
  public UserDTO getUserFromSession() {
      Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      if (principal instanceof UserDetails) {
        String userEmail = ((UserDetails) principal).getUsername();
        return facadeUserService.findUserByEmail(userEmail);
      }
    return new UserDTO();
  }

  public void setUserFromSession(Model model, boolean update) {
    UserDTO userFromSession = getUserFromSession();

    if (userFromSession.getId() != null && update)
      userFromSession = facadeUserService.findById(userFromSession.getId());
    model.addAttribute("userFromSession", userFromSession);
  }

}