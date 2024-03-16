//
//  ViewController.swift
//  BlendifyPro
//
//  Created by Manish Bhanushali on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn1 : UIButton!
    @IBOutlet weak var btn2 : UIButton!
    @IBOutlet weak var btn3 : UIButton!
    @IBOutlet weak var btn4 : UIButton!
    
    @IBOutlet weak var view1 : UIView!
    @IBOutlet weak var view2 : UIView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        btn1.layer.cornerRadius = 20
        btn1.layer.borderColor = UIColor.black.cgColor
        btn1.layer.borderWidth = 4
        
        btn4.layer.cornerRadius = 20
        btn4.layer.borderColor = UIColor.black.cgColor
        btn4.layer.borderWidth = 4
        
        btn3.layer.cornerRadius = 20
        btn3.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderWidth = 4
        
        btn2.layer.cornerRadius = 20
        btn2.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderWidth = 4
        
        
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
    }
    
    @IBAction func phbtn(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "ConsenSolution")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func phbtn1(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Consenmolar")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    @IBAction func phbtn2(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier:"Viscodynamic")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    @IBAction func phbtn3(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "Viscokinetic")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    


}

