////
////  AssetPanel.swift
////  kalve
////
////  Created by Michael Fox on 6/30/18.
////  Copyright © 2018 Michael Fox. All rights reserved.
////
//
//import UIKit
//
//class AssetPanel: UIView {
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
//
//    var CanvasView = UIViewController
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.layer.backgroundColor = UIColor(red: 20.0/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1.0).cgColor
//
//        self.layer.frame = CGRect(x: 0, y: 250, width: 250.0, height: 100.0)
//
//        // MARK: ----> Create Color Buttons
//
//        instantiateRedButton()
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: ----> COLOR BUTTON FUNCTIONS
//
//    func instantiateRedButton() {
//        let redButton = UIButton(frame: CGRect(x: 20, y: 20, width: 60, height: 30))
//        redButton.backgroundColor = .black
//
//        redButton.setTitle("Rectangle", for: .normal)
//        redButton.addTarget(self, action: #selector(self.redButtonPressed), for: .touchUpInside)
//
//        self.addSubview(redButton)
//    }
//
//    @objc func redButtonPressed(){
//
//        let k = Draw(frame: CGRect(
//            origin: CGPoint(x: 50, y: 50),
//            size: CGSize(width: 100, height: 100)))
//
//        k.layer.backgroundColor =  UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
//
//        CanvasView.view.addSubview(k)
//
//        CanvasView.addPanGesture(view: k)
//        CanvasView.addPinchGesture(view: k)
//        CanvasView.addRotateGesture(view: k)
//        CanvasView.addTapGesture(view: k)
//
//    }
//
//
//
//
//
//}
