//
//  CoinTableViewCell.swift
//  PracticeApi
//
//  Created by 김준섭 on 2022/06/17.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    static let identifier = "coinCell"
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateUI(cellData: CoinElement) {
        self.indexLabel.text = String(cellData.rank)
        self.nameLabel.text = cellData.name
        self.iconImage.load(url: URL(string: cellData.iconURL)!)
        self.symbolLabel.text = cellData.symbol
        self.priceLabel.text = String(cellData.price[...cellData.price.index(cellData.price.startIndex, offsetBy: 6)])
        self.marketCapLabel.text = "\(cellData.marketCap[...cellData.marketCap.index(cellData.marketCap.startIndex, offsetBy: cellData.marketCap.count - 10)]) B"
        self.changeLabel.text = cellData.change
        if(cellData.change.prefix(1) == "-") {
            changeLabel.textColor = UIColor.red
        } else {
            changeLabel.textColor = UIColor.blue
        }
        
    }
}
