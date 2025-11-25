import KittyCore
import SwiftUI

struct PacksView<P: Pack, D: View>: View {
	private let packs: [P]
	private let interactor: CollectionInteractor<P>
	private let makeDestination: (CollectionRouteStep<P>) -> D

	init(
		interactor: CollectionInteractor<P>,
		makeDestination: @escaping (CollectionRouteStep<P>) -> D
	) {
		self.interactor = interactor
		self.makeDestination = makeDestination
		@JSON(name: "pack_container") var pack: P?
		self.packs =  [pack].compactMap(\.self)
	}
	
	var body: some View {
		List(content: makeListContent)
			.navigationTitle("Packs")
			.navigationDestination(
				for: CollectionRouteStep<P>.self,
				destination: makeDestination
			)
	}
}

private extension PacksView {
	func makeListContent() -> some View {
		ForEach(packs, content: makeLabel)
			.listRowSeparator(.hidden)
	}
	
	
	func makeLabel(_ pack: P) -> some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(pack.title).font(.title3).bold()
			Text(pack.subtitle).font(.callout).foregroundStyle(.secondary)
			Text(pack.description).font(.footnote).fontWeight(.semibold)
		}
		.onTapGesture { interactor.showPackDetail(pack) }
	}
}
