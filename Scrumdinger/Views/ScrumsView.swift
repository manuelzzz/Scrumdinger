//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

struct ScrumsView: View {
	@Binding var scrums: [DailyScrum]
	@Environment(\.scenePhase) private var scenePhase
	@State private var isPresentingNewScrumView: Bool = false
	let saveAction: () -> Void

	var body: some View {
		NavigationStack {
			List($scrums) { $scrum in
				NavigationLink(destination: DetailView(scrum: $scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: {
					isPresentingNewScrumView = true
				}) {
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
		.sheet(isPresented: $isPresentingNewScrumView) {
			NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
		}.onChange(
			of: scenePhase
		) { oldPhase, newPhase in
			if newPhase == .inactive {
				saveAction()
			}
		}
	}
}

#Preview {
	ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
