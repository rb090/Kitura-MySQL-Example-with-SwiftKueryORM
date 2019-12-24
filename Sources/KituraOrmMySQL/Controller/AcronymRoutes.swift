//
//  AcronymRoutes.swift
//  CHTTPParser
//
//  Created by RB on 26.05.19.
//

import SwiftKuery
import KituraContracts
import LoggerAPI

func initializeAcronymRoutes(app: App) {
    app.router.get("/acronyms", handler: getAcronyms)
    app.router.post("/acronyms", handler: addAcronym)
    app.router.put("/acronyms", handler: updateAcronym)
    app.router.delete("/acronyms", handler: deleteAcronym)
}

private func getAcronyms(middleware: HeaderMiddleware, completion: @escaping (AcronymList?,
    RequestError?) -> Void) {
    Log.info("TEST header: \(middleware.hashHeader)")
    AcronymPersistence.getAll { (acronymList, error) in
        return completion(acronymList, error as? RequestError)
    }
}

private func addAcronym(acronym: Acronym, completion: @escaping (Acronym?,
    RequestError?) -> Void) {
    AcronymPersistence.save(acronym) { (acronyms, error) in
        return completion(acronyms, error as? RequestError)
    }
}

private func updateAcronym(id: Int, acronym: Acronym, completion: @escaping (Acronym?, RequestError?) -> Void) {
    let acronymToUpdate = Acronym(id: id, shortValue: acronym.shortValue, longValue: acronym.longValue, autorFk: acronym.autorFk)
    AcronymPersistence.update(acronymToUpdate) { (acronyms, error) in
        return completion(acronyms, error as? RequestError)
    }
}

private func deleteAcronym(id: Int, completion: @escaping
    (RequestError?) -> Void) {
    AcronymPersistence.delete(id) { (error) in
        return completion(error as? RequestError)
    }
}
