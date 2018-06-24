//
//  TableViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 7..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit

var items : [String] = []

class TableViewController: UITableViewController {
    
    //@IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        
        self.tableView.separatorStyle = .none   // 리스트에서 밑줄 없애기
        self.tableView.rowHeight = 60
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        if items.count == savedDict.count && checkChange == 0{
            loadChecklistItems()
        }
        
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
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
        return items.count
    }
    
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
 */

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.textLabel?.textColor = UIColor.white
        
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let result = items.remove(at: (indexPath as NSIndexPath).row)
            var removeitem = String(result.split(separator: "\t")[0])
            if removeitem == smile {
                removeitem = "Smile Face"
            }
            else if removeitem == sad {
                removeitem = "Sad Face"
            }
            else if removeitem == angry {
                removeitem = "Angry Face"
            }
            else if removeitem == star {
                removeitem = "Star"
            }
            else if removeitem == heart {
                removeitem = "Heart"
            }
            else if removeitem == check {
                removeitem = "Check"
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            savedDict.removeValue(forKey: removeitem)
            
          //  k = k - 1                                // 테이블에서 하나 삭제해주면 k도 1 줄여준다.
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveChecklistItems()
    }
    
    let smile = "😀"
    let angry = "😠"
    let sad = "😞"
    let check = "☑️"
    let heart = "❤️"
    let star = "☆"
    
    
    override func viewWillAppear(_ animated: Bool){
        
        if items.count != savedDict.count || checkChange == 1{
            items.removeAll()
            for (key, value) in savedDict {
                if value == "URL" {
                    if key == "Smile Face" {
                        items.append(smile + "\t➔\t" + urldict["URL"]!)
                    }
                    else if key == "Sad Face" {
                        items.append(sad + "\t➔\t" + urldict["URL"]!)
                        
                    }
                    else if key == "Angry Face" {
                        items.append(angry + "\t➔\t" + urldict["URL"]!)
                        
                    }
                    else if key == "Star" {
                        items.append(star + "\t➔\t" + urldict["URL"]!)
                        
                    }
                    else if key == "Heart" {
                        items.append(heart + "\t➔\t" + urldict["URL"]!)
                        
                    }
                    else if key == "Check" {
                        items.append(check + "\t➔\t" + urldict["URL"]!)
                        
                    }
                    else {
                        items.append(key + "\t➔\t" + urldict["URL"]!)
                    }
                }
                else {
                    if key == "Smile Face" {
                        items.append(smile + "\t➔\t" + value)
                    }
                    else if key == "Sad Face" {
                        items.append(sad + "\t➔\t" + value)

                    }
                    else if key == "Angry Face" {
                        items.append(angry + "\t➔\t" + value)

                    }
                    else if key == "Star" {
                        items.append(star + "\t➔\t" + value)

                    }
                    else if key == "Heart" {
                        items.append(heart + "\t➔\t" + value)

                    }
                    else if key == "Check" {
                        items.append(check + "\t➔\t" + value)

                    }
                    else {
                        items.append(key + "\t➔\t" + value)
                    }
                }
            }
            if items.count != 0{
                let indexPath = IndexPath(row: items.count - 1, section: 0)
                tableView.beginUpdates()
                tableView.insertRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            }
        }
        self.tableView.reloadData()
        saveChecklistItems()
        checkChange = 0
    }
    
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

// Find Persist directory
func documentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

// Adding Persist file
func dataFilePath() -> URL {
    return documentsDirectory().appendingPathComponent("Checklists.plist")
}

// File Saving
func saveChecklistItems() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(savedDict, forKey: "ChecklistItems")
    archiver.finishEncoding()
    data.write(to: dataFilePath(), atomically: true)
}

// File Loading
func loadChecklistItems() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        savedDict = unarchiver.decodeObject(forKey: "ChecklistItems") as! [String:String]
        unarchiver.finishDecoding()
    }
}


