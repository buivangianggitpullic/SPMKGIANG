//
//  SPSWareHouseViewController.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 7/10/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSWareHouseViewController: SPSBaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundSearchView: UIView!
    
    var productWatrArray: [SPSProductForWareHouse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSearchView.layer.borderWidth = 1
        backgroundSearchView.layer.cornerRadius = 8
        backgroundSearchView.layer.borderColor = UIColor.gray.cgColor
        
        setUpTable()
        fakeData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: SPSProductTableViewCell.kIndentifier, bundle: nil), forCellReuseIdentifier: SPSProductTableViewCell.kIndentifier)
    }
    
    private func fakeData() {
    
        let item1 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 300g", id: 1, manuFactured: "nestead", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item2 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 800g", id: 1, manuFactured: "nestead", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item3 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 1300g", id: 1, manuFactured: "nestead", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item4 = SPSProductForWareHouse(name: "Sữa name2 Pro 2 in 1 loại 800g", id: 1, manuFactured: "VINAMILK", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        
        let item5 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 300g", id: 1, manuFactured: "nestead", point: 4, saleOff: 20, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item6 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 800g", id: 1, manuFactured: "nestead", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item7 = SPSProductForWareHouse(name: "Sữa nestead 2 in 1 loại 1300g", id: 1, manuFactured: "nestead", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        let item8 = SPSProductForWareHouse(name: "Sữa name2 Pro 2 in 1 loại 800g", id: 1, manuFactured: "VINAMILK", point: 4, saleOff: 0, importForSale: 1250000, priceSale: 2500000, totalProduct: 200000, totalSoldProduct: 175000)
        
        productWatrArray.append(item1)
        productWatrArray.append(item2)
        productWatrArray.append(item3)
        productWatrArray.append(item4)
        productWatrArray.append(item5)
        productWatrArray.append(item6)
        productWatrArray.append(item7)
        productWatrArray.append(item8)
        
        tableView.reloadData()
    }
    
}

    


