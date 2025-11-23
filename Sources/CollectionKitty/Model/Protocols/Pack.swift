import Foundation

public protocol Pack: Decodable, Identifiable {
	associatedtype SomeEntry: Entry
	var id: UUID { get }
	var title: String { get }
	var subtitle: String { get }
	var description: String { get }
	var entries: [SomeEntry] { get }
}
