//
//  listAnak.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/9/17.
//  Copyright © 2017 tc17. All rights reserved.
//
import Foundation
import SwiftyJSON

class listAnak {
    var NRP : String?
    var panggilan: String?
    var idline: String?
    var namalengkap: String?
    var gender: String?
    var agama: String?
    var nohppribadi: String?
    var nohportu: String?
    var nohpwali: String?
    var email: String?
    var tempatlahir: String?
    var tanggallahir: String?
    var alamaatasal: String?
    var asalkota: String?
    var alamatsby: String?
    
    init(NRP: String?, panggilan: String?, idline: String?, namalengkap: String?, gender: String?, agama: String?, nohppribadi: String?, nohportu: String?, nohpwali: String?, email: String?, tempatlahir: String?, tanggallahir: String?, alamatasal: String?, asalkota: String?, alamatsby: String?) {
        self.NRP = NRP
        self.panggilan = panggilan
        self.idline = idline
        self.namalengkap = namalengkap
        self.gender = gender
        self.agama = agama
        self.nohportu = nohportu
        self.nohppribadi = nohppribadi
        self.nohpwali = nohpwali
        self.email = email
        self.tempatlahir = tempatlahir
        self.tanggallahir = tanggallahir
        self.alamatsby = alamatsby
        self.asalkota = asalkota
        self.alamaatasal = alamatasal
        
    }
    
    
}
