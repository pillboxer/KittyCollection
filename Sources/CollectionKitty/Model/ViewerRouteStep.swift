import CoreKitty

enum CollectionRouteStep<P: Pack>: Routable {
	case packDetail(P)
	case itemDetail(P.PackItem)
}

extension Router {
	func setStep<P: Pack>(to step: CollectionRouteStep<P>) {
		setRoutingStep(to: step)
	}
}
