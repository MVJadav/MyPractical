//
//  ChallengeViewCell.swift
//  MehulJadavPractical
//
//  Created by Mehul Jadav on 22/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ChallengeViewCell: UICollectionViewCell {

    @IBOutlet weak var contectInfoView  : UIView!
    @IBOutlet weak var lblTitle         : UILabel!
    @IBOutlet weak var imgChallenge     : UIImageView!
    @IBOutlet weak var lblInfo          : UILabel!
    @IBOutlet weak var lblDescription   : UILabel!
    @IBOutlet weak var btlComplete      : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Common.default.addshadow(View: self.contectInfoView, shadowRadius: 5.0, shadowColor: UIColor.lightGray, shadowOpacity: 1.0, borderWidth: 0.0, borderColor: UIColor.clear, cornerRadius : 4.0 , shadowOffset: CGSize(width: 1.0, height: 1.0))
        btlComplete.layer.cornerRadius = 25
        btlComplete.layer.masksToBounds = true
    }

    var challenges: ChallengesModel? {
    didSet {
        
            if let title = challenges?.challenge_type.type?.capitalized {
                let str = "today's challenge : \(title)".capitalized
                self.lblTitle.attributedText = Common().setBoldStringWithColor(strOriginal: str, strBold: title, size: 20, boldSize : 20, regulatColor: .black, boldColor: .green)
            }
            if let img = challenges?.image {
                self.imgChallenge = AppUtility.default.loadImage(img, imgView: self.imgChallenge)
            }
            if let info = challenges?.title {
                self.lblInfo.text = info
            }
            if let desc = challenges?.Desc {
                self.lblDescription.text = desc.html2String
            }
            if let points = challenges?.points {
                let str = (points > 1) ? "points" : "point"
                self.btlComplete.setTitle("Completed for \(points) \(str)", for: .normal)
            }
        
        }
    }
}
