//
//  PocketWorldTests.swift
//  PocketWorldTests
//
//  Created by Cristiano Calicchia on 03/12/22.
//

import XCTest
@testable import PocketWorld

final class PocketWorldTests: XCTestCase {

	func testFetchCountriesSuccess() async throws  {
		
		let sut = DataProvider()
		let data = try? await sut.fetchCountries()
		XCTAssertNotNil(data, "Fetch Country result is not nil")
		if let data = data {
			XCTAssertTrue(!data.isEmpty, "Fetch Country is returning a list of countries")
		}
		
	}
	
	func testCountriesIsPopulatedCorrectly() async throws  {
		let sut = CountriesViewModel(title: "Test", dataProvider: DataProvider(), coordinator: HomeCoordinator(title: "Test", dataProvider: DataProvider()))
			
		await sut.getData()
		
		XCTAssertTrue(!sut.countries.isEmpty, "Countries publisher has been valued")
	}
	
	func testCanadaHasTwoLanguages() async throws  {
		let sut = DataProvider()
			
		guard let data = try? await sut.fetchCountries() else {
			XCTFail("Should not be nil")
			return
		}
		
		for country in data {
			if country.name == "Canada" {
				XCTAssertTrue(country.languanges.count == 2, "Canada has two languages")
			}
		}
		
	}
	
	

}
