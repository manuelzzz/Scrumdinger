//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 09/03/25.
//

import AVFoundation
import SwiftUI

struct MeetingView: View {
	@State private var isRecording = false
	@Binding var scrum: DailyScrum
	@StateObject var scrumTimer = ScrumTimer()
	@StateObject var speechRecognizer = SpeechRecognizer()

	private var player: AVPlayer { return AVPlayer.sharedDingPlayer }

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 16)
				.fill(scrum.theme.mainColor)
			VStack {
				MeetingHeaderView(
					secondsElapsed: scrumTimer.secondsElapsed,
					secondsRemaining: scrumTimer.secondsRemaining,
					theme: scrum.theme)
				MeetingTimerView(
					speakers: scrumTimer.speakers,
					theme: scrum.theme)
				MeetingFooterView(
					speakers: scrumTimer.speakers,
					skipAction: scrumTimer.skipSpeaker)
			}
			.padding()
			.foregroundColor(scrum.theme.accentColor)
			.onAppear {
				startScrum()
			}
			.onDisappear {
				endScrum()
			}
			.navigationBarTitleDisplayMode(.inline)
		}
	}

	private func startScrum() {
		scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
		scrumTimer.speakerChangedAction = {
			player.seek(to: .zero)
			player.play()
		}
		speechRecognizer.resetTranscript()
		speechRecognizer.startTranscribing()
		isRecording = true
		scrumTimer.startScrum()
	}

	private func endScrum() {
		scrumTimer.stopScrum()
		speechRecognizer.stopTranscribing()
		isRecording = false
		let newHistory = History(attendees: scrum.attendees)
		scrum.history.insert(newHistory, at: 0)
	}
}

#Preview {
	MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
