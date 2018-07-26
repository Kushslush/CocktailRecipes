//
//  API.swift
//  CocktailRecipes
//
//  Created by Artemy on 25.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation


class API {
    let mainUrl = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a="
    var cocktails: [Cocktail] = []
    
    func loadInformation(summary:String) -> [Cocktail]{
        let url = URL(string: mainUrl+summary)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let content = data else {
                print("No content :(")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let drinks = try decoder.decode(Cocktails.self, from: content)
                
                for drink in drinks.drinks! {
                    
                    var newDrink = Cocktail(cocktail: drink)
                    
                    self.cocktails.append(newDrink)
                }
            } catch let err {
                print("Err", err)
            }
            
            
        }
        return cocktails
    }
}
