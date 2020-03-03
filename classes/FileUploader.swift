//
//  FileUploader.swift
//  FileUploader
//
//  Created by Nishit Mishra on 03/03/20.
//  Copyright © 2020 Nishit Mishra. All rights reserved.
//

import Foundation
import Alamofire
@objc public class UploadUtilities:NSObject{
    @objc public class func uploadData(dataToBeUploaded:NSData,googleUrl:NSString,handler:@escaping ((Int)->(Void))){
        Alamofire.upload(dataToBeUploaded as Data, to: googleUrl as String, method: .put, headers: nil)
            .uploadProgress(closure: { (progress) in
                print("print progress \(progress.fractionCompleted)");
            })
            .responseJSON { (response) in
                print("response from upload image \(response)");
                handler(response.response?.statusCode ?? 0)
        }
        
    }
    @objc public class func uploadVideo(videoUrl:NSURL,googleUrl:NSString,handler:@escaping ((Int)->(Void))){
        Alamofire.upload(videoUrl as URL, to: googleUrl as String)
            
            .uploadProgress(closure: { (progress) in
                print("print progress \(progress.fractionCompleted)");
                
            })
            .responseJSON { (response) in
                handler(response.response?.statusCode ?? 0)
        }
    }
}
