//
//  CocktailCustomTableViewCell.swift
//  CocktailRecipes
//
//  Created by Artemy on 23.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class CocktailCustomTableViewCell: UITableViewCell {
   
    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
