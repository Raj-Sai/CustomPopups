//
//  SecondViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    var observer : NSObjectProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main, using: { [unowned self](notification) in
//            let vc = notification.object as! PopupViewController
//            self.dateTimeLabel.text = vc.formatedTime
//        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        if let observer = observer {
//            NotificationCenter.default.removeObserver(observer)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPopView" {
            
            let vc = segue.destination as! PopupViewController
            vc.saveTime = true
            vc.delegate = self
        }
    }


}

extension SecondViewController: PopupViewDelegate {
    func updateDateAndTime(value: String) {
        dateTimeLabel.text = value
    }
}

