import KittyCore

final class CollectionInteractor<P: Pack>: Interactor {
	
	func showPackDetail(_ pack: P) {
		router.setStep(to: .packDetail(pack))
	}
	
	func showItemDetail(_ item: P.PackItem) {
		router.setStep(to: CollectionRouteStep<P>.itemDetail(item))
	}
	
}
