import SwiftUI

struct PackItemView<I: Item>: View {
	let item: I
	let onTap: () -> Void
	let image: () -> Image
	
	var body: some View {
		VStack {
			makeImage()
			makeItemTitle()
		}
	}
}

private extension PackItemView {
	func makeImage() -> some View {
		image()
			.resizable()
			.aspectRatio(contentMode: .fit)
			.frame(maxHeight: 88)
			.animation(.default)
			.onTapGesture(perform: onTap)
	}
	
	func makeItemTitle() -> some View {
		Text(item.title)
			.font(.caption2)
			.lineLimit(1)
			.minimumScaleFactor(0.3)
			.multilineTextAlignment(.center)
	}
}
