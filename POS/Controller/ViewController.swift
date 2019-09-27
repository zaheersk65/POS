//
//  ViewController.swift
//  POS
//
//  Created by IMAC on 9/26/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var sideBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    var arrData = ["Items","Sales","Receipt","Setting"]
    var arrImg = [#imageLiteral(resourceName: "list"),#imageLiteral(resourceName: "sales"),#imageLiteral(resourceName: "recipt"),#imageLiteral(resourceName: "setting")]
    var arrData1 = ["Back Office","Help"]
    var arrImg1 = [#imageLiteral(resourceName: "bag"),#imageLiteral(resourceName: "help")]
    
    var isSideViewOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.separatorStyle = .none
        
        sideBar.isHidden = true
        isSideViewOpen = false
        
        
        
    }
    //MARK: - Table DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView2 {
            return arrData1.count
        }
        else{
             return arrData.count
        }
       
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
            cell.tableLabel2.text = arrData1[indexPath.row]
            cell.tableImage2.image = arrImg1[indexPath.row]
            return cell
        }
        else{
             let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
                    cell.tabelLabel.text = arrData[indexPath.row]
                    cell.tableImage.image = arrImg[indexPath.row]
                    return cell
        }
       
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if tableView == tableView2 {
            
            print(arrData1[indexPath.row])
            closeMenu()
         }
         else{
           
            
              print(arrData[indexPath.row])
            closeMenu()
         }
    }
    @IBAction func menuButton(_ sender: UIButton) {
        
        tableView.isHidden = false
                sideBar.isHidden = false
                self.view.bringSubviewToFront(sideBar)
                 
            if !isSideViewOpen{
                    openMenu()
                   }else{
                   closeMenu()
                   }
    }
    

    
    func openMenu() {
       
             isSideViewOpen = true//0
             sideBar.frame = CGRect(x: 0, y: 64, width: 0, height: 623)
        
             UIView.setAnimationDuration(0.3)
             UIView.setAnimationDelegate(self)
             UIView.beginAnimations("TableAnimation", context: nil)//1
             sideBar.frame = CGRect(x: 0, y: 44, width: 246, height: 623)
             
             UIView.commitAnimations()
        
    }
    func closeMenu() {
        tableView.isHidden = true
        sideBar.isHidden = true
         isSideViewOpen = false
         sideBar.frame = CGRect(x: 0, y: 64, width: 246, height: 623)
     
         UIView.setAnimationDuration(0.3)
         UIView.setAnimationDelegate(self)
         UIView.beginAnimations("TableAnimation", context: nil)
         sideBar.frame = CGRect(x: 0, y: 64, width: 0, height: 623)
     
         UIView.commitAnimations()
        
    }
}
    
    
    



