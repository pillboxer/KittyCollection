import Foundation

public protocol Item: Codable, Identifiable, Hashable {
	var id: UUID { get }
	var title: String { get }
	var description: String { get }
	var longitude: Double { get }
	var latitude: Double { get }
}
