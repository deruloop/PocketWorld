//
//  Colors.swift
//  PocketWorld
//
//  Created by Cristiano Calicchia on 12/12/22.
//

import Foundation
import SwiftUI

private struct GradientConstants {
	static let color0 = Color(red: 238/255, green: 130/255, blue: 238/255).opacity(0.5)
	static let color1 = Color(red: 0/255, green: 0/255, blue: 255/255).opacity(0.5)
}

public var appBackground: LinearGradient {
	return LinearGradient(
		gradient: Gradient(colors: [GradientConstants.color0, GradientConstants.color1]),
		startPoint: .init(x: 0.50, y: 0.00),
		endPoint: .init(x: 0.50, y: 1.00)
	)
}

public var customAccentColor: Color {
	return Color(UIColor(red: 92/255, green: 100/255, blue:221/255 , alpha: 1))
}
