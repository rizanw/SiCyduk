//
//  profileDataModel.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/18/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit

class profileDataModel {
    
    var NRPku : Int = 0
    var Panggilanku : String = ""
    var NamaLengkapku : String = ""
    var StatusMhsku : Int = 0
    var Genderku : String = ""
    var Agamaku : String = ""
    var TTLTku : String = ""
    var TTLku : String = ""
    var nopribadiku : Int = 0
    var noortuku : Int = 0
    var nowali : Int = 0
    var idlineku : String = ""
    var emailku : String = ""
    var asalkotakku : String = ""
    var alamatasalku : String = ""
    var alamatsurabayaku : String = ""
    var riwayatalergiku : String = ""
    var riwayatpenyakitku : String = ""
    
    //tambahan
    var salahsatustatus : String = ""
    var salahsatuGender : String = ""
    
    func statusApa(condition: Int) -> String {
        switch (condition) {
        case 1:
            return "Sedang Aktif"
        default:
            return "Sedang tidak Aktif"
        }
    }
    func genderApa(condition: String) -> String {
        switch (condition) {
        case "L":
            return "Laki-laki"
        default:
            return "Perempuan"
        }
    }
}
