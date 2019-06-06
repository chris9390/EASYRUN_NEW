//
//  DrawView.swift
//  EasyRun
//
//  Created by sgcs on 2018. 5. 18..
//  Copyright © 2018년 sgcs. All rights reserved.
//
import UIKit
import CoreML


/**
 This class is used to handle the drawing in the DigitView so we can get user input digit,
 This class doesn't really have an MPS or Metal going in it, it is just used to get user input
 */
class DrawView: UIView {
    let model = mnistCNN()
    var inputImage: CGImage!
    // some parameters of how thick a line to draw 15 seems to work
    // and we have white drawings on black background just like MNIST needs its input
    var linewidth = CGFloat(10) { didSet { setNeedsDisplay() } }
    var color = UIColor.white { didSet { setNeedsDisplay() } }
    
    // we will keep touches made by user in view in these as a record so we can draw them.
    
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var max_x: CGFloat = 0.0
    var min_x: CGFloat = 400.0
    var max_y: CGFloat = 0.0
    var min_y: CGFloat = 400.0
    var max_size = CGFloat()
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first!.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = touches.first!.location(in: self)
        // keep all lines drawn by user as touch in record so we can draw them in view
        lines.append(Line(start: lastPoint, end: newPoint))
        
        if lastPoint.x < min_x {
            min_x = lastPoint.x
            
        }
            
        else if lastPoint.x > max_x {
            max_x = lastPoint.x
        }
        
        if lastPoint.y < min_y {
            min_y = lastPoint.y
        }
            
        else if lastPoint.y > max_y {
            max_y = lastPoint.y
        }
        
        
        
        lastPoint = newPoint
        // make a draw call
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if max_x - min_x != 0 || max_y - min_y != 0 {
            predict()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        linewidth = 8/300 * self.frame.size.width
        let drawPath = UIBezierPath()
        drawPath.lineCapStyle = .round
        
        for line in lines{
            drawPath.move(to: line.start)
            drawPath.addLine(to: line.end)
        }
        
        drawPath.lineWidth = linewidth
        color.set()
        drawPath.stroke()
    }
    
    
    /**
     This function gets the pixel data of the view so we can put it in MTLTexture
     
     - Returns:
     Void
     */
    func getViewContext() -> CGContext? {
        // our network takes in only grayscale images as input
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceGray()
        
        // we have 3 channels no alpha value put in the network
        let bitmapInfo = CGImageAlphaInfo.none.rawValue
        
        // this is where our view pixel data will go in once we make the render call
        
        let context = CGContext(data: nil, width: Int(self.frame.size.width), height: Int(self.frame.size.height), bitsPerComponent: 8, bytesPerRow: Int(self.frame.size.width), space: colorSpace, bitmapInfo: bitmapInfo)
        
        if (max_x - min_x) > (max_y - min_y){
            //max_size = 28 * (max_x - min_x)/(self.frame.size.width)
            max_size = max_x - min_x
        }
        else{
            //max_size = 28 * (max_y - min_y)/(self.frame.size.height)
            max_size = max_y - min_y
        }
        
        context!.translateBy(x:self.frame.size.width/2, y:self.frame.size.height/2)
        context!.scaleBy(x: 1, y: -1)
        context!.translateBy(x:-self.frame.size.width/2, y:-self.frame.size.height/2)
        
        
        // scale and translate so we have the full digit and in MNIST standard size 28x28
        //context!.translateBy(x: 0 , y: 28)
        //context!.scaleBy(x: 28/self.frame.size.width, y: -28/self.frame.size.height)
        
        // put view pixel data in context
        self.layer.render(in: context!)
        
        return context
    }
    
    func initialize_var(){
        self.max_x = 0
        self.min_x = self.frame.size.width
        self.max_y = 0
        self.min_y = self.frame.size.height
        
    }
    
    func return_max_min() -> CGRect? {

        let rect = CGRect(x: min_x - max_size/8, y: min_y - max_size/8, width: max_x - min_x + max_size/4, height: max_y - min_y + max_size/4)
        return rect
    }
    
    
    func predict() {
        let context = self.getViewContext()
        inputImage = context?.makeImage()
        
        
        let rect = self.return_max_min()
        let pic2 = cropImage(UIImage(cgImage: inputImage), toRect: rect!, viewWidth: 28, viewHeight: 28)
        let pic = resizeImage(image: pic2!, newWidth: 28)
        let pixelBuffer = pic.pixelBuffer()
        let output = try? model.prediction(image: pixelBuffer!)
        let accuracy =  output?.output          //버튼을 없애기 위한 정확도
        let text = output?.classLabel
        
        /*//정확도 확인
        for i in (accuracy?.keys)!{
            print(i,accuracy![i])
        }
         */
        
        if savedDict.keys.contains(text!){
            if accuracy![text!]! > 0.998  {
              //  print(savedDict[text!])
                var myURL : String?
                if savedDict[text!] != nil{
                    myURL = urldict[savedDict[text!]!]
                   // print(myURL!)
                }
               // if urlflag == 1 {
                if savedDict[text!]! == "URL" {
                    myURL = "http://" + myURL!
                    print(myURL!)
                   // urlflag = 0
                }
                
                if  myURL != nil {
                    //////
                    if let url = URL(string : "\(myURL!)") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                print(text!)
                /*넣을까 말까. (링크 시킨 후엔 패턴 사라지게)*/
                /*
                self.lines = []
                self.setNeedsDisplay()
                
                self.initialize_var()
               */
            }
        }
        
    }
    
    
    
}

/**
 2 points can give a line and this class is just for that purpose, it keeps a record of a line
 */
class Line{
    var start, end: CGPoint
    
    init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end   = end
    }
}
