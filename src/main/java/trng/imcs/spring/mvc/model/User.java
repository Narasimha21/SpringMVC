package trng.imcs.spring.mvc.model;

import java.util.Date;

public class User {
	
//	@NotNull
	protected Integer id;
	private String userId;
	private String userName = "Raj";
	private Date dob;
	private String gender;
//	@NotNull
	private String country;
	private float anualSalary;
	private String email;
	private String password;
	private Boolean salaried;

	
	public User() {
		
	}

	public User(Integer id, String userId, String userName, Date dob, String gender, String country,
			float anualSalary) {
		super();
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.dob = dob;
		this.gender = gender;
		this.country = country;
		this.anualSalary = anualSalary;
	}
	
	public User(String userId, String userName, Date dob, String gender, String country,
			float anualSalary) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.dob = dob;
		this.gender = gender;
		this.country = country;
		this.anualSalary = anualSalary;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public float getAnualSalary() {
		return anualSalary;
	}

	public void setAnualSalary(float anualSalary) {
		this.anualSalary = anualSalary;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", dob=" + dob + ", gender="
				+ gender + ", country=" + country + ", anualSalary="
				+ anualSalary + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getSalaried() {
		return salaried;
	}

	public void setSalaried(Boolean salaried) {
		this.salaried = salaried;
	}

	
}
