//
//  Theme.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
	case bubblegum
	case buttercup
	case indigo
	case lavender
	case magenta
	case navy
	case orange
	case oxblood
	case periwinkle
	case poppy
	case purple
	case seafoam
	case sky
	case tan
	case teal
	case yellow

	var accentColor: Color {
		switch self {
		case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
		case .indigo, .magenta, .navy, .oxblood, .purple: return .white
		}
	}

	var name: String {
		rawValue.capitalized
	}

	var mainColor: Color {
		Color(rawValue)
	}
	
	var id: String {
		name
	}
}
