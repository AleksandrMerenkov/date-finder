//
//  ViewController.swift
//  sss
//
//  Created by Анна Бровцина on 26.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTf: UITextField!
    @IBOutlet weak var monthTf: UITextField!
    @IBOutlet weak var yearTf: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func findWeekDay() {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let day = dateTf.text, let month = monthTf.text, let year = yearTf.text else {return}
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        var errorDay=0
        var errorMonth=0
        
        if dateComponents.day ?? 0 > 0 && dateComponents.day ?? 0  < 32 {
            errorDay=0
                if dateComponents.month ?? 0 > 0 && dateComponents.month ?? 0 < 13 {
                    errorMonth=0 } else {
                        errorMonth=1}
        }   else {
            errorDay=1
            if dateComponents.month ?? 0 > 0 && dateComponents.month ?? 0 < 13 {
                errorMonth=0 } else {
                    errorMonth=1}
            
        }
       
        switch (errorDay, errorMonth) {
        case (0,0):
            guard let date = calendar.date(from: dateComponents) else {return}
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let weekDate = dateFormatter.string(from: date)
            resultLabel.text = weekDate
        case (1,0):
            resultLabel.text = "Incorrect Date"
        case (0,1):
            resultLabel.text = "Incorrect Month"
        case (1,1):
            resultLabel.text = "Incorrect Date and Month"
        default:
            return
    }
    }
        
        
        
        
       
            
            
    
        
    
    
    @IBOutlet weak var Label: UILabel!
    
    

    @IBAction func changeTextInLabel(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
    
    
    
    
}

