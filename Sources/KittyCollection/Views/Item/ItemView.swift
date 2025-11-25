import SwiftUI

struct ItemView<I: Item>: View {
	
	let item: I
	
	var body: some View {
		Text(item.description)
	}
	
}
