

import Foundation
import UIKit


extension UIViewController{
    
    
    func showAlert(message:String){
        let refreshAlert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
        }))
        present(refreshAlert, animated: true, completion: nil)
    }
    
}
class BaseVC: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    func showAlert(message: String?, title:String = "Information", otherButtons:[String:((UIAlertAction)-> ())]? = nil, cancelTitle: String = "Okay", cancelAction: ((UIAlertAction)-> ())? = nil) {
        let newTitle = title.capitalized
        let newMessage = message
        let alert = UIAlertController(title: newTitle, message: newMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction))
        
        if otherButtons != nil {
            for key in otherButtons!.keys {
                alert.addAction(UIAlertAction(title: key, style: .default, handler: otherButtons![key]))
            }
            
        }
        present(alert, animated: true, completion: nil)
    }
}
