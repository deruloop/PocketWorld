//
//  Countries.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 05/12/22.
//

import Foundation

typealias CountryData = CountriesQuery.Data

struct Countries: Decodable {
	var countries: [Country]

	init(_ countries: CountryData?) {
		self.countries = countries?.countries.map({ country -> Country in
			Country(country)
		}) ?? []
	}

	struct Country: Decodable {

		var name: String
		var native: String
		var capital: String
		var currency: String
		var emoji: String
		var continent: Continent
		var languanges: [Language]

		init(_ country: CountryData.Country?) {
			self.name = country?.name ?? ""
			self.native = country?.native ?? ""
			self.capital = country?.capital ?? ""
			self.currency = country?.currency ?? ""
			self.emoji = country?.emoji ?? ""
			self.continent = Continent(country?.continent as? CountryData.Country.Continent)
			self.languanges = country?.languages.map({ language -> Language in
				Language(language)
			}) ?? []
		}
		
	}
	
	struct Continent: Decodable {
		var name: String
		
		init(_ continent: CountryData.Country.Continent?) {
			self.name = continent?.name ?? ""
		}
	}
	
	struct Language: Decodable {
		var name: String
		
		init(_ continent: CountryData.Country.Language?) {
			self.name = continent?.name ?? ""
		}
	}
	
}
