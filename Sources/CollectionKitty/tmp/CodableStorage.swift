import SwiftUI

/// A property wrapper for storing and retrieving `Codable` types in `AppStorage` (ie UserDefaults)
///
/// This wrapper encodes the wrapped `Codable` value into `Data` and saves it to `AppStorage`. If no
/// data exists or decoding fails, it returns `nil`.
/// When the value is set to `nil`, the stored data is cleared.
///
/// - Parameter name: The `CodableStorageName` key used to identify the `AppStorage` location.
@propertyWrapper public struct CodableStorage<C: Codable>: DynamicProperty {
	private var value: AppStorage<Data?>

	public var wrappedValue: C? {
		get {
			guard let data = value.wrappedValue,
			      let decoded = try? JSONDecoder().decode(C.self, from: data) else { return nil }
			return decoded
		} nonmutating set {
			if newValue == nil { return value.wrappedValue = nil }
			value.wrappedValue = try? JSONEncoder().encode(newValue)
		}
	}

	public init(_ name: CodableStorageName) {
		value = AppStorage(name.value)
	}
}

public extension CodableStorage where C: SetAlgebra {
	func toggle(element: C.Element) {
		var currentSet = wrappedValue ?? C()
		if currentSet.contains(element) {
			currentSet.remove(element)
		} else {
			currentSet.insert(element)
		}
		wrappedValue = currentSet
	}
}

public extension CodableStorage where C: RangeReplaceableCollection, C.Element: Equatable {
	func append(_ element: C.Element, maxSize: Int) {
		var currentArray = wrappedValue ?? C()
		if let existingIndex = currentArray.firstIndex(of: element) {
			currentArray.remove(at: existingIndex)
		}
		currentArray.insert(element, at: currentArray.startIndex)
		if currentArray.count > maxSize {
			let indexToRemove = currentArray.index(currentArray.endIndex, offsetBy: -1)
			currentArray.remove(at: indexToRemove)
		}

		wrappedValue = currentArray
	}

	func toggle(element: C.Element) {
		var currentArray = wrappedValue ?? C()
		if currentArray.contains(element) {
			currentArray.removeAll { $0 == element }
		} else {
			currentArray.append(element)
		}
		wrappedValue = currentArray
	}

	func remove(element: C.Element) {
		var currentArray = wrappedValue ?? C()
		currentArray.removeAll { $0 == element }
		wrappedValue = currentArray
	}
}

public struct CodableStorageName: ExpressibleByStringLiteral, Sendable {
	let value: String

	public init(_ value: String) {
		self.value = value
	}

	public init(stringLiteral value: StringLiteralType) {
		self.value = value
	}
}
