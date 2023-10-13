//
//  MasterViewModelTests.swift
//  HarmonyFestTests
//
//  Created by Mahsa Sanij on 10/13/23.
//

import XCTest
@testable import HarmonyFest

final class MasterViewModelTests: XCTestCase {

    var mockNetworkFailure = NetworkClientFailureMock()

    func test_whenGetVenuesCallIsDone_thenIsLoadingBecomesFalse(){
        
        let viewModel = MasterViewModel(networkClient: mockNetworkFailure)
        mockNetworkFailure.callback = {
            XCTAssertFalse(viewModel.isLoading)
        }
        viewModel.getVenues()
        
    }
    
}
