import SwiftUI

struct PackView<P: Pack>: View {
	
	let pack: P
	
	private let columns = Array(repeating: GridItem(.flexible()), count: 3)
	@CodableStorage(.completedItems) private var completedItems: Set<P.PackItem>?
	
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
					onTap: { withAnimation { _completedItems.toggle(element: item) } },
					image: { makeImage(item) }
				)
			}
		}
		.padding(.horizontal)
	}
	
	func makeImage(_ item: P.PackItem) -> Image {
		Image(
			completedItems?.contains(item) ?? false
			? pack.fillImage
			: pack.outlineImage
		)
	}
}

private extension CodableStorageName {
	static let completedItems: CodableStorageName = "completedItems"
}
