package com.api.automation.fhir;




import com.intuit.karate.junit5.*;
import com.intuit.karate.junit5.Karate.Test;


public class TestGetRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("DeleteAllRequest","AddPatient").relativeTo(getClass());
	}
	
}
