//
//  NotificationViewController.swift
//  customNotification1
//
//  Created by Deekshith Maram on 1/4/19.
//  Copyright © 2019 Deekshith Maram. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    @available(iOSApplicationExtension 10.0, *)
    func didReceive(_ notification: UNNotification) {
        let content = notification.request.content
        
        if let urlImageString = content.userInfo["urlImageString"] as? String {
            if let url = URL(string: urlImageString) {
                URLSession.downloadImage(atURL: url) { [weak self] (data, error) in
                    if let _ = error {
                        return
                    }
                    guard let data = data else {
                        return
                    }
                    DispatchQueue.main.async {
                         self?.image.image = UIImage(data: data)
                         self?.label?.text = notification.request.content.body
                    }
                }
            }
        }
    }

}

extension URLSession {
    
    class func downloadImage(atURL url: URL, withCompletionHandler completionHandler: @escaping (Data?, NSError?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            completionHandler(data, nil)
        }
        dataTask.resume()
    }
}
