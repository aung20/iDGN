//
//  ViewController.swift
//  iDGN
//
//  Created by Maung Aung Naing Tun on 21/8/18.
//  Copyright © 2018 Maung Aung Naing Tun. All rights reserved.
//

import UIKit
//import CoreData

let contents = ["Running DGN", "System Tests", "Control Card Tests",
               "NASRU, ASRU Cards Tests", "HybridPlus, AnalogPlus Cards Tests",
               "Auto-Adjust Tests", "AccessPlus Card Tests", "Utility Card Tests",
               "Hybrid32 Pin Card Tests", "Hybrid144 UnMux Pin Card Tests",
               "Auto-Adjust Routines", "Self-Test and Boot Routines", "No-Wire Interface Tests"]

var myContentsIndex = 0
var myPdfIndex = 0

class ContentsViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let myLayer1cell =  tableView.dequeueReusableCell(withIdentifier: "layer1Cell", for: indexPath)
        myLayer1cell.textLabel?.text = contents[indexPath.row]
        return myLayer1cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myPdfIndex = indexPath.row
        performSegue(withIdentifier: "goToPDFView", sender: self)
        
    }
}

