//
//  AcronymTable.swift
//  CHTTPParser
//
//  Created by RB on 04.06.19.
//

import SwiftKuery

class AcronymTable: Table {
    let tableName = "acronyms"
    let id = Column("id", Int32.self)
    let shortValue = Column("short_value", String.self)
    let longValue = Column("long_value", String.self)
    let autor_fk = Column("autor_id", Int32.self)
}

let acronymsTable = AcronymTable()
