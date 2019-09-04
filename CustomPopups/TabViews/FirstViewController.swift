//
//  FirstViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var showDateLabel: UILabel!
    var observer:  NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // old way of notification
       //NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClose), name: .saveDateTime, object: nil)
        
        // new way
        
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { [unowned self](notification) in
            let obj = notification.object as! PopupViewController
            self.showDateLabel.text = obj.formatedDate
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    @objc func handlePopupClose(notification: Notification) {
        
        let obj = notification.object as! PopupViewController
        showDateLabel.text = obj.formatedDate
        
    }

    @IBAction func selectDate_touch(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "PopupStoryboard", bundle: nil)
        
        let viewcontroller = storyBoard.instantiateInitialViewController()! as! PopupViewController
        viewcontroller.saveTime = false
        
        self.present(viewcontroller, animated: true)
        
    }
}

