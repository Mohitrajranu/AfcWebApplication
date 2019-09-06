package com.mum.domain;

public class HiddenValueBean 
{
    private String hiddenMessage;
    private String password;
    private String passwordConfirm;

    public String getHiddenMessage() 
    {
        return hiddenMessage;
    }

    public void setHiddenMessage(String hiddenMessage) 
    {
        this.hiddenMessage = hiddenMessage;
    }

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
    
    
}