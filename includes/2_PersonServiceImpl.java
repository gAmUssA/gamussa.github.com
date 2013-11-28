package service;
import java.util.ArrayList;
import java.util.List;

import clear.data.ChangeObject;
import dto.Person;
import service.generated.*;

public class PersonServiceImpl extends _PersonServiceImpl { // <1>

	@Override
	public List<Person> getPersons() {				// <2>
		List<Person> result = new ArrayList<>();	
		Integer id= 0;
		result.add(new Person(++id, "Joe", "Doe", "555-55-55", "1111-11-1111"));
		result.add(new Person(++id, "Joe", "Doe", "555-55-55", "1111-11-1111"));
		result.add(new Person(++id, "Joe", "Doe", "555-55-55", "1111-11-1111"));
		result.add(new Person(++id, "Joe", "Doe", "555-55-55", "1111-11-1111"));
		return result;		//<3>
	}

	@Override
	public void getPersons_doCreate(ChangeObject changeObject) {  // <4>
		Person dto = (Person) deserializeObject(
				(Map<String, String>) changeObject.getNewVersion(),
				Person.class);

		System.out.println(dto.toString());
	}

	@Override
	public void getPersons_doUpdate(ChangeObject changeObject) {	// <5>
		// TODO Auto-generated method stub
		super.getPersons_doUpdate(changeObject);
	}

	@Override
	public void getPersons_doDelete(ChangeObject changeObject) {	// <6>
		// TODO Auto-generated method stub
		super.getPersons_doDelete(changeObject);
	}
	
}
