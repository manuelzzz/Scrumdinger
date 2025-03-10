//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

struct ScrumsView: View {
	let scrums: [DailyScrum]

	var body: some View {
		NavigationStack {
			List(scrums) { scrum in
				NavigationLink(destination: DetailView(scrum: scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: {}) {
					Image(systemName: "plus")
						.accessibilityLabel("New Scrum")
				}
			}
		}
	}
}

#Preview {
	ScrumsView(scrums: DailyScrum.sampleData)
}
