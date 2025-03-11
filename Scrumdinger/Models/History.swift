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
	
	init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
		self.id = id
		self.date = date
		self.attendees = attendees
	}
}
