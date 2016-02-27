//
//  RecipeCell.swift
//  my recipes
//
//  Created by Kersuzan on 31/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var pictureImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(recipe: Recipe) {
        titleLbl.text = recipe.title
        if let image = recipe.getRecipeImg() {
            pictureImg.image = image
        }
        
    }

}
