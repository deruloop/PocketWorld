//
//  PocketWorldApp.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 06/12/22.
//

import SwiftUI

@main
struct PocketWorldApp: App {

	@StateObject var coordinator = HomeCoordinator(title: "Countries", dataProvider: DataProvider())

	var body: some Scene {
		WindowGroup {
			HomeCoordinatorView(coordinator: coordinator)
		}
	}

}
