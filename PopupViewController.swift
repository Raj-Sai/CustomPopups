//
//  PopupViewController.swift
//  CustomPopups
//
//  Created by Amsaraj Mariappan on 18/8/2562 BE.
//  Copyright © 2562 Amsaraj Mariyappan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol PopupViewDelegate : class {
    func updateDateAndTime(value: String)
}


class PopupViewController: UIViewController {

    
    @IBOutlet weak var lableDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIButton!
    
    private var selectedDateTime = BehaviorRelay<String>(value: "name")
    
    var observableVale: Observable<String> {
        return selectedDateTime.asObservable()
    }
    
    weak var delegate: PopupViewDelegate?
    
    var saveTime: Bool = false
    
    var onSave: ((_ date: String) -> ())?
    
    var formatedDate: String {
        get {
            let formater = DateFormatter()
            formater.dateStyle = .medium
            return formater.string(from: datePicker.date)
        }
    }
    
    var formatedTime: String {
        get {
            let formater = DateFormatter()
            formater.timeStyle = .short
            return formater.string(from: datePicker.date)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if saveTime {
            lableDate.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }
    }
    

    @IBAction func save_date_touch(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: .saveDateTime, object: self)
      
        if saveTime {
            onSave?(formatedTime)
            delegate?.updateDateAndTime(value: formatedTime)
            selectedDateTime.accept(formatedTime)
        } else {
            onSave?(formatedDate)
            delegate?.updateDateAndTime(value: formatedDate)
            selectedDateTime.accept(formatedDate)
        }
        dismiss(animated: true )
    }
    
    deinit {
        print("i am deinit PopupViewController")
    }
}
