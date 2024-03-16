//
//  ViewController.swift
//  MetricMingle
//
//  Created by Manish Bhanushali on 24/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view1.layer.cornerRadius = 5
        view2.layer.cornerRadius = 5
        
        btn1.layer.cornerRadius = 4
        btn2.layer.cornerRadius = 4
        btn3.layer.cornerRadius = 4
        btn4.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnlength(_ sender: Any) {
        
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Length")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btnweight(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Weight")
        self.navigationController?.pushViewController(nextvc!, animated: true)
        
    }
    
    @IBAction func btnTemp(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Temp")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    
    @IBAction func btnVol(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Volume")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    


}

