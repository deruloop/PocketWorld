//
//  CityView.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 03/12/22.
//

import SwiftUI

struct CountryView: View {
	
	@ObservedObject var viewModel: CountryViewModel
	
	var body: some View {
		
		ZStack(alignment: .top) {
			Rectangle()
				.fill(appBackground)
				.edgesIgnoringSafeArea(.all)
			
			VStack(spacing: 4) {
				Text(viewModel.country.emoji)
					.font(.largeTitle)
					.multilineTextAlignment(.center)
				Text(viewModel.country.name)
					.font(.largeTitle).bold()
					.padding(.bottom)
				
				CountryInfo(infoType: "Native", info: viewModel.country.native)
				CountryInfo(infoType: "Capital", info: viewModel.country.capital)
				CountryInfo(infoType: "Currency", info: viewModel.country.currency)
				CountryInfo(infoType: "Continent", info: viewModel.country.continent.name)
				CountryInfo(infoType: "Languages", info: getLanguageString(from: viewModel.country.languanges))
			}
			.padding(.horizontal)
		}
		.onAppear {
			viewModel.onAppear()
		}
	}
	
	func getLanguageString(from array: [Countries.Language]) -> String {
		var text = ""
		for (index,languange) in array.enumerated() {
			text += languange.name + (index == array.count-1 ? "" : ", ")
		}
		return text
	}
}

struct CountryInfo: View {
	let infoType: String
	let info: String
	
	var body: some View {
		if !info.isEmpty {
			HStack(alignment: .top) {
				Text("\(infoType):")
					.font(.headline).bold()
				Text(info)
					.font(.body)
				Spacer()
			}
		}
	}
}
