import MapKit
import SwiftUI

struct EntryDetailView<E: Entry>: View {
	private let entry: E
	
	//TODO: Refactor

	@State private var region: MKCoordinateRegion

	init(entry: E) {
		self.entry = entry
		self._region = State(initialValue: MKCoordinateRegion(
			center: CLLocationCoordinate2D(latitude: entry.latitude,
										   longitude: entry.longitude),
			span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
		))
	}

	var body: some View {
		VStack(spacing: 16) {
			Map(coordinateRegion: $region, annotationItems: [entry]) { _ in
				MapMarker(coordinate: CLLocationCoordinate2D(
					latitude: entry.latitude,
					longitude: entry.longitude
				))
			}
			.frame(height: 240)
			.clipShape(RoundedRectangle(cornerRadius: 12))

			VStack(alignment: .leading, spacing: 8) {
				Text(entry.title)
					.font(.title2)
					.fontWeight(.semibold)
				Text(entry.description)
					.font(.body)
					.foregroundStyle(.secondary)
			}
			.padding(.horizontal)

			Spacer()
		}
		.navigationTitle(entry.title)
		.navigationBarTitleDisplayMode(.inline)
	}
}

extension Entry where Self: Identifiable {}
