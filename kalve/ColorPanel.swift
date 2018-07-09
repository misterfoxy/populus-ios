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
        instantiateYellowButton()
        instantiateGreenButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ----> COLOR BUTTON FUNCTIONS
    
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
    
    func instantiateYellowButton(){
        let yellowButton = UIButton(frame: CGRect(x: 140, y: 20, width: 30, height: 30))
        yellowButton.backgroundColor = .yellow
        
        yellowButton.setTitle("Yl", for: .normal)
        yellowButton.addTarget(self, action: #selector(self.yellowButtonPressed), for: .touchUpInside)
        
        self.addSubview(yellowButton)
    }
    
    @objc func yellowButtonPressed(){
        activeRect.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
    }
    
    func instantiateGreenButton(){
        let greenButton = UIButton(frame: CGRect(x: 200, y: 20, width: 30, height: 30))
        greenButton.backgroundColor = .green
        
        greenButton.setTitle("Blue", for: .normal)
        greenButton.addTarget(self, action: #selector(self.greenButtonPressed), for: .touchUpInside)
        
        self.addSubview(greenButton)
    }
    
    @objc func greenButtonPressed(){
         activeRect.layer.backgroundColor = UIColor(red: 0/255.0, green: 255.0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
    }
    
    
    
    

}



