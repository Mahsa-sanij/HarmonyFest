//
//  MasterViewModel.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Combine


enum MasterDisplayMode: String, CaseIterable, Identifiable {
    case Artists, Venues
    var id: Self { self }
}


class MasterViewModel: ObservableObject {
    
    let networkClient : NetworkProtocol
    
    @Published var selectionMode: MasterDisplayMode = .Artists
    @Published var artistList : [Artist]? = nil
    @Published var venueList : [Venue]? = nil
    @Published var isLoading = false
    @Published var error : String? = nil
    
    var cancellables = [AnyCancellable]()

    init(networkClient: NetworkProtocol) {
        
        self.networkClient = networkClient
        
        $selectionMode
            .removeDuplicates()
            .sink { value in
                if value == .Artists {
                    self.getArtists()
                }
                else {
                    self.getVenues()
                }
            }
            .store(in: &cancellables)
    }
    
    func getArtists() {
        
        self.isLoading = true
        
        networkClient.makeAPICall(to: HarmonyFestEndPoint.getArtists, type: Artist.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.artistList = (result.data ?? []).sorted

                }
                
            })
            .store(in: &cancellables)
        
    }
    
    func getVenues() {
        
        self.isLoading = true
        
        networkClient.makeAPICall(to: HarmonyFestEndPoint.getVenues, type: Venue.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.venueList = (result.data ?? []).sorted

                }
                
                
            })
            .store(in: &cancellables)
        
    }
    
}
