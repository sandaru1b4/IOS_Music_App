//
//  OnboardingVC.swift
//  Canciones
//
//  Created by Achitha Sandaruwan on 1/16/22.
//

import UIKit

class OnboardingVC: UIViewController {
    
    
    @IBOutlet weak var collectionViw: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Happy Music", description: "Online music streaming service for everyone", image: UIImage(named: "happy_music") ?? UIImage()),
            OnboardingSlide(title: "Feel the Music", description: "Online music streaming service for everyone", image: UIImage(named: "Listening") ?? UIImage()),
            OnboardingSlide(title: "Calm your Mind", description: "Online music streaming service for everyone", image: UIImage(named: "Music_re") ?? UIImage())
        ]
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
    }
    
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt IndexPath: IndexPath) ->  UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier , for: IndexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[IndexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
