//
//  ThirdViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 3..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit

var savedDict : [String:String] = [:]

class ThirdViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var MatchedLabel: UILabel!
    @IBAction func MatchPattern(_ sender: UIButton) {
        savedDict[choose] = urlScheme
    }
    var urlScheme : String!
    var choose = ""
    
    private let patternDataSource = PatternDataSource()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return patternDataSource.patterns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String?{
        
        return patternDataSource.title(for: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        choose = patternDataSource.title(for: pickerView.selectedRow(inComponent: 0))!
        print(choose)
        if savedDict[choose] != nil{
            MatchedLabel.text = choose + " ➔ " + savedDict[choose]!
        }
        else{
            MatchedLabel.text = "No Matched"
        }
    }
    
    
    
}

struct PatternDataSource{
    let patterns = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","Angry Face", "Sad Face", "Smile Face"]
    
    func title(for index: Int) -> String? {
        guard index < patterns.count else{ return nil }
        return String(patterns[index])
    }
}
