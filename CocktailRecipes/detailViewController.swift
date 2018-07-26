//
//  detailViewController.swift
//  CocktailRecipes
//
//  Created by Artemy on 22.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit

import Alamofire

class detailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var cocktailImageView: UIImageView!
    
    var drinks: [Cocktail] = []
    var cocktail = Cocktail()
    //var drink: Cocktails
    var cocktailImage = ""
    
    var idDrink: String = ""
    
    
    
   // @IBOutlet weak var cocktailName: UILabel!
   // var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInformation(summary: cocktail.iden)
        
        //cocktailImageView.image = UIImage(named: cocktail.image!)
        if let imageUrl = cocktail.image {
            Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                if let image = response.result.value {
                    let roundedImage = image.af_imageRounded(withCornerRadius: 15.0)
                    DispatchQueue.main.async {
                        self.cocktailImageView?.image = roundedImage
                    }
                }
            })
        }
               
        
        tableView.backgroundColor = UIColor(red:240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        //tableView.tableFooterView = UIView(frame: CoreGraphics.CGRectZero)
        
        tableView.separatorColor = UIColor(red:240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        title = cocktail.name
        
        //cocktailImageView.layer.cornerRadius = 15.0
        cocktailImageView.clipsToBounds = true
        
        
        tableView.estimatedRowHeight = 130.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 5
        
        if drinks.count != 0 {
            return 5+drinks[0].countIngtedient!+1
            
        }
         return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
        if drinks.count != 0 {
        
           
//
//           let cell1 = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! CustomInstructionCell
//
//           let cell2 = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
        
        if indexPath.row==0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = drinks[0].name
            
            return cell
        }
        else if indexPath.row==1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
            cell.fieldLabel.text = "Category"
            cell.valueLabel.text = drinks[0].category
            return cell
        }
        else if indexPath.row==2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = drinks[0].type
            return cell
        }
        else if indexPath.row==3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
            cell.fieldLabel.text = "Glass"
            cell.valueLabel.text = drinks[0].glass
            return cell
        }
        else if indexPath.row==4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! CustomInstructionCell
            cell.instructionTextLabel.text = drinks[0].instructions
            return cell
        }
        else if indexPath.row==5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
            cell.fieldLabel.text = "Ingredients"
            cell.valueLabel.text = ""
            return cell
        }
        else if indexPath.row>=6{
            
            
            switch indexPath.row {
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient1!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure1! + drinks[0].strIngredient1!
                
                return cell
                
            case 7:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient2!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure2! + drinks[0].strIngredient2!
                
                return cell
            case 8:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient3!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure3! + drinks[0].strIngredient3!
                
                return cell
            case 9:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient4!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure4! + drinks[0].strIngredient4!
                
                return cell
            case 10:
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient5!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure5! + drinks[0].strIngredient5!
                
                return cell
            case 11:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient6!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure6! + drinks[0].strIngredient6!
                
                return cell
            case 12:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient7!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure7! + drinks[0].strIngredient7!
                
                return cell
            case 13:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient8!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure8! + drinks[0].strIngredient8!
                
                return cell
            case 14:
               
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient9!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure9! + drinks[0].strIngredient9!
                
                return cell
            case 15:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient10!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure10! + drinks[0].strIngredient10!
                
                return cell
            case 16:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient11!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure11! + drinks[0].strIngredient11!
               
                return cell
            case 17:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient12!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure12! + drinks[0].strIngredient12!
                
                return cell
            case 18:
               
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient13!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure13! + drinks[0].strIngredient13!
                
                return cell
            case 19:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient14!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure14! + drinks[0].strIngredient14!
                
                return cell
            case 20:
               
                let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
                
                let image:String?
                image = editIngredientName(ingredient: drinks[0].strIngredient1!)
                if let imageUrl = image {
                    Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                        if let image = response.result.value {
                            let roundedImage = image.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell.ingridientImageView?.image = roundedImage
                            }
                        }
                    })
                }
                
                cell.ingridientNameLabel.text = drinks[0].strMeasure15! + drinks[0].strIngredient15!
                
                if drinks[0].countIngtedient != 15 {
                    self.tableView.reloadData()
                }
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CocktailCustomTableViewCell
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
                return cell
            }

            
//             let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithImage", for: indexPath) as! CustomIngridientCell
//            cell.ingridientNameLabel.text = drinks[0].strMeasure1! + drinks[0].strIngredient1!
//            indIngridient += 1
//            return cell
        }
        
        
        
//
//        switch indexPath.row {
//        case 0:
//            cell.fieldLabel.text = "Name"
//            cell.valueLabel.text = cocktails[0].name
//            return cell
//
//        case 1:
//            cell.fieldLabel.text = "Category"
//            cell.valueLabel.text = cocktails[0].category
//            return cell
//        case 2:
//            cell.fieldLabel.text = "Type"
//            cell.valueLabel.text = cocktails[0].type
//            return cell
//
//        default:
//            cell.fieldLabel.text = ""
//            cell.valueLabel.text = ""
//            return cell
//        }
            return cell1
            
        }
        return cell1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    func loadInformation(summary:String){
        let mainUrl = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
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
                    
                    self.drinks.append(newDrink)
                }
            } catch let err {
                print("Err", err)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            }.resume()
        
        
    }
    
    func editIngredientName(ingredient: String)->String{
        var editSTR = "https://www.thecocktaildb.com/images/ingredients/"
        
        for symbol in ingredient {
           
            if (symbol != " "){
 
                editSTR.append(symbol)
            }
            else{
                editSTR += "%20"
            }
            
        }
        
        editSTR += ".png"
        return editSTR
    }
 

}



