
import UIKit

class Abtsvc: UIViewController {

    @IBOutlet weak var abvcf: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        abvcf.layer.cornerRadius = 20
        abvcf.layer.borderColor = UIColor.purple.cgColor
        abvcf.layer.borderWidth = 4
        
    }
    

    @IBAction func btnback(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
