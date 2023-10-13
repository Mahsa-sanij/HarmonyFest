//
//  DetailViewModel.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    let networkClient : NetworkProtocol
    
    @Published var performanceList : [Performance]? = nil
    @Published var isLoading = false
    @Published var error : String? = nil
    
    var cancellables = [AnyCancellable]()

    init(networkClient: NetworkProtocol) {
        self.networkClient = networkClient
    }
    
    func getDateInterval() -> (String, String) {
        
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 14, to: from)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let fromDate = formatter.string(from: from)
        let toDate = formatter.string(from: to!)
        
        return (fromDate, toDate)
    }
    
    func getPerformances(artist: Entity) {
        
        self.isLoading = true
        
        let dateInterval = getDateInterval()
        
        networkClient.makeAPICall(to: HarmonyFestEndPoint.getArtistPerformances(id: artist.id ?? 0, from: dateInterval.0, to: dateInterval.1), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = (result.data ?? []).sorted

                }
                
            })
            .store(in: &cancellables)
        
    }
    
    func getPerformances(venue: Entity) {
        
        self.isLoading = true
        
        let dateInterval = getDateInterval()
        
        networkClient.makeAPICall(to: HarmonyFestEndPoint.getVenuePerformances(id: venue.id ?? 0, from: dateInterval.0, to: dateInterval.1), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = (result.data ?? []).sorted

                }
                
            })
            .store(in: &cancellables)
        
    }
}

