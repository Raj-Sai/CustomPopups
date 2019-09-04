//
//  RxSwiftViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 22/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class RxSwiftViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    var disposalBag = DisposeBag()
    var popupViewController: PopupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
         self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopup" {
            popupViewController = segue.destination as? PopupViewController
            popupViewController?.saveTime = false
            popupViewController?.observableVale
                .subscribe(onNext: { [unowned self](data) in
                    self.dateTimeLabel.text = data
                }).disposed(by: disposalBag)
        }
    }
    
    deinit {
        print("RxSwiftViewController has Deallocated" )
    }

    
}
