//
//  Cocktail.swift
//  CocktailRecipes
//
//  Created by Artemy on 25.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import Foundation


class Cocktail{
    let name:String?
    let image:String?
    let type:String?
    let iden: String
    let category: String?
    let instructions: String?
    let glass: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    
    var countIngtedient: Int?
    
//
//    var ingridiens: [String]?
//    var measure: [String]?
    
    init() {
        self.name = ""
        self.image = ""
        self.type = ""
        self.iden = ""
//        self.ingridiens = []
//        self.measure = []

        self.category = ""
        self.instructions = ""
        self.glass = ""
        
        self.strIngredient1 = ""
        self.strIngredient2 = ""
        self.strIngredient3 = ""
        self.strIngredient4 = ""
        self.strIngredient5 = ""
        self.strIngredient6 = ""
        self.strIngredient7 = ""
        self.strIngredient8 = ""
        self.strIngredient9 = ""
        self.strIngredient10 = ""
        self.strIngredient11 = ""
        self.strIngredient12 = ""
        self.strIngredient13 = ""
        self.strIngredient14 = ""
        self.strIngredient15 = ""
        self.strMeasure1 = ""
        self.strMeasure2 = ""
        self.strMeasure3 = ""
        self.strMeasure4 = ""
        self.strMeasure5 = ""
        self.strMeasure6 = ""
        self.strMeasure7 = ""
        self.strMeasure8 = ""
        self.strMeasure9 = ""
        self.strMeasure10 = ""
        self.strMeasure11 = ""
        self.strMeasure12 = ""
        self.strMeasure13 = ""
        self.strMeasure14 = ""
        self.strMeasure15 = ""
        
        self.countIngtedient = 0
    }

 
    init (cocktail:Drink){
        
        self.name = cocktail.strDrink
        self.image = cocktail.strDrinkThumb
        self.type = cocktail.strAlcoholic
        self.iden = cocktail.idDrink!
        self.category = cocktail.strCategory
        self.instructions = cocktail.strInstructions
        self.glass = cocktail.strGlass
        
        
        self.strIngredient1 = cocktail.strIngredient1
        self.strIngredient2 = cocktail.strIngredient2
        self.strIngredient3 = cocktail.strIngredient3
        self.strIngredient4 = cocktail.strIngredient4
        self.strIngredient5 = cocktail.strIngredient5
        self.strIngredient6 = cocktail.strIngredient6
        self.strIngredient7 = cocktail.strIngredient7
        self.strIngredient8 = cocktail.strIngredient8
        self.strIngredient9 = cocktail.strIngredient9
        self.strIngredient10 = cocktail.strIngredient10
        self.strIngredient11 = cocktail.strIngredient11
        self.strIngredient12 = cocktail.strIngredient12
        self.strIngredient13 = cocktail.strIngredient13
        self.strIngredient14 = cocktail.strIngredient14
        self.strIngredient15 = cocktail.strIngredient15
        
        self.strMeasure1 = cocktail.strMeasure1
        self.strMeasure2 = cocktail.strMeasure2
        self.strMeasure3 = cocktail.strMeasure3
        self.strMeasure4 = cocktail.strMeasure4
        self.strMeasure5 = cocktail.strMeasure5
        self.strMeasure6 = cocktail.strMeasure6
        self.strMeasure7 = cocktail.strMeasure7
        self.strMeasure8 = cocktail.strMeasure8
        self.strMeasure9 = cocktail.strMeasure9
        self.strMeasure10 = cocktail.strMeasure10
        self.strMeasure11 = cocktail.strMeasure11
        self.strMeasure12 = cocktail.strMeasure12
        self.strMeasure13 = cocktail.strMeasure13
        self.strMeasure14 = cocktail.strMeasure14
        self.strMeasure15 = cocktail.strMeasure15
        
        self.countIngtedient = 0
        self.countIngtedient = computeCountIngredients()
  }
    
    
    
    
    func computeCountIngredients () -> Int{
        var count = 0
        if self.strIngredient1 != "" {
           count += 1
        }
        else {
            return count}
        if self.strIngredient2 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient3 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient4 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient5 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient6 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient7 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient8 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient9 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient10 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient11 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient12 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient13 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient14 != "" {
            count += 1
        }else {
            return count}
        if self.strIngredient1 != "" {
            count += 1
        }else {
            return count}
        return count
    }
}
