//
//  ViewController.swift
//  KaleidoKonvert
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBOutlet weak var btn4: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.cornerRadius = 20
        btn2.layer.cornerRadius = 20
        btn3.layer.cornerRadius = 20
        btn4.layer.cornerRadius = 20
        
        
        
        
    }
    
    
    @IBAction func power(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Power")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func potion(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Potion")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func twrap(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "TimeWrap")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func Dwrap(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "DWrap")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    

}

