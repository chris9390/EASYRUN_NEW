//
//  ThirdViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 3..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit

var savedDict : [String:String] = [:]

class ThirdViewController: UIViewController {
   
    var urlScheme : String!
    
    @IBAction func Pattern1(_ sender: UIButton) {
        savedDict["1"] = urlScheme
    }
    
    @IBAction func Pattern2(_ sender: UIButton) {
        savedDict["2"] = urlScheme
    }
    
    @IBAction func Pattern3(_ sender: UIButton) {
        savedDict["3"] = urlScheme
    }
    
    @IBAction func Pattern4(_ sender: UIButton) {
        savedDict["4"] = urlScheme
    }
    
    @IBAction func Pattern5(_ sender: UIButton) {
        savedDict["5"] = urlScheme
    }
    
    @IBAction func Pattern6(_ sender: UIButton) {
        savedDict["6"] = urlScheme
    }
    
    @IBAction func Pattern7(_ sender: UIButton) {
        savedDict["7"] = urlScheme
    }
    
    @IBAction func Pattern8(_ sender: UIButton) {
        savedDict["8"] = urlScheme
    }
    
    @IBAction func Pattern9(_ sender: UIButton) {
        savedDict["9"] = urlScheme
    }
    
    @IBAction func Pattern0(_ sender: UIButton) {
        savedDict["0"] = urlScheme
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
