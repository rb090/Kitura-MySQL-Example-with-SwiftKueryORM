//
//  Acronym.swift
//  CHTTPParser
//
//  Created by RB on 26.05.19.
//

import SwiftKueryORM

struct Acronym: Model {    
    var id: Int?
    var shortValue: String?
    var longValue: String?
    
    var autorFk: Int?
    
    // override standard table name 'Acronym'
    static var tableName: String = "acronyms"
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case shortValue = "short_value"
        case longValue = "long_value"
        case autorFk = "autor_id"
    }
}
