//
//  ViewController.swift
//  MediOre
//
//  Created by Manish Bhanushali on 05/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var btn1: UIButton!
    
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.cornerRadius =  5
        btn2.layer.cornerRadius =  5
        btn3.layer.cornerRadius =  5
        btn4.layer.cornerRadius =  5
        btn5.layer.cornerRadius =  5
        view1.layer.cornerRadius =  80
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnIgm(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "IGM")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func btnIgg(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "IGG")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    @IBAction func btnige(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "IGE")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func btntibc(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "TIBC")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    @IBAction func btnuibc(_ sender: Any) {
        let nextvc = storyboard?.instantiateViewController(withIdentifier: "UIBC")
        self.navigationController?.pushViewController(nextvc!, animated: true)
    }
    
    
    
    
    
    


}

