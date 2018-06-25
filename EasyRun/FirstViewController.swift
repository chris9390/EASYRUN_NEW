//
//  ViewController.swift
//  EasyRun
//
//  Created by sgcs on 2018. 4. 12..
//  Copyright © 2018년 sgcs. All rights reserved.
//

import UIKit

var keylist : [String] = []
public var k = 0

class FirstViewController: UIViewController {
    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var changingLabel: UILabel!
    
    //var inputImage: CGImage!
    var cnt = 0
    var flag = 0
    var timer : Timer?
    
    let smile = "😀"
    let angry = "😠"
    let sad = "😞"
    let check = "☑️"
    let heart = "❤️"
    let star = "☆"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        changingLabel.text = " "
        
        keylist.removeAll()
        
        for i in savedDict.keys {
            keylist.append(i)
        }
        print(savedDict)
        
        if !keylist.isEmpty {
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FirstViewController.changetext), userInfo: nil, repeats: true)
        }
        */
        self.clearButton.layer.cornerRadius = 30
        
        for member in installedapplist{
            if member == "URL" {
                flag = 1
            }
        }
        
        if flag == 0 {
            installedapplist.append("URL")
        }
        
        
        print(savedDict.count)
        print(items.count)
        print(savedDict)
        drawView.layer.borderWidth = 5.0
        drawView.layer.borderColor = UIColor.white.cgColor
        
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if items.count == savedDict.count && checkChange == 0{
            loadChecklistItems()
        }
        print(savedDict.count)
        loadChecklistItems2()
        loadChecklistItems3()
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        changingLabel.text = " "

        keylist.removeAll()
        
        for i in savedDict.keys {
            keylist.append(i)
        }
        print(savedDict)
        
        if !keylist.isEmpty {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FirstViewController.changetext), userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            timer?.invalidate()
    }
    
    
    @IBAction func tappedClear(_ sender: Any) {
        drawView.lines = []
        drawView.setNeedsDisplay()
        
        //0620 추가
        drawView.initialize_var()
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func changetext() {
        k = k % keylist.count
        
        if savedDict[keylist[k]] == "URL" {
            if keylist[k] == "Smile Face" {
                self.changingLabel.text = smile + "    ➔    " + urldict[savedDict[keylist[k]]!]!
            }
            else if keylist[k] == "Sad Face" {
                self.changingLabel.text = sad + "    ➔    " + urldict[savedDict[keylist[k]]!]!
                
            }
            else if keylist[k] == "Angry Face" {
                self.changingLabel.text = angry + "    ➔    " + urldict[savedDict[keylist[k]]!]!
                
            }
            else if keylist[k] == "Star" {
                self.changingLabel.text = star + "    ➔    " + urldict[savedDict[keylist[k]]!]!
                
            }
            else if keylist[k] == "Heart" {
                self.changingLabel.text = heart + "    ➔    " + urldict[savedDict[keylist[k]]!]!
                
            }
            else if keylist[k] == "Check" {
                self.changingLabel.text = check + "    ➔    " + urldict[savedDict[keylist[k]]!]!
                
            }
            else {
                self.changingLabel.text = keylist[k] + "    ➔    " + urldict[savedDict[keylist[k]]!]!
            }
        }
        else {
            if keylist[k] == "Smile Face" {
                self.changingLabel.text = smile + "    ➔    " + savedDict[keylist[k]]!
            }
            else if keylist[k] == "Sad Face" {
                self.changingLabel.text = sad + "    ➔    " + savedDict[keylist[k]]!

            }
            else if keylist[k] == "Angry Face" {
                self.changingLabel.text = angry + "    ➔    " + savedDict[keylist[k]]!

            }
            else if keylist[k] == "Star" {
                self.changingLabel.text = star + "    ➔    " + savedDict[keylist[k]]!

            }
            else if keylist[k] == "Heart" {
                self.changingLabel.text = heart + "    ➔    " + savedDict[keylist[k]]!

            }
            else if keylist[k] == "Check" {
                self.changingLabel.text = check + "    ➔    " + savedDict[keylist[k]]!

            }
            else {
                self.changingLabel.text = keylist[k] + "    ➔    " + savedDict[keylist[k]]!
            }
        }
        //print(savedDict.count)
        k = (k + 1) % keylist.count
        //print(k)
        
    }
}

extension UIImage {
    func pixelBuffer() -> CVPixelBuffer? {
        let width = self.size.width
        let height = self.size.height
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                     kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(width),
                                         Int(height),
                                         kCVPixelFormatType_OneComponent8,
                                         attrs,
                                         &pixelBuffer)
        
        guard let resultPixelBuffer = pixelBuffer, status == kCVReturnSuccess else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(resultPixelBuffer)
        
        let grayColorSpace = CGColorSpaceCreateDeviceGray()
        guard let context = CGContext(data: pixelData,
                                      width: Int(width),
                                      height: Int(height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(resultPixelBuffer),
                                      space: grayColorSpace,
                                      bitmapInfo: CGImageAlphaInfo.none.rawValue) else {
                                        return nil
        }
        
        context.translateBy(x: 0, y: height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context)
        self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        return resultPixelBuffer
    }
}





func cropImage(_ inputImage: UIImage, toRect cropRect: CGRect, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage?
{
    //let imageViewScale = max(viewWidth / inputImage.size.width,
    //                         viewHeight / inputImage.size.height)
    let imageViewScale = CGFloat(1)
    //print(cropRect)
    // Scale cropRect to handle images larger than shown-on-screen size
    let cropZone = CGRect(x:cropRect.origin.x * imageViewScale,
                          y:cropRect.origin.y * imageViewScale,
                          width:cropRect.size.width * imageViewScale,
                          height:cropRect.size.height * imageViewScale)
    
    //print(cropZone)
    // Perform cropping in Core Graphics
    guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to:cropZone)
        else {
            return nil
    }
    
    // Return image to UIImage
    let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
    return croppedImage
}

func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
    
    let newHeight = newWidth
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}




