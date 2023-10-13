//
//  DetailViewModelTests.swift
//  HarmonyFestTests
//
//  Created by Mahsa Sanij on 10/13/23.
//

import XCTest
@testable import HarmonyFest


final class DetailViewModelTests: XCTestCase {
    
    let mockNetworkFailure = NetworkClientFailureMock()
    
    func test_whenGetPerformancesFails_thenErrorValueNotNil(){
        
        let viewModel = DetailViewModel(networkClient: mockNetworkFailure)
        viewModel.getPerformances(artist: Artist.artist1)
        XCTAssertNotNil(viewModel.error)
        
    }

}
