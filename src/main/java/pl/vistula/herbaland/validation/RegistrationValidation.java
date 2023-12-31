package pl.vistula.herbaland.validation;

import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.vistula.herbaland.dto.UserDTO;
import pl.vistula.herbaland.model.User;
import pl.vistula.herbaland.service.UserService;

@Component
public record RegistrationValidation(UserService userService) implements Validator {

  @Override
  public boolean supports(@NotNull Class<?> aClass) {
    return RegistrationValidation.class.equals(aClass);
  }

  @Override
  public void validate(@NotNull Object o, @NotNull Errors errors) {
    UserDTO userDTO = (UserDTO) o;

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "NotBlank");
    String enteredFirstName = userDTO.getFirstName();
    if (!enteredFirstName.equals("")) {
      if (!enteredFirstName.matches("^[\\p{L}]{1,29}$")) {
        errors.rejectValue("firstName", "Pattern.userForm.FirstName");
      }
    }

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "NotBlank");
    String enteredLastName = userDTO.getLastName();
    if (!enteredLastName.equals("")) {
      if (!enteredLastName.matches("^[\\p{L}\\s.’\\-,]+$")) {
        errors.rejectValue("lastName", "Pattern.userForm.LastName");
      }
    }

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotBlank");
    String enteredEmail = userDTO.getEmail();
    String enteredPassword = userDTO.getPassword();
    User userFromDatabase = userService.findByEmail(enteredEmail);
    if (userFromDatabase != null) {
      if (userFromDatabase.getEmail().equals(enteredEmail)
          && !userFromDatabase.getId().equals(userDTO.getId())
          && userDTO.isEnabled()
          ||
          userFromDatabase.getEmail().equals(enteredEmail)
              && userDTO.getId() == null
              && userFromDatabase.isEnabled()) {
        errors.rejectValue("email", "Duplicated.userForm.Email");
      }
    }

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotBlank");
    if (!enteredPassword.equals("") && !enteredPassword.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,20}$")) {
      errors.rejectValue("password", "Pattern.userForm.Password");
    }

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "NotBlank");
    if (!enteredPassword.equals(userDTO.getConfirmPassword())) {
      errors.rejectValue("confirmPassword", "PasswordConfirmation.userForm.Password");
    }

  }

}