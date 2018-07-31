//
//  SPSProductEntity.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/22/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import Foundation
import SQLite

class SPSProductManagerInputEntity {
    
    // nametable
    static let shared = SPSProductManagerInputEntity()
    private let kNameTable = Table(kNameTbDataProduct)
    
    private let Id = Expression<Int64>("Id")
    private let codePr = Expression<String>("codePr")
    private let namePr = Expression<String>("namePr")
    private let manufacture = Expression<String>("manufacture")
    private let dateOfManuFactire = Expression<Date>("dateOfManuFactire")
    private let expiryDate = Expression<Date>("expiryDate")
    private let dateOfEntry = Expression<Date>("dateOfEntry")
    private let pointForSave = Expression<Double>("pointForSave")
    private let saleOff = Expression<Double>("saleOff")
    private let improtPrice = Expression<Double>("improtPrice")
    private let priceforSale = Expression<Double>("priceforSale")
    private let isSale = Expression<Bool>("isSale")
    private let productReturn = Expression<Double>("productReturn")
    private let unit = Expression<String>("unit")
    private let countProductInput = Expression<Double>("countProductInput")
    private let historyProductInput = Expression<Double>("historyProductInput")
    private let historyProductOutPut = Expression<Double>("historyProductOutPut")
    private let historyProductReturn = Expression<Double>("historyProductReturn")
    
    init() {
        //Create table if not exists
        do {
            if let connection = DataManager.shared.connection {
                try connection.run(kNameTable.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.Id, primaryKey: true)
                    table.column(self.codePr)
                    table.column(self.namePr)
                    table.column(self.manufacture)
                    table.column(self.dateOfManuFactire)
                    table.column(self.expiryDate)
                    table.column(self.dateOfEntry)
                    table.column(self.pointForSave)
                    table.column(self.saleOff)
                    table.column(self.improtPrice)
                    table.column(self.priceforSale)
                    table.column(self.isSale)
                    table.column(self.productReturn)
                    table.column(self.unit)
                    table.column(self.historyProductInput)
                    table.column(self.historyProductOutPut)
                    table.column(self.historyProductReturn)
                    table.column(self.countProductInput)
                }))
                print("Create table tblDepartment successfully")
            } else {
                print("Create table tblDepartment failed.")
            }
        } catch {
            let nserror = error as NSError
            print("Create table tblDepartment failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    // insert
    
    func insert(product: SPSProductForInputManagerModel, complete: @escaping ((Bool) -> Void)) {
        do {
            let insert = kNameTable.insert(self.codePr <- product.codePr,
                                           self.namePr <- product.namePr,
                                           self.manufacture <- product.manufacture,
                                           self.dateOfManuFactire <- product.dateOfManuFactire,
                                           self.expiryDate <- product.expiryDate,
                                           self.dateOfEntry <- product.dateOfEntry,
                                           self.pointForSave <- product.pointForSave,
                                           self.saleOff <- product.saleOff,
                                           self.improtPrice <- product.improtPrice,
                                           self.priceforSale <- product.priceforSale,
                                           self.isSale <- product.isSale,
                                           self.productReturn <- product.productReturn,
                                           self.unit <- product.unit,
                                           self.historyProductReturn <- product.historyProductReturn,
                                           self.historyProductOutPut <- product.historyProductOutPut,
                                           self.historyProductInput <- product.historyProductInput,
                                           self.countProductInput <- product.countProductInput
            )
            let _ = try DataManager.shared.connection!.run(insert)
            complete(true)
        } catch {
            let nserror = error as NSError
            complete(false)
            print("Cannot insert new Department. Error is: \(nserror), \(nserror.userInfo)")
        }
        
    }
    
    //How to query(find) all records in tblDepartment ?
    func queryAll() -> AnySequence<Row>? {
        do {
            return try DataManager.shared.connection?.prepare(self.kNameTable)
        } catch {
            let nserror = error as NSError
            print("Cannot query(list) all tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(department: Row) {
        print("""
            Department details. Name = \(department[self.namePr]),\
            address = \(department[self.codePr]),
            city = \(department[self.dateOfManuFactire]),
            zipCode = \(department[self.isSale]))
            """)
    }
    
    
}
