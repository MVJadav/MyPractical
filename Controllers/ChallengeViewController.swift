//
//  ChallengeViewController.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    let intervalTime = 180.0
    let challengesViewModel : ChallengesViewModel = ChallengesViewModel()
    var timer: Timer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        timer = Timer.scheduledTimer(timeInterval: intervalTime, target: self, selector: #selector(self.sayHello), userInfo: nil, repeats: true)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer?.invalidate()
    }
    
}


extension ChallengeViewController {
    
    private func registerCell() {
        pageControl.numberOfPages = self.challengesViewModel.challengesArr.count
        pageControl.currentPage = 0
        self.collectionView.register(UINib(nibName: "ChallengeViewCell", bundle: nil), forCellWithReuseIdentifier: "ChallengeViewCell")
    }
    
    func getData() {
        self.challengesViewModel.getChallenges { (success, error) in
            if success == true {
                self.pageControl.isHidden = false
                self.registerCell()
                self.collectionView.reloadData()
            }
        }
    }
    @objc func sayHello(){
        self.getData()
    }
}

extension ChallengeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.challengesViewModel.challengesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt  indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width), height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeViewCell", for: indexPath) as? ChallengeViewCell else { return UICollectionViewCell() }
        /*if ((indexPath.row%2) == 0) {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .yellow
        }*/
        cell.challenges = self.challengesViewModel.challengesArr[indexPath.row]
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.pageControl.currentPage = currentPage
    }
}
