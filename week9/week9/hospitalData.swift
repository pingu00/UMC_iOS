//
//  hospitalData.swift
//  week9
//
//  Created by Phil on 2022/11/25.
//

import Foundation

struct hospitalData: Decodable{
    let currentCount: Int
    let data: [Data]
}

struct Data: Decodable{
    var orgcd: String
    var orgnm: String
    var orgTlno: String
    var orgZipaddr: String
    var slrYmd: String
    var dywk: String
    var hldyYn: String
    var lunchSttTm: String?
    var lunchEndTm: String?
    var sttTm: String?
    var endTm: String?
    }
