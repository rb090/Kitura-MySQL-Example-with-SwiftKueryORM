//
//  HeaderMiddleware.swift
//  CHTTPParser
//
//  Created by RB on 30.05.19.
//

import Kitura
import LoggerAPI

struct HeaderMiddleware: TypeSafeMiddleware {
    let hashHeader: String
    
    static func handle(request: RouterRequest, response: RouterResponse, completion: @escaping (HeaderMiddleware?, RequestError?) -> Void) {
        guard let expectedHeader = request.headers["Auth-Header-Hash"] else {
            Log.error("unauthentificated user")
            return completion(nil, .badRequest)
        }
        
        let selfInstance: HeaderMiddleware = HeaderMiddleware(hashHeader: expectedHeader)
        completion(selfInstance, nil)
    }
}
