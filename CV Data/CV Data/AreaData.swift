import Foundation
import SwiftyJSON

class AreaData {
    
    var area = ""       //地区名
    
    var confirmedCount = 0  //总确证人数
    var curedIncr = 0  //新增治愈人数
    var curedCount = 0 //累计治愈人数
    var currentConfirmedCount = 0  //现存确诊人数
    var currentConfirmedIncr = 0   //新增确诊人数
    var deadCount = 0  //累计死亡人数
    var deadIncr = 0   //新增死亡人数
    
    var dataArray: [String] = []

    init(_ subJson : JSON) {
        area = subJson["provinceName"].stringValue
        curedCount = subJson["curedCount"].intValue
        curedIncr = subJson["curedIncr"].intValue
        currentConfirmedCount = subJson["currentConfirmedCount"].intValue
        currentConfirmedIncr = subJson["currentConfirmedIncr"].intValue
        deadCount = subJson["deadCount"].intValue
        deadIncr = subJson["deadIncr"].intValue
        confirmedCount = subJson["confirmedCount"].intValue
        dataArray = [area, String(confirmedCount), String(deadCount), String(curedCount)]
    }
}
