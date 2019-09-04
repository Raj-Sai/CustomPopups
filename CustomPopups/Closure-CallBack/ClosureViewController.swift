//
//  ClosureViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 22/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {
    
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    weak var popupViewController : PopupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPop" {
            popupViewController = segue.destination as? PopupViewController
            popupViewController?.saveTime = false
            
            // 1 type
            //vc.onSave = onSave
            
            // 2 type of callback using clouser
                        popupViewController?.onSave = { (data) in
                            self.dateTimeLabel.text = data
                        }
        }
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
    deinit {
        print("ClosureViewController has Deallocated" )
    }
}
