//
//  ViewController.swift
//  pushNotifications
//
//  Created by Deekshith Maram on 1/4/19.
//  Copyright © 2019 Deekshith Maram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1(_ sender: Any) {
     
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstVC") as! FirstViewController
        self.navigationController?.pushViewController(firstVC, animated: true)

    }
    
    @IBAction func button2(_ sender: Any) {
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
