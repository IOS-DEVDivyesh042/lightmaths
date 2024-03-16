//
//  how to.swift
//  Unitify Pro
//
//  Created by Manish Bhanushali on 29/10/23.
//

import UIKit

class howto: UIViewController {

    @IBOutlet weak var txtde: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtde.layer.cornerRadius = 20
        txtde.layer.borderColor = UIColor.orange.cgColor
        txtde.layer.borderWidth = 4
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
