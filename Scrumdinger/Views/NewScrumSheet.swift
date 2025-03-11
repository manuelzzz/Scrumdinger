//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Manuel Santos Souza on 10/03/25.
//

import SwiftUI

struct NewScrumSheet: View {
	@State private var newScrum: DailyScrum = DailyScrum.emptyScrum
	@Binding var scrums: [DailyScrum]
	@Binding var isPresentingNewScrumView: Bool

	var body: some View {
		NavigationStack {
			DetailEditView(scrum: $newScrum)
				.toolbar {
					ToolbarItem(placement: .cancellationAction) {
						Button("Cancel") {
							isPresentingNewScrumView = false
						}
					}
					ToolbarItem(placement: .confirmationAction) {
						Button("Add") {
							scrums.append(newScrum)
							print(scrums)
							isPresentingNewScrumView = false
						}
					}
				}
		}
	}
}

#Preview {
	NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
}
