import SwiftUI

struct ItemView<I: Item>: View {
	
	let item: I
	let onTap: () -> Void
	
	var body: some View {
		Text(item.description)
		Button("Add", action: onTap) 
	}
	
}
