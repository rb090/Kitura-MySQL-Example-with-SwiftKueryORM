//
//  AutorTable.swift
//  CHTTPParser
//
//  Created by RB on 04.06.19.
//

import SwiftKuery

class AutorTable: Table {
    let tableName = "autor"
    let id = Column("id", Int32.self)
    let name = Column("name", String.self)
    let email = Column("email", String.self)
}

let autorTable = AutorTable()
