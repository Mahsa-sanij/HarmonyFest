//
//  JsonClient.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation
import Alamofire
import Combine


protocol NetworkProtocol {
    
    func makeAPICall<T : Decodable>(to endPoint: EndPoint, type: T.Type) -> AnyPublisher<Result<T> , Never>
    
}

struct NetworkClient : NetworkProtocol {
    
    func makeAPICall<T>(to endPoint: EndPoint, type: T.Type) -> AnyPublisher<Result<T> , Never> {
        
        let url = URL(string: endPoint.url)!
        
        return AF.request( url as URLConvertible , method: endPoint.httpMethod, parameters: endPoint.parameters , encoding: endPoint.encoding  , headers: endPoint.headers)
            
            .validate()
            .publishDecodable(type: [T].self)
            .map { response in
                
                var status = Status.Success
                var description : String? = nil
                
                
                if let error = response.error {
                    switch error {
                        
                    case .invalidURL(let url):
                        status = .Failure
                        description = "Invalid URL: \(url) - \(error.localizedDescription)"
                        
                        
                    case .parameterEncodingFailed(_):
                        status = .Failure
                        description = "Parameter encoding failed: \(error.localizedDescription)"
                        
                    case .multipartEncodingFailed(_):
                        status = .Failure
                        description = "Multipart encoding failed: \(error.localizedDescription)"
                        
                        
                    case .responseValidationFailed(let reason):
                        status = .Failure
                        description = "Response validation failed: \(error.localizedDescription)"
                        
                        switch reason {
                        case .dataFileNil, .dataFileReadFailed:
                            print("Downloaded file could not be read")
                        case .missingContentType(let acceptableContentTypes):
                            print("Content Type Missing: \(acceptableContentTypes)")
                        case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                            print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                        case .unacceptableStatusCode(let code):
                            print("Response status code was unacceptable: \(code)")
                        case .customValidationFailed(_):
                            print("Custom Validation Failed")
                        }
                    case .responseSerializationFailed(_):
                        status = .Failure
                        description = "Response Serialization failed: \(error.localizedDescription)"
                        
                        
                    default:
                        status = .Failure
                        description = "Underlying Error : \(String(describing: error.underlyingError) )"
                    }
                }
                
                let array = response.data
                    .flatMap { data in
                        try? JSONDecoder().decode([T].self, from: data)
                    }
                
                return Result<T>(status: status, errorDescription: description, data: array)
                
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
}

