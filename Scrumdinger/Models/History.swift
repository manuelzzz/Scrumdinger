//
//  History.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 10/03/25.
//

import Foundation

struct History: Identifiable, Codable {
	var id: UUID
	let date: Date
	var attendees: [DailyScrum.Attendee]
	var transcript: String?

	init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], transcript: String? = nil) {
		self.id = id
		self.date = date
		self.attendees = attendees
		self.transcript = transcript
	}
}
