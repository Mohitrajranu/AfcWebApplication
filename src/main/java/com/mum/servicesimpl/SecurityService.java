package com.mum.servicesimpl;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
