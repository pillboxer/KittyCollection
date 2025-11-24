import Foundation

public protocol Pack: Decodable, Identifiable {
	associatedtype PackItem: Item
	var id: UUID { get }
	var title: String { get }
	var subtitle: String { get }
	var description: String { get }
	var outlineImage: String { get }
	var fillImage: String { get }
	var items: [PackItem] { get }
}
