//
//  SearchViewController.swift
//  CoronVirusData
//
//  Created by gaibb on 2020/4/2.
//  Copyright © 2020 gaibb. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var caseLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var curedLabel: UILabel!
    
    var data : [String] = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updataLabel()
    }
    
    
    func updataLabel() -> Void {
        countryLabel.text = data[0]
        caseLabel.text = data[1]
        deathLabel.text = data[2]
        curedLabel.text = data[3]
    }

}
