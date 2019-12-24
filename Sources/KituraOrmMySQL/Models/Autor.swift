//
//  Autor.swift
//  CHTTPParser
//
//  Created by RB on 31.05.19.
//

import SwiftKueryORM

struct Autor: Model {
    var id: Int = 0
    var name: String?
    var email: String?
    
    // override standard table name 'Autor'
    static var tableName: String = "autor"
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
    }
}
