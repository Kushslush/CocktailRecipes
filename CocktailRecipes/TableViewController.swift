//
//  TableViewController.swift
//  CocktailRecipes
//
//  Created by Artemy on 22.07.2018.
//  Copyright © 2018 VSU. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage



class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    var cocktails: [Cocktail] = []
    var searchResult: [Cocktail] = []
    var isNavigationBarHidden: Bool = false
    var netWork = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadInformation(summary: "Alcoholic")
        loadInformation(summary: "Non_Alcoholic")
        //var AlcoholicCocktails = netWork.loadInformation(summary: "Alcoholic")
        //var NonAlcoholicCocktails = netWork.loadInformation(summary: "Non_Alcoholic")
        //cocktails = AlcoholicCocktails + NonAlcoholicCocktails
        
        //self.tableView.reloadData()
        
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Coctails..."
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(red:20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 110.0
        
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.topItem?.title = "Cocktail List"

        tableView.estimatedRowHeight = 110.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
        isNavigationBarHidden = navigationController?.isNavigationBarHidden ?? false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive{
            return searchResult.count
        } else {
            return cocktails.count
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive{
            return false
        }else{
            return true
            
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let cocktail = (searchController.isActive) ? searchResult[indexPath.row]: cocktails[indexPath.row]
        
        // Configure the cell...
        
        cell.CocktailImageView?.image = UIImage(named: cocktail.image!)
        cell.TypeLabel?.text = cocktail.type
        cell.NameLabel?.text = cocktail.name
        
        if let imageUrl = cocktail.image as? String {
            Alamofire.request(imageUrl).responseImage(completionHandler: {(response) in
                if let image = response.result.value {
                    let roundedImage = image.af_imageRoundedIntoCircle()
                    DispatchQueue.main.async {
                        cell.CocktailImageView?.image = roundedImage
                    }
                }
            })
        }
        //cell.CocktailImageView.clipsToBounds = true
        return cell
    }
 
    //========================================================================
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                
                
                
                let destinationController = segue.destination as! detailViewController
                destinationController.cocktail = (searchController.isActive) ? searchResult[indexPath.row]: cocktails[indexPath.row]
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            
            filterContent(searchText: searchText)
            tableView.reloadData()
            
            
        }
    }
    
    func filterContent(searchText:String){
        
        searchResult = cocktails.filter({(cocktail:Cocktail)-> Bool in
            let nameMatch = cocktail.name?.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            
            
            return nameMatch != nil
        })
        
        
    }
   
    //========================================================================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: true)
    }
    
    //========================================================================
    
    


    func loadInformation(summary:String){
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a="+summary)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let content = data else {
                print("No content :(")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cocks = try decoder.decode(Cocktails.self, from: content)
                
                for coc in cocks.drinks! {
                    
                    var Ncocktail = Cocktail(cocktail: coc)
                    
                    self.cocktails.append(Ncocktail)
                }
            } catch let err {
                print("Err", err)
            }
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }

   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha = 0
//
//        UIView.animate(withDuration: 1.0, animations: {cell.alpha = 1})
        
//        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180)
//        let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        
        
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0, animations: {cell.layer.transform = CATransform3DIdentity})
        
    }
    



}

