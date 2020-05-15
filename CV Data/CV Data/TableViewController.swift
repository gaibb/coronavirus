//
//  TableViewController.swift
//  CoronVirusData
//
//  Created by gaibb on 2020/4/2.
//  Copyright © 2020 gaibb. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var datas : [AreaData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return datas.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var array : [String] = []
        
        if indexPath.section == 0 {
            array = ["AREA", "CONFIRMED", "DEATH", "CURED"]
        }
        else {
            let data = datas[indexPath.section - 1]
            array = data.dataArray
        }
        cell.areaLabel.text = array[0]
        cell.confirmedLabel.text = array[1]
        cell.deathLabel.text = array[2]
        cell.curedLabel.text = array[3]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "input2" {
            let controller = segue.destination as! InputViewController
            for var data in datas {
                controller.dictionary[data.area] = data
            }
        }
    }
}
