//
//  ThirdViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 3..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit

var savedDict : [String:String] = [:]
var images = ["0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "a.png", "b.png", "c.png", "d.png", "e.png", "f.png", "Smile Face.png", "Sad Face.png", "Angry Face.png", "Check.png", "Heart.png", "Star.png"]
var checkChange = 0
var numberOfDict = 0
public var urlflag = 0

class ThirdViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var phonenumTextField: UITextField?
    
    @IBOutlet weak var matchingLabel: UILabel!
    @IBOutlet weak var LabelView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!{
        didSet{
            //pickerView.selectedRow(inComponent: 0)
            choose = patternDataSource.title(for: pickerView.selectedRow(inComponent: 0))!
            if savedDict[choose] != nil{
                if savedDict[choose] == "URL" {
                    MatchedLabel.text = urldict["URL"]
                }
                else {
                    MatchedLabel.text = savedDict[choose]!
                }
            }
            else{
                MatchedLabel.text = "X (Not Matched)"
            }
            
        }
    }
    @IBOutlet weak var matchingButton: UIButton!
    @IBOutlet weak var MatchedLabel: UILabel!
    @IBAction func MatchPattern(_ sender: UIButton) {

        if MatchedLabel.text != "X (Not Matched)" {
            let alertController = UIAlertController(title: "Do you want to overwrite?", message: nil, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in alertController.dismiss(animated: true, completion: nil)
                checkChange = 0
                numberOfDict = savedDict.count
                
                savedDict[self.choose] = self.urlScheme
                
                if(savedDict.count == numberOfDict){
                    checkChange = 1
                }
                self.performSegue(withIdentifier: "segue1", sender: nil)
            }))
            
            alertController.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: {(action) in alertController.dismiss(animated: true, completion: nil)
            }))
            
            
            self.present(alertController, animated: true)
        }
        
        else {
                savedDict[choose] = urlScheme
        }
    }
    
    
    var urlScheme : String!
    var choose = ""
    
    private let patternDataSource = PatternDataSource()
    
    
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        choose = patternDataSource.title(for: pickerView.selectedRow(inComponent: 0))!
        if savedDict[choose] != nil{
            MatchedLabel.text = savedDict[choose]!
        }
        else{
            MatchedLabel.text = "X (Not Matched)"
        }
        
        /*
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.selectedRow(inComponent: 0)
        super.viewDidAppear(true)
 */
    }
    */
    
    override func viewDidLoad() {
        urlflag = 0
        matchingLabel.layer.borderWidth = 1.5
        matchingLabel.layer.borderColor = UIColor.white.cgColor
        matchingLabel.layer.cornerRadius = 8
        
        self.matchingButton.layer.cornerRadius = 20

        /*
        var itemAt: String?
        var defaultRowIndex = patternDataSource.patterns.index(of: itemAt!)
        if defaultRowIndex == nil {
            defaultRowIndex = 0
        }
        pickerView.selectRow(defaultRowIndex!, inComponent: 0, animated: true)
        */
        
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor.white.cgColor
        pickerView.layer.borderWidth = 1.5
        pickerView.layer.borderColor = UIColor.white.cgColor
        LabelView.layer.borderWidth = 1.5
        LabelView.layer.borderColor = UIColor.white.cgColor
        if urlScheme == "Messages " {
            let alertController = UIAlertController(title: "Write phone number.", message: nil, preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: phonenumTextField)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
            
        }
            
        else if urlScheme == "Phone call" {
            let alertController = UIAlertController(title: "Write phone number.", message: nil, preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: phonenumTextField)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
        }
        
        else if urlScheme == "URL" {
            urlflag = 1
            let alertController = UIAlertController(title: "Write website name.", message: nil, preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: phonenumTextField)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandler)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
        }
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func phonenumTextField(textField : UITextField!){
        phonenumTextField = textField
        
        if urlScheme == "URL"{
            phonenumTextField?.placeholder = "Website name"
        }
        else {
        phonenumTextField?.placeholder = "Phone number"
        }
    }
    
    
    func okHandler(alert: UIAlertAction) {
        
        print(phonenumTextField!.text!)  // 내가 alert text에 입력한 것
        print(urlScheme)
        print(urldict)
     
        if urlScheme == "Messages " {
            urldict["Messages "] = "sms://" + (phonenumTextField?.text)!
        }
        
        else if urlScheme == "Phone call" {
            print(urldict["Phone call"]!)
            urldict["Phone call"] = "tel://" + (phonenumTextField?.text)!
        }
        
        else if urlScheme == "URL" {
            urldict["URL"] = (phonenumTextField?.text)!
        }
        
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
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String?{
        
        return patternDataSource.title(for: row)
    }
    */
    //0621 민석 추가
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        return NSAttributedString(string: patternDataSource.title(for: row)!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        choose = patternDataSource.title(for: pickerView.selectedRow(inComponent: 0))!
        print(choose)
        imageView.image = UIImage(named: choose + ".png")
        if savedDict[choose] != nil{
            if savedDict[choose] == "URL" {
                MatchedLabel.text = urldict["URL"]
            }
            else {
                MatchedLabel.text = savedDict[choose]!
                
            }
        }
        else{
            MatchedLabel.text = "X (Not Matched)"
        }
    }
    
    
    
}

struct PatternDataSource{
    let patterns = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","Angry Face",
        "Sad Face", "Smile Face", "Check", "Heart", "Star"]
    
    func title(for index: Int) -> String? {
        guard index < patterns.count else{ return nil }
        return String(patterns[index])
    }
}
