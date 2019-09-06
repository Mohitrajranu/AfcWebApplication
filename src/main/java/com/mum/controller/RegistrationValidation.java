package com.mum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import com.mum.domain.Registration;
import com.mum.services.UserService;

@Component("registrationValidator")
public class RegistrationValidation implements Validator {
    @Autowired
    private UserService userService;
  public boolean supports(Class<?> klass) {
    return Registration.class.isAssignableFrom(klass);
  }

  public void validate(Object target, Errors errors) {
    Registration registration = (Registration) target;
    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username",
        "NotEmpty.registration.username",
        "User Name must not be Empty.");
    if (userService.findByUsername(registration.getUsername()) != null) {
        errors.rejectValue("username", "Duplicate.userForm.username");
    }
    
    String userName = registration.getUsername();
    if ((userName.length()) > 50) {
      errors.rejectValue("username",
          "lengthOfUser.registration.username",
          "User Name must not more than 50 characters.");
    }
    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
    if (registration.getPassword().length() < 8 || registration.getPassword().length() > 32) {
        errors.rejectValue("password", "Size.registration.password");
    }
    
    if (!(registration.getPassword()).equals(registration
        .getPasswordConfirm())) {
      errors.rejectValue("password",
          "matchingPassword.registration.password",
          "Password and Confirm Password Not match.");
    }
  }
}