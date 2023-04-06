//
//  Homecoo.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 06/12/22.
//

import Foundation
import SwiftUI

struct HomeCoordinatorView: View {
	
	@ObservedObject var coordinator: HomeCoordinator
	
	var body: some View {
		NavigationView {
			CountriesView(viewModel: coordinator.viewModel)
				.navigation(item: $coordinator.countryViewModel) { viewModel in
						countryView(viewModel)
				}
		}.accentColor(customAccentColor)
			
	}
	
	@ViewBuilder
	private func countryView(_ viewModel: CountryViewModel) -> some View {
		CountryView(
			viewModel: viewModel
		)
	}
}
