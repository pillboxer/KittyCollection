import SwiftUI
import SwiftData
import KittyCore

struct PackView<P: Pack>: View {
	
	let pack: P
	
	private let columns = Array(repeating: GridItem(.flexible()), count: 2)
	@EnvironmentObject private var interactor: CollectionInteractor<P>
	@Environment(\.modelContext) private var modelContext
	@Query private var entries: [Entry]
	
	var body: some View {
		ScrollView(content: makeGrid)
			.frame(maxHeight: .infinity)
	}
	
}

private extension PackView {
	func makeGrid() -> some View {
		LazyVGrid(columns: columns, spacing: 20) {
			ForEach(pack.items) { item in
				PackItemView(
					item: item,
					onTap: { interactor.showItemDetail(item) },
					image: { makeImage(item) }
				)
			}
		}
		.padding(.horizontal)
	}
	
	func makeImage(_ item: P.PackItem) -> Image {
		Image(
			entries.map(\.itemID).contains(item.id) ?? false
			? pack.fillImage
			: pack.outlineImage
		)
	}
}

private extension CodableStorageName {
	static let completedItems: CodableStorageName = "completedItems"
}
