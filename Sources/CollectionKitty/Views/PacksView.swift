import SwiftUI

public struct PacksView<P: Pack>: View {
	private let packs: [P]

	public init(packs: [P]) {
		self.packs = packs
	}

	public var body: some View {
		NavigationStack {
			List(content: makeListContent)
				.navigationTitle("Packs")
		}
	}
}

private extension PacksView {
	func makeListContent() -> some View {
		ForEach(packs, content: makeNavigationLink)
			.listRowSeparator(.hidden)
	}
	
	// TODO: Move to router
	func makeNavigationLink(_ pack: P) -> some View {
		NavigationLink {
			PackView(pack: pack)
		} label: {
			makeLabel(pack)
		}
	}
	
	func makeLabel(_ pack: P) -> some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(pack.title).font(.title3).bold()
			Text(pack.subtitle).font(.callout).foregroundStyle(.secondary)
			Text(pack.description).font(.footnote).fontWeight(.semibold)
		}
	}
}
