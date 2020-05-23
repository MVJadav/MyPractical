//
//  WebClient.swift
//  WebClient-Swift
//
//  Created by Harry on 19/11/16.
//
//

import UIKit
import Alamofire

var kInternetConnectionMessage = "Please check your internet connection"
var kTryAgainLaterMessage = "Please try again later"
var kErrorDomain = "Error"
var kDefaultErrorCode = 1234

var kSuccessKey = "status"
var kMessageKey = "message"

/**
# MultipartFormDataBlock
 
**Snippet**
multipartFormData.appendBodyPart(data: name : )
multipartFormData.appendBodyPart(data: name : mimeType:)

**Example**

    
    multipartFormData: { multipartFormData in
    multipartFormData.appendBodyPart(data: self.name.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name :"article[name]")
    for var i = 0; i < self.photoArray.count; i++ {
        let imageData = UIImageJPEGRepresentation(self.photoArray[i], 1)

        multipartFormData.appendBodyPart(data: imageData!, name: "article[article_images_attributes][][image]", mimeType: "image/jpeg")
 
    }
*/
typealias MultipartFormDataBlock = (_ multipartFormData : MultipartFormData?) -> Void
typealias CompletionBlock = (_ response: Any?, _ error: Error?) -> Void
typealias DownloadCompletionBlock = (_ filePath: String?, _ fileData: Data?, _ error: Error?) -> Void
typealias ResponseHandler = (_ response:DataResponse<Any>) -> Void

class WebClient: NSObject {
    
    //MARK: - Request
    
    class func requestWithUrlWithoutResponseValidation(url: String, parameters: Dictionary<String, Any>?, completion: CompletionBlock?) -> DataRequest? {
        let param = parameters ?? Dictionary()
        return Alamofire.request(url, method: HTTPMethod.post, parameters: param, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion?(value, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion?(nil, error)
                }
        }
    }
    
    class func requestWithJsonDataUrl(url: String, parameters: String, method: HTTPMethod = .post, completion: CompletionBlock?) -> DataRequest? {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
//        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = parameters.data(using: .utf8)
        return Alamofire.request(request)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    handleResponse(response: value, completion: completion)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion?(nil, error)
                }
                
                
        }
    }
    
    class func requestWithUrl(url: String, parameters: [String : Any]?, method: HTTPMethod = .post, completion: CompletionBlock?) -> DataRequest? {
    
        return Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate()            
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    handleResponse(response: value, completion: completion)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion?(nil, error)
                }
                
            
        }
    }
    
    //MARK: - Upload requests
    
/**
#   Multipart uploads
     
*[MultipartFormDataBlock](@MultipartFormDataBlock)
     
    - parameters:
     - url: The url in string where the data needs to be uploaded
     - multiPartFormDataBlock: Is a block of type MultipartFormDataBlock
     - completion: Is a block of type CompletionBlock
*/

    class func multiPartRequestWithUrlTest(url: String, parameters: Dictionary<String,Any>?, multiPartFormDataBlock: MultipartFormDataBlock?, completion: CompletionBlock?) -> Void {
        let param : Dictionary! = parameters ?? Dictionary()
        print("Param = \(String(describing: param))")
        Alamofire.upload(multipartFormData: { (multiPartFormData) in
            multiPartFormDataBlock?(multiPartFormData)
            if param != nil {
                for (key, value) in param! {
                    multiPartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
            
        }, to: url, encodingCompletion:{encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    
                    switch response.result {
                    case .success(let value):
                        handleResponse(response: value, completion: completion)
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion?(nil, error)
                    }
                }
            case .failure(let encodingError):
                completion?(nil, encodingError)
            }
            
        })
    }
    
    
    class func multiPartRequestWithUrl(url: String, parameters: Dictionary<String,Any>?, multiPartFormDataBlock: MultipartFormDataBlock?, completion: CompletionBlock?) -> Void {
        
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multiPartFormDataBlock?(multipartFormData)
            for (key, value) in parameters ?? [:] {
                multipartFormData.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: key)
//                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key as String)
            }
        }, usingThreshold: UInt64.init(),
           to: url, method: .post,
           headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
//                    print("Succesfully uploaded")
                    switch response.result {
                    case .success(let value):
                        handleResponse(response: value, completion: completion)
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion?(nil, error)
                    }
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                completion?(nil, error)
            }
        }
        /*
        Alamofire.upload(multipartFormData: { (multiPartFormData) in
            multiPartFormDataBlock?(multiPartFormData)
            //if param != nil {
            for (key, value) in parameters ?? [:] {
                multiPartFormData.append("\(value)".data(using: .utf8)!, withName: key)
            }
            //}
        }, to: url) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        handleResponse(response: value, completion: completion)
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion?(nil, error)
                    }
                }
            case .failure(let encodingError):
                completion?(nil, encodingError)
            }
        }
 */
    }
    
    // main queue by default
    class func upload(file:URL,url:String, progressHandler:@escaping Request.ProgressHandler, responseHandler:@escaping ResponseHandler){
        Alamofire.upload(file, to: url)
            .uploadProgress { progress in
                progressHandler(progress)
            }
            .downloadProgress { progress in
                progressHandler(progress)
            }
            .responseJSON { response in
                responseHandler(response)
        }
    }
    
    //MARK: - Handle Response
    
    class func handleResponse(response: Any?, completion: CompletionBlock?) {
//        print(response ?? "Response nil")
        let error = NSError(domain: kErrorDomain, code: kDefaultErrorCode, userInfo: [NSLocalizedDescriptionKey: kTryAgainLaterMessage])
        if !(response is [AnyHashable: Any]) {
            completion?(nil, error)
        }
        else {
            var codeKey = kSuccessKey
            var messageKey = kMessageKey
            var success = 0
            if ((response as! [String : Any]).has("token")) || ((response as! [String : Any]).has(kSuccessKey)) {
                if (response as! [AnyHashable: Any])["token"] as? String != nil  {
                    // ggole way point response give status == OK
                    success = 1
                }else {
                    //Our server response
                    success = (response as! [AnyHashable: Any])[kSuccessKey] as! Int
                }
                
            }
            else if (response as! [String : Any]).has("Successful") {
                //This is for race api 
                success = ((response as! [AnyHashable: Any])["Successful"] as! Bool) == true ? 1 : 0
                codeKey = "Successful"
                messageKey = "Message"
            } else if ((response as! [String : Any]).has("data")) {
                success = 1
            }
            
            
            if success == 1 {
                completion?(response, nil)
                
            } else if success == 2 {
                completion?(response, nil)
                
            }else if success == -1 {
                
                //AppDelegate.shared.navigationController.popToRootViewController(animated: true)
                completion?(nil, NSError(domain: "", code: (response as! [AnyHashable: Any])[codeKey] as? Int ?? 0, userInfo: [NSLocalizedDescriptionKey :(response as! [AnyHashable: Any])[messageKey] as? String ?? ""]))
                
            }
            else {
                completion?(nil, NSError(domain: "", code: (response as! [AnyHashable: Any])[codeKey] as? Int ?? 0, userInfo: [NSLocalizedDescriptionKey :(response as! [AnyHashable: Any])[messageKey] as? String ?? ""]))
            }
        }
    }
    
    // MARK: - Download File
    
    class func downloadFile(url: String, downloadCompletionBlock: DownloadCompletionBlock?) -> DownloadRequest? {
        return Alamofire.download(url)
            .downloadProgress(closure: { progress in
                
            })
            .responseData { response in
                switch response.result {
                case .success(let value):
                    downloadCompletionBlock?(nil, value, nil)
                case .failure(let error):
                    print(error.localizedDescription)
                    downloadCompletionBlock?(nil, nil, error)
                }
        }
    }
    
    class func downloadFile(url: String, atUrl: URL, downloadCompletionBlock: DownloadCompletionBlock?) -> DownloadRequest? {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            return (atUrl, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        return Alamofire.download(url, to: destination).response { response in
            if response.error == nil, let imagePath = response.destinationURL?.path {
                downloadCompletionBlock?(imagePath, nil, nil)
            }
            else {
                downloadCompletionBlock?(nil, nil, response.error)
            }
        }
    }
}


