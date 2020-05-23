//
//  Common.swift
//  BoundlessCareGivers
//
//  Created by mac on 03/08/18.
//

import Foundation
import UIKit

class Common {
    
    public static let `default` = Common()
    
    func addshadow(View:UIView,shadowRadius:CGFloat? = 0,shadowColor:UIColor? = UIColor.darkGray,shadowOpacity:Float? = 0,borderWidth:CGFloat? = 0,borderColor:UIColor? = UIColor.clear,cornerRadius:CGFloat? = 0, shadowOffset:CGSize? = CGSize.zero, IsMaskToBounds:Bool = false) {
        
        View.layer.shadowRadius = shadowRadius!;
        View.layer.shadowColor = shadowColor?.cgColor;
        View.layer.shadowOffset = shadowOffset!
        View.layer.shadowOpacity = shadowOpacity!;
        View.layer.borderWidth = borderWidth!;
        View.layer.borderColor = borderColor?.cgColor;
        View.layer.cornerRadius = cornerRadius!;
        View.layer.masksToBounds = IsMaskToBounds
    }
    
    func setBoldStringWithColor(strOriginal: String, strBold:String, size : Int = 18, boldSize : Int = 20, regulatFont : String = "HelveticaNeue-Regular", regulatColor : UIColor = UIColor.white, boldFont : String = "HelveticaNeue-Bold", boldColor : UIColor = UIColor.white,kernValue : CGFloat = 3.81) -> NSAttributedString {
        
        let rangestrBold = (strOriginal as NSString).range(of: strBold)
        let attributedString = NSMutableAttributedString(string:strOriginal)
        
        attributedString.addAttribute(.foregroundColor, value: regulatColor , range: NSMakeRange(0, strOriginal.length))
        //attributedString.addAttribute(.font, value: UIFont(name: regulatFont, size: CGFloat(size))!, range: NSMakeRange(0, strOriginal.length))
        
        attributedString.addAttribute(.kern, value: kernValue, range: NSMakeRange(0, strOriginal.length))

        //attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.darkGray , range: rangestrBold)
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: boldFont, size: CGFloat(boldSize))!,
                                 NSAttributedString.Key.foregroundColor: boldColor]
        //let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
        // Part of string to be bold
        //attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue , range: rangestrBold)
        //attributedString.addAttribute(NSBackgroundColorAttributeName, value: AppColor.AppTheme_Primary , range: rangestrBold)
        attributedString.addAttributes(boldFontAttribute, range: rangestrBold)
        return attributedString
        
    }
    
    
    //MARK:- Set Font in Label
    /*func getFont(fontSize: CGFloat = 14,fontStyle: String = FontStyle.Regular) -> UIFont {
        
        
        if fontStyle == FontStyle.Bold {
            return UIFont(name: "HelveticaNeue" + FontStyle.Bold, size: fontSize)!
        }else if fontStyle == FontStyle.Regular {
            return UIFont(name: "HelveticaNeue", size: fontSize)!
        } else if fontStyle == FontStyle.Medium || fontStyle == FontStyle.SemiBold {
            return UIFont(name: "HelveticaNeue" + FontStyle.Medium, size: fontSize)!
        } else if fontStyle == FontStyle.Italic {
            return UIFont(name: "HelveticaNeue" + "-LightItalic", size: fontSize)!
        } else if fontStyle == FontStyle.Light {
            return UIFont(name: "HelveticaNeue" + FontStyle.Light, size: fontSize)!
        } else {
            return UIFont(name: "HelveticaNeue", size: fontSize)!
        }
        //return UIFont(name: "HelveticaNeue", size: fontSize)!
    }*/
    
}


extension UILabel {
    
    func addFontSpaing(value : CGFloat = 3.81) {
        let attributedString = NSMutableAttributedString(string:self.text!)
        attributedString.addAttribute(.kern, value: value, range: NSMakeRange(0, self.text!.length))
        self.attributedText = attributedString
    }
}
/*
extension UITextView {
    
    func addFontSpaing() {
        let attributedString = NSMutableAttributedString(string:self.text!)
        attributedString.addAttribute(.kern, value: 3.81, range: NSMakeRange(0, self.text!.length))
        self.attributedText = attributedString
    }
}

extension UITextField {
    
    func addFontSpaing() {
        let attributedString = NSMutableAttributedString(string:self.text!)
        attributedString.addAttribute(.kern, value: 3.81, range: NSMakeRange(0, self.text!.length))
        self.attributedText = attributedString
    }
}*/

extension UIButton {
    
    func addFontSpain(value : CGFloat = 2.86) {
        let attributedString = NSMutableAttributedString(string:(self.titleLabel?.text!)!)
        attributedString.addAttribute(.kern, value: value, range: NSMakeRange(0, (self.titleLabel?.text!.length)!))
        //self.attributedText = attributedString
        self.titleLabel?.attributedText = attributedString
    }
}
