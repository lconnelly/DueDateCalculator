//
//  ViewController.swift
//  Calculator
//
//  Created by Leo Connelly on 12/23/18.
//  Copyright © 2018 Sensus Coding. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let inputDate = 0
    var actualDueDate = 0
    var futureDate = Date()

    

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var dueDateTextField: UILabel!
    
    private var datePicker: UIDatePicker?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        let numberOfDays = 720
        //var Date = datePicker?.datePickerMode
        

        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
        
     
        
    }
    
    @objc func viewTapped (gestureRecognizer: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
       let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "MM/dd/yyyy"
        
        
        //SEND THIS TO THE NEXT PAGE
        let inputDate = dateFormatter.string(from: datePicker.date)
        print(inputDate + "Yeet Yeet Yeet" )
        
        
        inputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)

        //CALCULATE DUE DATE
        let currentDate = datePicker.date
        print("-------------------")
        print(currentDate)
        print("-------------------")
        
        var dateComponent = DateComponents()
        let monthsToAdd = 0
        let daysToAdd = 270
        let yearsToAdd = 0
        
        dateComponent.month = monthsToAdd
        dateComponent.day = daysToAdd
        dateComponent.year = yearsToAdd
        
        futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)!
        
        print(currentDate)
        print(futureDate)
        
        print("-------------------")
        print("-------------------")
        update()
        
    }
    
    
   
    
    @IBAction func openSelectionPicker(_ sender: Any) {
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    func update () {

        DispatchQueue.main.async {
            let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "MM/dd/yyyy"
            self.dueDateTextField.text = dateFormatter.string(from: self.futureDate)
        }
        
        
        
    }
    
    
}

