//
//  CountryViewModel.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 06/12/22.
//

import Foundation

public class CountryViewModel : ObservableObject, Identifiable {
	
	@Published var country: Countries.Country
	private unowned let coordinator: HomeCoordinator
	
	init(coordinator: HomeCoordinator, country: Countries.Country) {
		self.coordinator = coordinator
		self.country = country
	}
	
	func close() {
		self.coordinator.close()
	}
	
	// MARK: - entrypoint
	func onAppear() {
		
	}
	
}
