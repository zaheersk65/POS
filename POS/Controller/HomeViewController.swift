//
//  HomeViewController.swift
//  POS
//
//  Created by IMAC on 9/27/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    @IBAction func menuAcction(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController")
    
        self.navigationController?.pushViewController(vc!, animated: true)
        
         
    }
    
    
    

  

}
