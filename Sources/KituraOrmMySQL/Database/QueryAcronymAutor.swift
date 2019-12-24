//
//  QueryAcronymAutor.swift
//  CHTTPParser
//
//  Created by RB on 31.05.19.
//

import SwiftKueryORM

struct QueryAcronymAutor: QueryParams {
    // howto: https://developer.ibm.com/swift/2018/06/08/filtering-swift-kuery-orm/
    let autorIds: InclusiveRange<Int>
}
