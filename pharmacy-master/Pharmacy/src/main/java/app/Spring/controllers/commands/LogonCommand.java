package app.Spring.controllers.commands;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class LogonCommand {
	
	@NotBlank
	@Size(min=5, max=20)
	
	String login;
	
	@NotBlank
	@Size(min=8, max=20)
	@Pattern(regexp="[0-9[a-z[A-Z[_\\-\\@#=+]]]]+")
	String password;
	
	boolean remember;

	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setRemember(boolean remember) {
		this.remember = remember;
	}
	
	public boolean isRemember() {
		return remember;
	}

}
