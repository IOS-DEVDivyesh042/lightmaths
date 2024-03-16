//
//  ViewController.swift
//  LuminaWiz
//
//  Created by Manish Bhanushali on 01/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var luminance: UIButton!
    
    
    @IBOutlet weak var iiiumination: UIButton!
    
    
    @IBOutlet weak var luminousintensi: UIButton!
    
    @IBOutlet weak var digitalima: UIButton!
    
    
    @IBOutlet weak var bgview: UIView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        luminance.layer.cornerRadius = 40
        luminance.layer.borderWidth = 4
        luminance.layer.borderColor = UIColor.orange.cgColor
        
        
        iiiumination.layer.cornerRadius = 40
        iiiumination.layer.borderWidth = 4
        iiiumination.layer.borderColor = UIColor.orange.cgColor
        
        
        
        digitalima.layer.cornerRadius = 40
        digitalima.layer.borderWidth = 4
        digitalima.layer.borderColor = UIColor.orange.cgColor
        
        luminousintensi.layer.cornerRadius = 40
        luminousintensi.layer.borderWidth = 4
        luminousintensi.layer.borderColor = UIColor.orange.cgColor
        
        bgview.layer.cornerRadius = 40
        bgview.layer.borderColor = UIColor.white.cgColor
        bgview.layer.borderWidth = 5
        
        
    
    }

    @IBAction func luminabtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Luminance") as! Luminance
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func iiimubtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Illumination") as! Illumination
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func lumiintsnbtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LuminousIntensity") as! LuminousIntensity
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func digibtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DigitalImageResolution") as! DigitalImageResolution
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    

}

