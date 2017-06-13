//
//  FilterdViewController.swift
//  FilterSearchViewController
//
//  Created by ShrawanKumar Sharma on 08/05/17.
//  Copyright © 2017 FilterSearchViewController. All rights reserved.
//

import UIKit

class FilterdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let identifier = "FynderSearchTableViewCell"
    @IBOutlet var tableView: UITableView!
   
    var textSearched:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "FynderSearchTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: identifier)
        tableView.dataSource  = self
        tableView.delegate = self
        
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath ) as! FynderSearchTableViewCell
        return cell
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
