import SwiftUI

public struct CollectionScene<Content: View>: Scene {
	
	public let content: () -> Content
	
	public init(content: @escaping () -> Content) {
		self.content = content
	}
	
	public var body: some Scene {
		WindowGroup(makeContent: content)
			.modelContainer(for: Entry.self)
	}
	
}
