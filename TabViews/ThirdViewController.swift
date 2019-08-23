//
//  ThirdViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopup" {
            let vc = segue.destination as! PopupViewController
            vc.saveTime = false
            
            // 1 type
            vc.onSave = onSave
            
            // 2 type of callback using clouser
//            vc.onSave = { [unowned self](data) in
//                self.dateTimeLabel.text = data
//            }
        }
    }
    
    func onSave(_ date: String) -> () {
        self.dateTimeLabel.text = date
    }
}
