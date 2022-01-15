//
//  ViewController.swift
//  Canciones
//
//  Created by Achitha Sandaruwan on 1/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              
              let destinationVC = storyboard.instantiateViewController(identifier: "FirstVC")
//              /// To act as a navigation Link animation
//              self.navigationController?.pushViewController(destinationVC, animated: true)
//             /// To act as a sheet view
//              self.present(destinationVC, animated: true, completion: nil)
              /// Show works better with iPads also
              self.show(destinationVC, sender: self)
        
    }
    
}

