//
//  NetworkClientMock.swift
//  HarmonyFestTests
//
//  Created by Mahsa Sanij on 10/13/23.
//

@testable import HarmonyFest
import Foundation
import Combine

struct NetworkClientFailureMock: NetworkProtocol {
    
    var callback : (() -> ()?)?
    
    func makeAPICall<T>(to endPoint: HarmonyFest.EndPoint, type: T.Type) -> AnyPublisher<HarmonyFest.Result<T>, Never> where T : Decodable {
        
        callback?()
        return Just(Result.init(status: .Failure, errorDescription: "No internet connection.", data: nil))
            .eraseToAnyPublisher()

    }
    
}
