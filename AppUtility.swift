

import Foundation
import CoreLocation
import SDWebImage

class AppUtility: NSObject, CLLocationManagerDelegate {

    
    public static let `default` = AppUtility()
    
    @objc var navigationController: UINavigationController?
    
    var locationManager : CLLocationManager = CLLocationManager()
    var getLocationCompletion : ((CLLocation?) -> Void)?
    var isUpdatingLocation : Bool = false
    
    public override init() {
        super.init()
        intialize()
    }
    func intialize() {
        self.setupSVProgressHUD()
    }
    
    @objc func getUserCurrentLocation(completion: @escaping ((CLLocation?) -> Void)) {
        self.isUpdatingLocation = true
        self.locationManager.startUpdatingLocation()
        self.getLocationCompletion = completion
    }
    
    func applySkyscannerTheme(textField: SkyFloatingLabelTextField) {
        
        textField.tintColor = .gray
        textField.textColor =  .darkGray
        textField.lineColor = .gray
        textField.selectedTitleColor    = .blue
        textField.selectedLineColor     = .blue
        textField.lineHeight = 1.0
        textField.selectedLineHeight = 0.7
        textField.tintColor = .gray
 
    }
    
    func loadImage(_ imageUrl:String?, imgView:UIImageView, placeholderImage:UIImage? = UIImage(named: "img_placeholder_center"), placeholderContentMode:UIView.ContentMode = .center) -> UIImageView {

        if let imageURL = imageUrl {
            imgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imgView.contentMode = placeholderContentMode
            imgView.sd_setImage(with: URL(string: imageURL.replacing(" ", with: "%20")), placeholderImage: placeholderImage) { (image, error, cacheType, url) in
                if let image = image {
                    imgView.image = nil
                    imgView.contentMode = .scaleAspectFill
                    imgView.image = image
                }
            }
        } else {
            imgView.contentMode = placeholderContentMode
            imgView.image = placeholderImage
        }
        return imgView
    }
    
    func setupSVProgressHUD() {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.setForegroundColor(.black)
    }
}


enum MediaType : Int {
    case text   = 0
    case image  = 1
    case video  = 2
    case audio  = 3
}

