//
//  ColorPanel.swift
//  kalve
//
//  Created by Michael Fox on 6/20/18.
//  Copyright © 2018 Michael Fox. All rights reserved.
//

import UIKit

class ColorPanel: UIView {
    
    var activeRect : UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.backgroundColor = UIColor(red: 215.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0).cgColor

        self.layer.frame = CGRect(x: 0, y: 0, width: 250.0, height: 100.0)
        
        // MARK: ----> Create Color Buttons
        
        instantiateRedButton()
        instantiateBlueButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiateRedButton(){
        let redButton = UIButton(frame: CGRect(x: 20, y: 20, width: 30, height: 30))
        redButton.backgroundColor = .red
        
        redButton.setTitle("Red", for: .normal)
        redButton.addTarget(self, action: #selector(self.redButtonPressed), for: .touchUpInside)
        
        self.addSubview(redButton)
    }
    
    @objc func redButtonPressed(){

        
        activeRect.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        
    }
    
    func instantiateBlueButton(){
        let blueButton = UIButton(frame: CGRect(x: 80, y: 20, width: 30, height: 30))
        blueButton.backgroundColor = .blue
        
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(self.blueButtonPressed), for: .touchUpInside)
        
        self.addSubview(blueButton)
    }
    
    @objc func blueButtonPressed(){
         activeRect.layer.backgroundColor = UIColor(red: 5.0/255.0, green: 10.0/255.0, blue: 245.0/255.0, alpha: 1.0).cgColor
    }
    
    
    

}



