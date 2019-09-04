//
//  NotificationViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    
     var observer : NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main, using: {[unowned self](data) in
            let vc = data.object as! PopupViewController
            self.dateTimeLabel.text = vc.formatedDate
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    deinit {
        print("i am deinit NotificationViewController")
    }
    

}
