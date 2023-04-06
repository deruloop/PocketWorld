//
//  HomeCoordinator.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 06/12/22.
//

import Foundation
import SwiftUI

class HomeCoordinator: ObservableObject, Identifiable {

	@Published var viewModel: CountriesViewModel!
	@Published var countryViewModel: CountryViewModel?
	
	private let dataProvider: DataProvider
	
	init(title: String,
		 dataProvider: DataProvider) {
		self.dataProvider = dataProvider
		
		self.viewModel = .init(
			title: title,
			dataProvider: dataProvider,
			coordinator: self
		)
	}

	func open(_ country: Countries.Country) {
		self.countryViewModel = .init(coordinator: self, country: country)
	}
	
	func close() {
		self.countryViewModel = nil
	}
	
}
