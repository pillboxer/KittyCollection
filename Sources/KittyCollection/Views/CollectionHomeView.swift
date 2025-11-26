import KittyCore
import SwiftData
import SwiftUI

public struct CollectionHomeView<P: Pack>: View {
	
	@Environment(\.modelContext) private var modelContext
	private let router = Router()
	
	public init() {}
	
	public var body: some View {
		ModuleView(router: router)
			.interacting(with: CollectionInteractor.self)
			.rooted { interactor in
				PacksView(
					interactor: interactor,
					makeDestination: { makeDestination($0).environmentObject(interactor) }
				)
			}
	}
}

private extension CollectionHomeView {
	@ViewBuilder
	func makeDestination(_ step: CollectionRouteStep<P>) -> some View {
		switch step {
		case .packDetail(let pack):
			PackView<P>(pack: pack)
		case .itemDetail(let item):
			ItemView(item: item) {
				modelContext.insert(Entry(itemID: item.id))
			}
		}
	}
}
