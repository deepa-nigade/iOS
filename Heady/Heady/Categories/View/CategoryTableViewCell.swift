//
//  CategoryTableViewCell.swift
//  Heady
//
//  Created by Deepa Patil on 26/01/19.
//  Copyright © 2019 Deepa Patil. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forCategory category: Category) {
        self.selectionStyle = .none
        titleLabel?.text = category.category_name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    
}
