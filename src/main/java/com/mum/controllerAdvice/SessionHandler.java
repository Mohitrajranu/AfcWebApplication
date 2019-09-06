package com.mum.controllerAdvice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.SessionAttributes;

@ControllerAdvice
@SessionAttributes("user")
public class SessionHandler {

}
