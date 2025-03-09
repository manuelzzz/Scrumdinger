//
//  ScrumViews.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

struct ScrumsViews: View {
	let scrums: [DailyScrum]

	var body: some View {
		List(scrums) { scrum in
			CardView(scrum: scrum)
				.listRowBackground(scrum.theme.mainColor)
		}
	}
}

#Preview {
	ScrumsViews(scrums: DailyScrum.sampleData)
}
