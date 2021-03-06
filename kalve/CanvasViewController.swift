//
//  ViewController.swift
//  kalve
//
//  Created by Michael Fox on 6/17/18.
//  Copyright © 2018 Michael Fox. All rights reserved.
//

import UIKit


class CanvasViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    let colorPallette : ColorPanel = ColorPanel()
    
    var activeRect : UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.instantiateCircleButton()
        self.instantiateRectangleButton()
        self.createSaveAndQuitButton()
        
        self.view.backgroundColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: GESTURE RECOGNIZERS

    func addPanGesture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector (CanvasViewController.handlePan(sender:)))
        
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
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(CanvasViewController.handlePinch(sender:)))
        
        view.addGestureRecognizer(pinch)
    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer){
        
        let rectView : UIView = sender.view!
        
        rectView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    
        
    }
    
    
    func addRotateGesture(view: UIView){
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(CanvasViewController.handleRotate(sender:)))
        
        view.addGestureRecognizer(rotate)
        
    }
    
    @objc func handleRotate(sender: UIRotationGestureRecognizer){
        let rectView : UIView = sender.view!
        
        rectView.transform = rectView.transform.rotated(by: CGFloat(sender.rotation))
    }
    
    func addTapGesture(view: UIView){
        let tap = UITapGestureRecognizer(target: self, action: #selector(CanvasViewController.handleTap(sender:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        
        
        let rectView = sender.view!
        
        if(rectView.layer.shadowOpacity == 0.0){
            rectView.layer.shadowColor = UIColor(red: 255.0/255.0, green: 25.0/255.0, blue: 125.0/255.0, alpha: 0.8).cgColor
            
            
            
            rectView.layer.shadowOpacity = 0.75
            
            rectView.layer.shadowRadius = 25.50
            
            self.activeRect = rectView
            colorPallette.activeRect = rectView
            
            colorPallette.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100.0)
            return self.view.addSubview(colorPallette)
            
            
        } else {
            rectView.layer.shadowOpacity = 0.0
            rectView.layer.shadowRadius = 0.0
            
            self.activeRect = UIView()
            
           return colorPallette.removeFromSuperview()
        }
    }
  
    
    // MARK: NEW SHAPES

    
    func instantiateRectangleButton(){
        let greenButton = UIButton(frame: CGRect(x: 20, y: 150, width: 30, height: 30))
        greenButton.backgroundColor = .blue
        
        greenButton.setTitle("Box", for: .normal)
        greenButton.addTarget(self, action: #selector(self.newRectTapped), for: .touchUpInside)
        
        self.view.addSubview(greenButton)
    }
    
    @objc func newRectTapped(){
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 50, y: 50),
            size: CGSize(width: 100, height: 100)))
        
        k.layer.backgroundColor =  UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        
        self.view.addSubview(k)
        
        self.addPanGesture(view: k)
        self.addPinchGesture(view: k)
        self.addRotateGesture(view: k)
        self.addTapGesture(view: k)
    }
    
    func instantiateCircleButton(){
        let greenButton = UIButton(frame: CGRect(x: 20, y: 100, width: 30, height: 30))
        greenButton.backgroundColor = .blue
        
        greenButton.setTitle("Circle", for: .normal)
        greenButton.addTarget(self, action: #selector(self.newCircleTapped), for: .touchUpInside)
        
        self.view.addSubview(greenButton)
        
    }
    
    @objc func newCircleTapped(){
        let c = Draw(frame: CGRect(
            origin: CGPoint(x: 100, y: 100),
            size: CGSize(width: 100, height: 100)))
        
        c.layer.backgroundColor = UIColor.black.cgColor
        
        c.layer.cornerRadius = 50
        
        
        
        self.view.addSubview(c)
        
        self.addPanGesture(view: c)
        self.addPinchGesture(view: c)
        self.addRotateGesture(view: c)
        self.addTapGesture(view: c)
    }
    
    // MARK : Navigation
    
    func createSaveAndQuitButton(){
        let saveButton = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
        
        saveButton.setTitle("Save and Quit", for: .normal)
        
        saveButton.setTitleColor(UIColor.darkText, for: .normal)
        
        saveButton.backgroundColor = .cyan
        
        saveButton.addTarget(self, action: #selector(self.executeSaveAndQuit), for: .touchUpInside)
        
        self.view.addSubview(saveButton)
        
        
    }
    
    @objc func executeSaveAndQuit(){
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}

class Draw: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@IBDesignable class TriangleView: UIView {
    
    @IBInspectable var color: UIColor = .red
    @IBInspectable var firstPointX: CGFloat = 0
    @IBInspectable var firstPointY: CGFloat = 0
    @IBInspectable var secondPointX: CGFloat = 0.5
    @IBInspectable var secondPointY: CGFloat = 1
    @IBInspectable var thirdPointX: CGFloat = 1
    @IBInspectable var thirdPointY: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: self.firstPointX * rect.width, y: self.firstPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.secondPointX * rect.width, y: self.secondPointY * rect.height))
        aPath.addLine(to: CGPoint(x: self.thirdPointX * rect.width, y: self.thirdPointY * rect.height))
        aPath.close()
        self.color.set()
        self.backgroundColor = .clear
        aPath.fill()
    }
    
}





