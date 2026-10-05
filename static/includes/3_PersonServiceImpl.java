package service;
import java.util.ArrayList;
import java.util.List;

import clear.djn.DirectOptions;			//<1>

import dto.Person;
import service.generated.*;

public class PersonServiceImpl extends _PersonServiceImpl {
	@Override
	public List<Person> getPersons() {
		List<Person> result = new ArrayList<>();
		for (int i=0; i<1000; i++){
			result.add(new Person(i, "Joe", "Doe", "555-55-55", "1111-11-1111"));
		}
		//<2>
		int start = ((Double)DirectOptions.getOption("start")).intValue();
		int limit = ((Double)DirectOptions.getOption("limit")).intValue();
		
		limit = Math.min(start+limit, result.size() );		//<3>
		DirectOptions.setOption("total", result.size());	//<4>
		result = result.subList(start, limit);			//<5>

		return result;
	}
}
