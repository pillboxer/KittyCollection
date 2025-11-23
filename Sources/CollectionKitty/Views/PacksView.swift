import SwiftUI

public struct PacksView<P: Pack>: View {
	private let packs: [P]

	public init(packs: [P]) {
		self.packs = packs
	}

	public var body: some View {
		NavigationStack {
			List {
				ForEach(packs) { pack in
					Section(pack.title) {
						PackEntriesView(entries: pack.entries)
					}
				}
			}
			.navigationTitle("Packs")
		}
	}
}
