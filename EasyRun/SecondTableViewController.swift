//
//  TableViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 7..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit
import FirebaseDatabase

var installedapplist : [String] = []
var urls : [String] = []
var appname : [String] = []

var urldict : [String:String] = [:]




class SecondTableViewController: UITableViewController {
    
    var ref:DatabaseReference!
    var refHandle:DatabaseHandle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Set the firebase reference
        ref = Database.database().reference()
        
        
        
        //Retrieve the urls and listen for changes
        refHandle = ref.child("URLs").observe(.childAdded, with: {(snapshot) in
          
            // print("dbcount : ", snapshot.childrenCount)
            let urlscheme = snapshot.value as? String
            let name : String? = snapshot.key
            
            urls.append(urlscheme!)
            appname.append(name!)
            
            urldict[name!] = urlscheme!
    
            
            
            if urldict.count == 4 {
                if installedapplist.count == 0 {
                    for (key, value) in urldict{
                        if UIApplication.shared.canOpenURL(NSURL(string: value)! as URL){
                            installedapplist.append(key)
                        }
                    }
                    
                    //print(installedapplist)
                    self.tableView.reloadData()

                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
    
        return installedapplist.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = installedapplist[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactDetailViewController = segue.destination as! ThirdViewController
        let selectedIndex = installedapplist[tableView.indexPathForSelectedRow!.row]
        contactDetailViewController.urlScheme = selectedIndex
    }
    
    
    
}
