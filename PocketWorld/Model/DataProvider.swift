//
//  CityListDataProvider.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 03/12/22.
//

import Foundation
import Apollo

public class DataProvider {
	let apolloClient = ApolloClient(url: URL(string: "https://countries.trevorblades.com")!)
	
	func process(data: CountryData) -> [Countries.Country] {
		return Countries(data).countries
	}
	
	func fetchCountries() async throws -> [Countries.Country]? {
		
		await withCheckedContinuation { continuation in
		apolloClient.fetch(query: CountriesQuery()) {result in
				
				switch result {
				case .success(let graphQLResult):
					if let countriesData = graphQLResult.data {
						let countries = self.process(data: countriesData)
						continuation.resume(returning: countries)
					} else if let errors = graphQLResult.errors {
						print("Failure! GraphQL Errors: \(errors)")
						continuation.resume(returning: nil)
					}
				case .failure(let error):
					print("Failure! Error: \(error)")
					continuation.resume(returning: nil)
				}
			}
			
		}
		
	}
}
