//
//  CustomIngridientCell.swift
//  CocktailRecipes
//
//  Created by Artemy on 23.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

class CustomIngridientCell: UITableViewCell {

    @IBOutlet weak var ingridientImageView: UIImageView!
    @IBOutlet weak var ingridientNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
