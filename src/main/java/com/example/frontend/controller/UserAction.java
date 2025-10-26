package com.example.frontend.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.example.frontend.controller.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final String API_BASE_URL = "http://localhost:8080/api/users";

	private String firstName;
	private String lastName;
	private String email;
	private String mobile;
	private String result;
	private List<User> users;

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String registerUser() {
		try {
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);

			User user = new User(firstName, lastName, email, mobile);

			ObjectMapper mapper = new ObjectMapper();

			String jsonBody = mapper.writeValueAsString(user);

			HttpEntity<String> entity = new HttpEntity<>(jsonBody, headers);

			ResponseEntity<String> response = restTemplate.postForEntity(API_BASE_URL + "/addUser", entity,
					String.class);

			result = response.getBody();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Error: " + e.getMessage();
		}
		return SUCCESS;
	}

	public String fetchUsers() {
		try {
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<User[]> response = restTemplate.getForEntity(API_BASE_URL + "/getAllUsers", User[].class);
			User[] userArray = response.getBody();
			users = Arrays.asList(userArray);
		} catch (Exception e) {
			e.printStackTrace();
			result = "Error: " + e.getMessage();
			users = null;
		}
		return SUCCESS;
	}

}