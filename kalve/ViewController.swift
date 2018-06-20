//
//  ViewController.swift
//  kalve
//
//  Created by Michael Fox on 6/17/18.
//  Copyright © 2018 Michael Fox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: GESTURE RECOGNIZERS

    func addPanGesture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector (ViewController.handlePan(sender:)))
        
        view.addGestureRecognizer(pan)
        
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer){
        
        let rectView = sender.view!
        
        let translation = sender.translation(in: view)
        
        switch sender.state {
        case .began, .changed:
            
            rectView.center = CGPoint(x: rectView.center.x + translation.x, y: rectView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
            break
        default:
            break
        }
        
        
    }
    
    
    func addPinchGesture(view: UIView){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch(sender:)))
        
        view.addGestureRecognizer(pinch)
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer){
        
        let rectView : UIView = sender.view!
        
        rectView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    
        
    }
    
    
    func addRotateGesture(view: UIView){
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotate(sender:)))
        
        view.addGestureRecognizer(rotate)
        
    }
    
    @objc func handleRotate(sender: UIRotationGestureRecognizer){
        let rectView : UIView = sender.view!
        
        rectView.transform = rectView.transform.rotated(by: CGFloat(sender.rotation))
    }
  
    
    // MARK : BACKGROUND COLORS
    
    @IBAction func changeRed(_ sender: Any) {
        
        
        
        
        
        self.view.backgroundColor = .red
        
    }
    @IBAction func changeColorPressed(_ sender: Any) {
        
 
        
        self.view.backgroundColor = .blue
        
    }
 
    
    // MARK: NEW SHAPES
    
    @IBAction func createNewRectangle(_ sender: Any) {
        
     
        
        
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 50, y: 50),
            size: CGSize(width: 100, height: 100)))
        
        self.view.addSubview(k)
        
        self.addPanGesture(view: k)
        self.addPinchGesture(view: k)
        self.addRotateGesture(view: k)
    }
    
}

class Draw: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        var color:UIColor = UIColor.yellow
        
        var drect = CGRect(x: (w * 0.25),y: (h * 0.25),width: (w * 0.5),height: (h * 0.5))
        var bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        print("it ran")
        
        NSLog("drawRect has updated the view")
        
    }
    
}


