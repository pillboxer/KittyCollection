import Foundation
import SwiftData

@Model
final class Entry {
	var itemID: UUID
	var date: Date
	
	init(itemID: UUID, date: Date = .now) {
		self.itemID = itemID
		self.date = date
	}
}
