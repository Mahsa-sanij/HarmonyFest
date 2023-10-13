//
//  DetailViewModel.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    var cancellables = [AnyCancellable]()
    
    @Published var performanceList : [Performance]? = nil
    @Published var isLoading = false
    @Published var error : String? = nil
    
    
    func getPerformances(artist: Entity) {
        
        self.isLoading = true
        
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 14, to: from)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let fromDate = formatter.string(from: from)
        let toDate = formatter.string(from: to!)
        
        JSONClient.makeAPICall(to: HarmonyFestEndPoint.getArtistPerformances(id: artist.id ?? 0, from: fromDate, to: toDate), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = (result.data ?? []).sorted(by: {
                        $0.date ?? "" < $1.date ?? ""
                    })

                }
                
            })
            .store(in: &cancellables)
        
    }
    
    func getPerformances(venue: Entity) {
        
        self.isLoading = true
        
        let from = Date()
        let to = Calendar.current.date(byAdding: .day, value: 14, to: from)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let fromDate = formatter.string(from: from)
        let toDate = formatter.string(from: to!)
        
        JSONClient.makeAPICall(to: HarmonyFestEndPoint.getVenuePerformances(id: venue.id ?? 0, from: fromDate, to: toDate), type: Performance.self)
            .sink(receiveValue: { result in
                
                self.isLoading = false
                
                switch result.status {
                    
                case .Failure:
                    
                    self.error = result.errorDescription
                    
                case .Success:
                    
                    self.error = nil
                    self.performanceList = (result.data ?? []).sorted(by: {
                        $0.date ?? "" < $1.date ?? ""
                    })

                }
                
            })
            .store(in: &cancellables)
        
    }
}

