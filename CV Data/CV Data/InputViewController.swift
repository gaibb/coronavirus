//
//  InputViewController.swift
//  CoronVirusData
//
//  Created by gaibb on 2020/4/2.
//  Copyright © 2020 gaibb. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    var dictionary : [String : AreaData] = [:]
    var data : [String] = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputText.returnKeyType = UIReturnKeyType.go
        InputText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var InputText: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        InputText.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        InputText.resignFirstResponder()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "search" {
            let countryname = InputText.text ?? ""
            let controller = segue.destination as! SearchViewController
            if dictionary.keys.contains(countryname) {
                controller.data[0] = dictionary[countryname]!.area
                controller.data[1] = String(dictionary[countryname]!.confirmedCount)
                controller.data[2] = String(dictionary[countryname]!.deadCount)
                controller.data[3] = String(dictionary[countryname]!.curedCount)
            }
        }
    }

}
