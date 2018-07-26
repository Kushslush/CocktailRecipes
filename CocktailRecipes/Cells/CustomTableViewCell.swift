//
//  CustomTableViewCell.swift
//  CocktailRecipes
//
//  Created by Artemy on 22.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var CocktailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
