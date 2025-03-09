//
//  CardView.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import SwiftUI

struct CardView: View {
	let scrum: DailyScrum

	var body: some View {
		VStack(alignment: .leading) {
			Text(scrum.title)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
			Spacer()
			HStack {
				Label("\(scrum.attendees.count)", systemImage: "person.3")
					.accessibilityLabel("\(scrum.attendees.count) attendees")
				Spacer()
				Label("\(scrum.lengthInMinutes)", systemImage: "clock")
					.labelStyle(.trailingIcon)
					.accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
			}
			.font(.caption)
		}
		.padding()
		.foregroundColor(scrum.theme.accentColor)
	}
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
	let scrum = DailyScrum.sampleData[0]
	CardView(scrum: scrum)
		.background(scrum.theme.mainColor)
}
