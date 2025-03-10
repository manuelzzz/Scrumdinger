//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State private var scrums = DailyScrum.sampleData
	
	var body: some Scene {
		WindowGroup {
			ScrumsView(scrums: $scrums)
		}
	}
}
