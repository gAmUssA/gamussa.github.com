package dto;

import com.farata.dto2extjs.annotations.JSClass;
import com.farata.dto2extjs.annotations.JSGeneratedId;

@JSClass
public class Person {
	
	@JSGeneratedId
	private Integer id;
	private String firstName;
	private String lastName;
	private String phone;
	private String ssn;
	
	public Person(Integer id, String firstName, String lastName, String phone,
			String ssn) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.ssn = ssn;
	}
	
	// Getters and Setter are omitted

}
