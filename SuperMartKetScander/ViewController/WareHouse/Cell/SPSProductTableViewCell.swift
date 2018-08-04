//
//  SPSProductTableViewCell.swift
//  SuperMartKetScander
//
//  Created by Bui Giang on 8/5/18.
//  Copyright © 2018 Bui Giang. All rights reserved.
//

import UIKit

class SPSProductTableViewCell: UITableViewCell {
    
    static let kIndentifier: String = "SPSProductTableViewCell"
    @IBOutlet weak var leftView: UIView!
    @IBOutlet private weak var viewParent: UIView!
    @IBOutlet private weak var viewTopSTT: UIView!
    @IBOutlet private weak var STTLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var NSXLabel: UILabel!
    @IBOutlet private weak var notificationLabel: UILabel!
    @IBOutlet private weak var savePointLabel: UILabel!
    @IBOutlet private weak var improtPriceLabel: UILabel!
    @IBOutlet private weak var salePriceLabel: UILabel!
    @IBOutlet private weak var totalProductLabel: UILabel!
    @IBOutlet weak var undefinedProductLabel: UILabel!
    @IBOutlet weak var saleOffLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewParent.layer.cornerRadius = 8
        viewTopSTT.layer.borderWidth = 1
        viewTopSTT.layer.borderColor = UIColor.white.cgColor
        viewTopSTT.layer.cornerRadius = viewTopSTT.frame.width/2
    }
    
    func fillData(product: SPSProductForWareHouse, index: Int) {
        STTLabel.text = "\(index)"
        nameLabel.text = product.namePr
        NSXLabel.text = product.manufacture
        notificationLabel.text = "Đã có \(product.totalsoldProduct) bán ra."
        savePointLabel.text = "\(product.pointForSave)"
        improtPriceLabel.text = "\(product.improtPrice)"
        salePriceLabel.text = "\(product.priceforSale)"
        totalProductLabel.text = "\(product.totalProduct)"
        
        if product.saleOff > 0 {
            saleOffLabel.text = "Sale \(product.saleOff)%"
            leftView.backgroundColor = UIColor().hexStringToUIColor(hex: "EF9494")
            viewTopSTT.backgroundColor = UIColor().hexStringToUIColor(hex: "EF9494")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
