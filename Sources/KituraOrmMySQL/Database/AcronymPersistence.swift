//
//  AcronymPersistence.swift
//  CHTTPParser
//
//  Created by RB on 26.05.19.
//

import LoggerAPI
import SwiftKuery

class AcronymPersistence {
    static func getAll(callback: @escaping (_ acronyms: AcronymList?, _ error: Error?) -> Void) {
        Acronym.findAll { (acronyms, error) in
            guard error == nil else {
                callback(nil, error)
                Log.error("Cannot get acronyms here: \(String(describing: error))")
                return
            }
            
            // maybe we have no autor reference saved for our acronyms
            guard let autorIds = acronyms?.filter({ $0.autorFk > 0 }).compactMap({ $0.autorFk }) else {
                var acronymsWithoutAutor = [AcronymResult]()
                
                acronyms?.forEach({ (acronym) in
                    let acronymWithoutAutor = AcronymWithAutor(acronym: acronym, autor: nil)
                    let acronyResult = AcronymResult(acronym: acronymWithoutAutor)
                    acronymsWithoutAutor.append(acronyResult)
                })
                
                let acronymList = AcronymList(acronyms: acronymsWithoutAutor)
                callback(acronymList, error)
                return
            }
            
            let selectAutors = Select(from: autorTable).where(autorTable.id.in(autorIds))
            
            Autor.executeQuery(query: selectAutors, { (autors, error) in
                guard error == nil else {
                    Log.error("Error when trying to get autors from db: \(String(describing: error))")
                    callback(nil, error)
                    return
                }
                
                var acronymsWithAutor = [AcronymResult]()
                
                acronyms?.forEach({ (acronym) in
                    let autorForAcronym = autors?.filter({ $0.id == acronym.autorFk }).first
                    let acronymWithAutor = AcronymWithAutor(acronym: acronym, autor: autorForAcronym)
                    let acronymResult = AcronymResult(acronym: acronymWithAutor)
                    acronymsWithAutor.append(acronymResult)
                })
                
                let acronymList = AcronymList(acronyms: acronymsWithAutor)
                callback(acronymList, nil)
            })
        }
    }
    
    static func save(_ acronym: Acronym, callback: @escaping (_ acronym: Acronym?, _ error: Error?) -> Void) {
        acronym.save { (acronym, error) in
            if let errorValue = error {
                Log.error("Cannot save acronym here: \(errorValue)")
            }
            callback(acronym, error)
        }
    }
    
    static func update(_ acronym: Acronym, callback: @escaping (_ acronym: Acronym?, _ error: Error?) -> Void) {
        acronym.update(id: acronym.id) { (acronym, error) in
            if let errorValue = error {
                Log.error("Cannot update acronym here: \(errorValue)")
            }
            callback(acronym, error)
        }
    }
    
    static func delete(_ acronymID: Int, callback: @escaping (_ error: Error?) -> Void) {
        Acronym.delete(id: acronymID, { (error) in
            if let errorValue = error {
                Log.error("Cannot delete acronym here: \(errorValue)")
            }
            callback(error)
        })
    }
}
