//
//  DashboardViewController.swift
//  kalve
//
//  Created by Michael Fox on 7/8/18.
//  Copyright © 2018 Michael Fox. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        instantiateHeader()
        instantiateFooter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func instantiateHeader(){
        let k = UIView(frame: CGRect(x: 10, y: 20, width: 150, height: 100))
        
        let Title = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 80))
        
        Title.text = "Welcome to Kalve"
        
        Title.textColor = .black
        
        k.addSubview(Title)
        
        self.view.addSubview(k)
    }
    
    func instantiateFooter(){
        let k = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        
        k.backgroundColor = .cyan
        
        k.setTitle("Go to Canvas", for: .normal)
        
        k.addTarget(self, action: #selector(self.openNewCanvas), for: .touchUpInside)
        
        self.view.addSubview(k)
        
        
    }
    @objc func openNewCanvas(){
        print("tapped")
        let canvas = CanvasViewController()
        present(canvas, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
