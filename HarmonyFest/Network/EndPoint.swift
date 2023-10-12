//
//  EndPoint.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Foundation
import Alamofire

protocol EndPoint {
        
    var baseUrl : String                { get }
    
    var url: String                     { get }
    var httpMethod: HTTPMethod          { get }
    var parameters: Parameters?         { get }
    var encoding  : ParameterEncoding   { get }
    var headers   : HTTPHeaders?        { get }
}
