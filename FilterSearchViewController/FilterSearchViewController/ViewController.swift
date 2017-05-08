//
//  ViewController.swift
//  FilterSearchViewController
//
//  Created by ShrawanKumar Sharma on 08/05/17.
//  Copyright © 2017 FilterSearchViewController. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UISearchBarDelegate{


    
    var filterdDestination:FilterdViewController!
    
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate  = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchText" ,
           //  filterdDestination = segue.destination  as? FilterdViewController {
            
        }

     
    }
    
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if (segue.identifier == "searchText") {
             filterdDestination = segue.destination  as! FilterdViewController
         //   secondViewController.textSeached
            // Pass data to secondViewController before the transition
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
      //  let searchString = searchText
      
        if(searchBar.text != ""){
            ///searchPlaceInGoogleMap(name: searchString)
            //self.containerView.hidden = false
            let searchResultsVC = childViewControllers.first as! FilterdViewController
            searchResultsVC.textSearched = searchBar.text
            filterdDestination.tableView.reloadData()
        }else{
            
            
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
   
        searchBar.resignFirstResponder()
        
    }
    
    
    func searchBarfdButtonClicked(searchBar: UISearchBar) {
       // shouldShowSearchResults = false
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        
        
       // imageAboveIcon.isHidden = true
//        doneGoogleMap.isHidden = true
//        tableView.isHidden = false
        
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        
//        doneGoogleMap.isHidden = true
//        
//        
//        print("Cancel called")
//        searchBar.resignFirstResponder()
//        searchBar.text = ""
//        shouldShowSearchResults = false
        
       // tableView.reloadData()
    }
    

    
}

