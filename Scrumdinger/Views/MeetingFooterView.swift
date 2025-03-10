//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 10/03/25.
//

import SwiftUI

struct MeetingFooterView: View {
	let speakers: [ScrumTimer.Speaker]
	let skipAction: () -> Void

	private var speakerNumber: Int? {
		guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
		return index + 1
	}

	private var isLastSpeaker: Bool {
		return speakers.dropLast().allSatisfy { $0.isCompleted }
	}

	private var speakerText: String {
		guard let speakerNumber = speakerNumber else { return "" }
		return "Speaker \(speakerNumber) of \(speakers.count)"
	}

	var body: some View {
		VStack {
			HStack {
				if isLastSpeaker {
					Text("Last Speaker")
				} else {
					Text(speakerText)
					Spacer()
					Button(action: skipAction) {
						Image(systemName: "forward.fill")
					}
					.accessibilityLabel("Next speaker")
				}
			}
		}
		.padding([.bottom, .horizontal])
	}
}

#Preview(traits: .sizeThatFitsLayout) {
	MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
}
