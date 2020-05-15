//
//  ViewController.swift
//  CoronVirusData
//
//  Created by gaibb on 2020/4/1.
//  Copyright © 2020 gaibb. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var datas : [AreaData] = []
    
    @IBOutlet weak var caseLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //从API中取出各个地区的数据
        requestData()
    }
    
    func requestData() {
        Alamofire.request("https://lab.isaaclin.cn/nCoV/api/area?latest=true").responseJSON(completionHandler: { response in
            if response.result.isSuccess {
                let json = JSON(response.value ?? "")
                self.saveData(json)
                //更新界面数据
                self.updateLabel()
            }
        })
    }
    
    func saveData(_ json:JSON) -> Void {
        for (_, subJson):(String, JSON) in json["results"] {
            datas.append(AreaData(subJson))
        }
        datas.sort(by: cmp(d1:d2:))
    }
    
    func updateLabel() -> Void {
        let number = count()
        caseLabel.text = "\(number[0])"
        deathLabel.text = "\(number[1])"
        recoveredLabel.text = "\(number[2])"
    }
    
    func count() -> [Int] {
        var number : [Int] = [0, 0, 0]
        for data in datas {
            number[0] += data.confirmedCount  //总确诊人数
            number[1] += data.deadCount       //总死亡人数
            number[2] += data.curedCount      //总治愈人数
        }
        return number
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "table" {
            let controller = segue.destination as! TableViewController
            controller.datas = datas
        }
        else if segue.identifier == "input1" {
            let controller = segue.destination as! InputViewController
            for var data in datas {
                controller.dictionary[data.area] = data
            }
        }
    }
    
    func cmp(d1: AreaData, d2: AreaData) -> Bool {
        return d1.confirmedCount > d2.confirmedCount
    }
    
}
