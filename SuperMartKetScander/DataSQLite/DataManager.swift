//
//  DataManager.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/22/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit
import SQLite

class DataManager {
    static let shared = DataManager()
    public let connection: Connection?
    public let databaseFileName = "sqliteSuperMarket.sqlite3"
    private init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String!
        do {
            connection = try Connection("\(dbPath!)/(databaseFileName)")
        } catch {
            connection = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
}
