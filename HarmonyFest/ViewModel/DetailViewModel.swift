//
//  DetailViewModel.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Combine


class DetailViewModel: ObservableObject {
    
    var cancellables = [AnyCancellable]()
    
    @Published var performanceList : [Performance]? = nil
    @Published var isLoading = false
    @Published var error : String? = nil
    
    
    func getPerformances(artistId: Int) {
        
        self.isLoading = true
        
        JSONClient.makeAPICall(to: HarmonyFestEndPoint.getArtistPerformances(id: artistId), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = result.data ?? []

                }
                
            })
            .store(in: &cancellables)
        
    }
    
    func getPerformances(venueId: Int) {
        
        self.isLoading = true
        
        JSONClient.makeAPICall(to: HarmonyFestEndPoint.getVenuePerformances(id: venueId), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = result.data ?? []

                }
                
            })
            .store(in: &cancellables)
        
    }
    
}

