//
//  Application.swift
//  CHTTPParser
//
//  Created by RB on 26.05.19.
//

import SwiftKueryMySQL
import SwiftKuery
import Kitura
import LoggerAPI
import SwiftKueryORM

public class App {
    
    let router = Router()
    
    private func postInit() {
        let connectionPoolOptions = ConnectionPoolOptions.init(initialCapacity: 1, maxCapacity: 1)
        let connectionPool = MySQLConnection.createPool(host: "localhost", user: "backend_swift", password: "swiftyBackend60", database: "swiftBackendTest", port: 3306, characterSet: nil, connectionTimeout: 10000, poolOptions: connectionPoolOptions)
        Database.default = Database(connectionPool)
        
        finalizeRoutes()
    }
    
    private func finalizeRoutes() {
        initializeAcronymRoutes(app: self)
        Log.info("Acronym routes created")
    }
    
    public func run() {
        postInit()
        
        /*#if os(Linux)
    
        let myCertFile = "/Creds/cert.pem"
        let myKeyFile = "/Creds/key.pem"
        
        let mySSLConfig =  SSLConfig(withCACertificateDirectory: nil,
                                     usingCertificateFile: myCertFile,
                                     withKeyFile: myKeyFile,
                                     usingSelfSignedCerts: true)
        #else // on macOS
        
        let myCertKeyFile = "/Users/rb/Documents/Kitura/KituraOrmMySQL/Creds/cert.pfx"
        
        let mySSLConfig =  SSLConfig(withChainFilePath: myCertKeyFile,
                                     withPassword: "test123",
                                     usingSelfSignedCerts: true)
        
        #endif
        
        Kitura.addHTTPServer(onPort: 8090, with: router, withSSL: mySSLConfig)*/
        
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}
