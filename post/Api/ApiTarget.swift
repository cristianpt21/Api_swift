//
//  ApiTarget.swift
//  post
//
//  Created by Stone web on 21/09/20.
//

import Foundation
import Alamofire

enum ApiTarget {
    
    case listAllPost
    case postInfo(id: Int)
}

extension ApiTarget {
    
    var baseURL: URL { URL(string: "https://jsonplaceholder.typicode.com")! }
    
    var path: String {
        switch self {
        case .listAllPost: return "/posts"
        case .postInfo(let id): return "/posts/\(id)/comments"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listAllPost, .postInfo:
            return .get
        }
    }
    
    var urlTarget: String {
        return baseURL.absoluteString + self.path
    }
}
