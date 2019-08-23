//
//  DelegateViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 19/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    var popupViewController : PopupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toPop" {
             popupViewController = segue.destination as? PopupViewController
            popupViewController?.saveTime = false
            popupViewController?.delegate = self
        }
    }
    
    deinit {
        print("hello i am DelegateViewController")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DelegateViewController : PopupViewDelegate {
    
    func updateDateAndTime(value: String) {
        self.dateTimeLabel.text = value
    }
}
