//
//  ColorPanel.swift
//  kalve
//
//  Created by Michael Fox on 6/20/18.
//  Copyright © 2018 Michael Fox. All rights reserved.
//

import UIKit

class ColorPanel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.backgroundColor = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0).cgColor
        
        self.layer.frame = CGRect(x: 0, y: 0, width: 100.0, height: 100.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
