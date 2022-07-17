//
//  HomeVC.swift
//  Canciones
//
//  Created by Achitha Sandaruwan on 1/16/22.
//

import UIKit

class HomeVC: UIViewController {

    
    //MARK: - OUTLETS
    @IBOutlet weak var albumArtView: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    
    //MARK: - VARIABLES
    var isPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func playBtnAction(_ sender: Any) {
        
        isPlay = !isPlay
        
        if isPlay {
        if let image = UIImage(systemName: "pause.circle.fill") {
            playBtn.setImage(image, for: .normal)
        }
        } else {
            if let image = UIImage(systemName: "play.circle.fill") {
                playBtn.setImage(image, for: .normal)
            }
        }
        
    }
    
    
}
