//
//  TableViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 7..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit
//import SQLite3


var urlschemelist = ["kakaotalk://","fb://","megabox://","Meloniphone://","http://maps.apple.com/?q"]
var installedapplist : [String] = []

class SecondTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var db: OpaquePointer?
        
//        let fileUrl = try!
//            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("urls.sqlite")
        
//        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK{
//            print("Error opening database")
//            return
//        }
        
       // let createTableQuery = "CREATE TABLE IF NOT EXISTS urls(id INTEGER PRIMARY KEY, appname TEXT, urlscheme TEXT)"
        
      //  if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
       //     print("Error creating table")
       //     return
       // }
         
        
        if installedapplist.count == 0 {
            for index in urlschemelist{
                if UIApplication.shared.canOpenURL(NSURL(string: index)! as URL){
                    installedapplist.append(index)
                }
            }
        }
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
        //cell.textLabel?.text = itemsImageFile[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            installedapplist.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
