import SwiftUI
import FirebaseFirestoreSwift
@_spi(Experimental) import MapboxMaps

struct MapView: View {
    //@StateObject var viewModel = MapViewViewModel()
    @StateObject var viewModel: TripViewViewModel
    @FirestoreQuery var trips: [TripItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._trips = FirestoreQuery(
            collectionPath: "users/\(userId)/trips")
        self._viewModel = StateObject(wrappedValue:
                                        TripViewViewModel(userId: userId)
        )
    }

    var body: some View {
        NavigationView {
            VStack {
                let middle = CLLocationCoordinate2D(latitude: 39.5, longitude: -98.0)

                Map(initialViewport: .camera(center: middle, zoom: 2, bearing: 0, pitch: 0)) {
                    MapViewAnnotation(coordinate: CLLocationCoordinate2D(latitude: 39.5, longitude: -98.0)) {
                        Text("🚀")
                            .frame(width: 20, height: 20)
                            .background(Circle().fill(.red))
                    }
                }
            }
            .ignoresSafeArea()
            .toolbar {
                Button {
                    viewModel.showingNewTripView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewTripView) {
                NewTripView(newTripPresented: $viewModel.showingNewTripView)
            }
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(userId: "")
    }
}
