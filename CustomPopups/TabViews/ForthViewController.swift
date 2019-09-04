//
//  ForthViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit
import RxSwift

class ForthViewController: UIViewController {
    
    @IBOutlet weak var dataTimeLabel: UILabel!
    
    var disposalBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopup" {
            let vc = segue.destination as! PopupViewController
            vc.saveTime = false
            vc.observableVale
                .subscribe(onNext: { [unowned self](data) in
                    self.dataTimeLabel.text = data
                }).disposed(by: disposalBag)
        }
    }
    
}
