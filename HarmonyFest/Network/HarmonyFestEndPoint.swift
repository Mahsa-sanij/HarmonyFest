//
//  HarmonyFestEndPoint.swift
//  HarmonyFest
//
//  Created by Mahsa Sanij on 10/12/23.
//

import Alamofire

enum HarmonyFestEndPoint: EndPoint {
    
    case getArtists
    case getVenues
    case getArtistPerformances(id: Int, from:String, to: String)
    case getVenuePerformances(id: Int, from:String, to: String)
    
    var baseUrl: String {
        return "http://ec2-44-211-66-223.compute-1.amazonaws.com/"
    }
    
    var url: String {
        
        switch self {
            
        case .getArtists:
            return baseUrl + "artists"
        case .getVenues:
            return baseUrl + "venues"
        case .getArtistPerformances(let id, let from, let to):
            return baseUrl + "artists/\(id)/performances?from=\(from)&to=\(to)"
        case .getVenuePerformances(let id, let from, let to):
            return baseUrl + "venues/\(id)/performances?from=\(from)&to=\(to)"
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        
        return .get
    }
    
    var parameters: Alamofire.Parameters? {
        return nil
    }
    
    var encoding: Alamofire.ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: Alamofire.HTTPHeaders? {
        return nil
    }
    
}
