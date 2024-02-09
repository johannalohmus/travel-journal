/*import MapboxGeocoding
import Combine

class GeocodingService: ObservableObject {
    private let geocodingClient = Geocoding(accessToken: "YOUR_MAPBOX_ACCESS_TOKEN")
    private var cancellables: Set<AnyCancellable> = []

    @Published var searchResults: [GeocodedPlacemark] = []

    func search(query: String) {
        geocodingClient.geocode(ForwardGeocodeOptions(query: query)) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.searchResults = response.features
            case .failure(let error):
                print("Geocoding error: \(error.localizedDescription)")
            }
        }
    }
}
*/
