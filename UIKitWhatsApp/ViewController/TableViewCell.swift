//
//  TableViewCell.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/28/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "tableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    public func configure(with userName: String, imageName: String, previewText: String, date: String) {
        personImageView.image = UIImage(systemName: imageName)
        nameLabel.text = userName
        textlabel.text = previewText
        dateLabel.text = date
    }
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var checkMarkLabel: UIImageView!
    
    @IBOutlet weak var textlabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
