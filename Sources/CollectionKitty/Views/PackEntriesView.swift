import SwiftUI

struct PackEntriesView<E: Entry>: View {
	let entries: [E]
	
	var body: some View {
		ForEach(entries) { entry in
			NavigationLink {
				EntryDetailView(entry: entry)
			} label: {
				makeEntryLabel(entry)
			}
		}
	}
}

private extension PackEntriesView {
	func makeEntryLabel(_ entry: E) -> some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(entry.title)
				.font(.headline)
			Text(entry.description)
				.font(.subheadline)
				.foregroundStyle(.secondary)
		}
	}
}
