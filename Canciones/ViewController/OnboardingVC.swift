//
//  OnboardingVC.swift
//  Canciones
//
//  Created by Achitha Sandaruwan on 1/16/22.
//

import UIKit

class OnboardingVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        /// A property observer
        didSet {
            /// When currentPage changes it assigns to pageControll
            pageControl.currentPage = currentPage
            /// When currentPage changes Button title changes
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Happy Music", description: "Online music streaming service for everyone", image: UIImage(named: "happy_music") ?? UIImage()),
            OnboardingSlide(title: "Feel the Music", description: "Online music streaming service for everyone", image: UIImage(named: "Listening") ?? UIImage()),
            OnboardingSlide(title: "Calm your Mind", description: "Online music streaming service for everyone", image: UIImage(named: "Music_re") ?? UIImage())
        ]
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            /// Redirecting to Main storyboard
            /// perform the segue
            performSegue(withIdentifier: "GotoMain", sender: self)
            
        } else {
            currentPage += 1
            /// Setting an Index path
            let indexPath = IndexPath(item: currentPage, section: 0)
            /// Scroll the collection view to specific slide
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    /// Segue happen if the sugue identifier matches
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GotoMain" {
            guard segue.destination is UITabBarController else { return }
        } else {}
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
    
    /// find the page in the scroll view
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        /// Getting the width of a scroll view single frame
        let width = scrollView.frame.width
        /// Getting the page by deviding full width of the scrooll view
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
