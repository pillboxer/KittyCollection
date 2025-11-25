import SwiftUI
import CoreKitty

struct PackView<P: Pack>: View {
	
	let pack: P
	
	private let columns = Array(repeating: GridItem(.flexible()), count: 2)
	@CodableStorage(.completedItems) private var completedItems: Set<P.PackItem>?
	@EnvironmentObject private var interactor: CollectionInteractor<P>
	
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
			completedItems?.contains(item) ?? false
			? pack.fillImage
			: pack.outlineImage
		)
	}
}

private extension CodableStorageName {
	static let completedItems: CodableStorageName = "completedItems"
}
