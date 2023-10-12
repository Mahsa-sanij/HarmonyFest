//
//  JsonClient.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation
import Alamofire
import Combine

enum JSONClient {
    
    static func makeAPICall( to endPoint: EndPoint) -> AnyCancellable {
        
        let url = URL(string: endPoint.url)!
        
        return AF.request( url as URLConvertible , method: endPoint.httpMethod, parameters: endPoint.parameters , encoding: endPoint.encoding  , headers: endPoint.headers)
            .publishData()
            .sink { response in
                
                print(String(data: response.data!, encoding: .utf8))
                
            }
    }
}
