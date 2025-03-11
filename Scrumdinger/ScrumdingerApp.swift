//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State private var store = ScrumStore()

	var body: some Scene {
		WindowGroup {
			ScrumsView(scrums: $store.scrums)
				.task {
					do {
						try await store.load()
					} catch {
						fatalError(error.localizedDescription)
					}
				}
		}
	}
}
