

import UIKit
//import SideMenu
import StoreKit

class SidemenuVC: UIViewController {

    @IBOutlet weak var tblSidemenu: UITableView!
    var arrTblList = ["FEEDBACK" , "SHARE" , "PRIVACY", "TERMS ","HELPSUPPORT","RATE","ABOUTUS","HOW TO USE"]
        // var arrImg = ["FEEDBACK" , "SHARE" , "PRIVACY POLICY", "TERMS & CONDITION","HELP","SUPPORT","RATE","ABOUTUS","HOW TO USE"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        tblSidemenu.delegate = self
        tblSidemenu.dataSource = self
        
        
        
        tblSidemenu.layer.transform = CATransform3DMakeScale(1.1, 0.1, 0.1)
        UIView.animate(withDuration: 1.0,animations: { [self] in
            tblSidemenu.layer.transform = CATransform3DMakeScale(1.0, 1.0,1.0)
            
        }, completion: nil)
    }
  
}

extension SidemenuVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTblList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tblSidemenu.dequeueReusableCell(withIdentifier: "sidemenuTblCell", for: indexPath) as! sidemenuTblCell
        cell.lblTitle.text = arrTblList[indexPath.row]
        //cell.imgSidemenu.image = UIImage(named: arrImg[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
            self.navigationController?.pushViewController(vc, animated: true)
        
        }else if indexPath.row == 1{
            if let link = NSURL(string: "https://www.apple.com") {
                    let objectsToShare = [link] as [Any]
                    let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    self.present(activityVC, animated: true, completion: nil)
                }
        }
        else if indexPath.row == 2{
            let url = URL(string: "https://sites.google.com/view/privacy-policyand-contact/home")
                                       if UIApplication.shared.canOpenURL(url!) {
                                           UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                                           //If you want handle the completion block than
                                           UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                                               print("Open url : \(success)")
                                           })
                                       }
           
        }
       else if indexPath.row == 3{
           
           let url = URL(string: "https://policies.google.com/terms?hl=en-US")
                          if UIApplication.shared.canOpenURL(url!) {
                              UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                              
                              UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
                                  print("Open url : \(success)")
                              })
                          }
          
           
        }
    else if indexPath.row == 4{
        
        let sUrl = "https://sites.google.com/view/ios-applicationcontact/home?authuser=1"
        UIApplication.shared.openURL(NSURL(string: sUrl)! as URL)
        
            
        }
        else if indexPath.row == 5 {
            if #available(iOS 10.3, *) {
                  SKStoreReviewController.requestReview()
               } else {
                 
              }

            
            
        }
        else if indexPath.row == 6{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Abtsvc") as! Abtsvc
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 7{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "howto") as! howto
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
