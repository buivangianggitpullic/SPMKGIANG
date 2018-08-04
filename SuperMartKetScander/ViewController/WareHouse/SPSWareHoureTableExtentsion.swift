//
//  SPSWareHoureTableExtentsion.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 8/5/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

extension SPSWareHouseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productWatrArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: SPSProductTableViewCell.kIndentifier) as? SPSProductTableViewCell {
            cell.fillData(product: productWatrArray[indexPath.row], index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
}
