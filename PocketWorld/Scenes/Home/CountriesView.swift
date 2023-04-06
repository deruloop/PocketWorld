//
//  CountriesView.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 03/12/22.
//

import SwiftUI
import Combine

struct CountriesView: View {
	
	init(viewModel: CountriesViewModel) {
		self.viewModel = viewModel
	}
	
	@ObservedObject var viewModel: CountriesViewModel

	var body: some View {
		ZStack {
			Rectangle()
				.fill(appBackground)
				.edgesIgnoringSafeArea(.all)
				
			ScrollView {
				
				Text("Countries")
					.font(.title).bold()
				
				if viewModel.isLoading {
					ShimmerCountriesView()
				} else {
					ForEach(Array(viewModel.countries.enumerated()), id: \.offset) { _,country in
						
						CountryRow(country: country)
							.onNavigation { viewModel.open(country) }
					}
				}
				
			}
			
		}
		.onAppear {
			viewModel.onAppear()
		}
		.alert(isPresented: $viewModel.networkErrorAlert) {
			Alert(title: Text("Network error"), message: Text("Check your internet connection and try again"), dismissButton: .default(Text("Try again!")) {
				Task {
					await viewModel.getData()
				}
			})
		}
		.navigationBarHidden(true)
	}
}

struct CountryRow : View {
	
	var country: Countries.Country
	
	var body: some View {
		
		ZStack {
			RoundedRectangle(cornerRadius: 16).fill(Color.white)
			
			HStack {
				Text(country.emoji)
				Text(country.name)
				Spacer()
				Image(systemName: "chevron.right")
					.foregroundColor(Color.secondary)
			}
			.padding(.horizontal)
			.padding(.vertical, 8)
		}
		.padding(.horizontal)
		.padding(.bottom, 4)
	}
}

//MARK: Shimmer

struct ShimmerCountriesView: View {
	
	@ViewBuilder
	private var shimmerRow: some View {
		ZStack {
			ShimmerView()
			
			HStack {
				Text("")
				Spacer()
				Image(systemName: "chevron.right")
					.foregroundColor(Color.secondary)
			}
			.padding(.horizontal)
			.padding(.vertical, 8)
		}
		.padding(.horizontal)
		.padding(.bottom, 4)
	}
	
	var body: some View {
	
		VStack() {
			
			ForEach(1..<20) {_ in
				shimmerRow
			}
			
		}
		
	}
}

//struct ContentView_Preview: PreviewProvider {
//	static var previews: some View {
//		CountriesView(viewModel: CountriesViewModel(dataProvider: DataProvider()))
//	}
//}
