//
//  CountriesViewModel.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 03/12/22.
//

import Foundation

extension Identifiable where ID: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

public class CountriesViewModel : ObservableObject {
	
	@Published var title: String
	@Published var networkErrorAlert: Bool = false
	@Published var countries: [Countries.Country] = []
	@Published var isLoading: Bool = false
	private unowned let coordinator: HomeCoordinator
	
	private var dataProvider: DataProvider
	
	init(title: String, dataProvider: DataProvider, coordinator: HomeCoordinator) {
		self.title = title
		self.dataProvider = dataProvider
		self.coordinator = coordinator
	}
	
	func open(_ country: Countries.Country) {
		self.coordinator.open(country)
	}
	
	func fetchCountries() async -> [Countries.Country]? {
		
		guard let data = try? await dataProvider.fetchCountries()
		else {
			Task {
				await MainActor.run {
					networkErrorAlert.toggle()
				}
			}
			return nil
		}
		
		return data
	}
	
	@MainActor
	func getData() async {
		isLoading = true
		self.countries = await fetchCountries() ?? []
		isLoading = false
	}
	
	// MARK: - entrypoint
	func onAppear() {
		
		Task {
			await getData()
		}
		
	}
	
}
