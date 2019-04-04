//
//  ProfileViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/10/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import AlamofireImage

class ProfileViewController: UIViewController {
    
    //UI asset data label
    @IBOutlet weak var Panggilanlabel: UILabel!
    @IBOutlet weak var Namalabel: UILabel!
    @IBOutlet weak var NRPlabel: UILabel!
    @IBOutlet weak var StatusMHS: UILabel!
    @IBOutlet weak var genderlabel: UILabel!
    @IBOutlet weak var agama: UILabel!
    @IBOutlet weak var TTLT: UILabel!
    @IBOutlet weak var TTLlabel: UILabel!
    @IBOutlet weak var nomorpribadi: UILabel!
    @IBOutlet weak var nomorortu: UILabel!
    @IBOutlet weak var nomorwali: UILabel!
    @IBOutlet weak var idline: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var asalkota: UILabel!
    @IBOutlet weak var alamatasal: UILabel!
    @IBOutlet weak var alamatsurabaya: UILabel!
    @IBOutlet weak var riwayatalergi: UILabel!
    @IBOutlet weak var riwayatpenyakit: UILabel!
    @IBOutlet weak var fotoProfileku: UIImageView!
    
    //aset
    let url_api = "https://outclass.ga/?api"
    let ProfileDataModel = profileDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parameters: [String : Any] = [
            "type":"fetch_data",
            "api_key":myApiKey.api_key,
            "nrp": myApiKey.NRPku,
            "asli": "yes"
        ]
        let headers: [String : String] = [
            "X-CYDUK" : "yes"]
        Alamofire.request(url_api, method: .post, parameters: parameters, headers: headers).responseJSON{
            response in
            if response.result.isSuccess {
                let profiledata : JSON = JSON(response.result.value!)
                self.updateProfileData(json: profiledata)
                print ("Sukses nih!")
            } else {
                print ("error \(String(describing: response.result.error))")
            }
        }
        let paramfoto: [String : Any] = [
            "type":"foto_self",
            "api_key":myApiKey.api_key,
            "fullSize":"no",
            "asli": "yes"
        ]
        Alamofire.request(url_api, method: .post, parameters: paramfoto, headers: headers).responseImage{
            response in
            guard let foto = response.result.value
            else{
                print("gagal")
                return
            }
            self.fotoProfileku.image = foto
        }
        /*****************/
        self.updateUIProfileData()
    }
    
    //MARK: - JSON Parsing

    func updateProfileData(json: JSON) {
        if let panggilan = json["table"]["panggilan"].string{
            ProfileDataModel.Panggilanku = panggilan
            ProfileDataModel.NRPku = json["table"]["nrp"].intValue
            ProfileDataModel.NamaLengkapku = json["table"]["nama"].stringValue
            //pertama
            ProfileDataModel.StatusMhsku = json["table"]["statusmhs"].intValue
            ProfileDataModel.salahsatustatus = ProfileDataModel.statusApa(condition: ProfileDataModel.StatusMhsku)
            ProfileDataModel.Genderku = json["table"]["gender"].stringValue
            ProfileDataModel.salahsatuGender = ProfileDataModel.genderApa(condition: ProfileDataModel.Genderku)
            ProfileDataModel.Agamaku = json["table"]["agama"].stringValue
            ProfileDataModel.TTLku = json["table"]["tgllahir"].stringValue
            ProfileDataModel.TTLTku = json["table"]["tempatlahir"].stringValue
            ProfileDataModel.nopribadiku = json["table"]["nohpdiri"].intValue
            ProfileDataModel.noortuku = json["table"]["nohportu"].intValue
            ProfileDataModel.nowali = json["table"]["wali"].intValue
            ProfileDataModel.idlineku = json["table"]["line"].stringValue
            ProfileDataModel.emailku = json["table"]["email"].stringValue
            ProfileDataModel.asalkotakku = json["table"]["asalkota"].stringValue
            ProfileDataModel.alamatasalku = json["table"]["asal"].stringValue
            ProfileDataModel.alamatsurabayaku = json["table"]["sby"].stringValue
            ProfileDataModel.riwayatalergiku = json["table"]["alergi"].stringValue
            ProfileDataModel.riwayatpenyakitku = json["table"]["penyakit"].stringValue
            
            updateUIProfileData()
            print("updateProfileData -> Berhasil")
        }else{
            print("gagal cuy")
        }
    }
    //MARK: - UI Updates
    func updateUIProfileData() {

        
        NRPlabel.text = String(ProfileDataModel.NRPku)
        Panggilanlabel.text = ProfileDataModel.Panggilanku
        Namalabel.text = ProfileDataModel.NamaLengkapku
        //pertama
        StatusMHS.text = ProfileDataModel.salahsatustatus
        genderlabel.text = ProfileDataModel.salahsatuGender
        agama.text = ProfileDataModel.Agamaku
        TTLT.text = ProfileDataModel.TTLTku
        TTLlabel.text = ProfileDataModel.TTLku
        //kedua
        nomorpribadi.text = String(ProfileDataModel.nopribadiku)
        nomorortu.text = String(ProfileDataModel.noortuku)
        nomorwali.text = String(ProfileDataModel.nowali)
        idline.text = ProfileDataModel.idlineku
        email.text = ProfileDataModel.emailku
        //ketiga
        asalkota.text = ProfileDataModel.asalkotakku
        alamatasal.text = ProfileDataModel.alamatasalku
        alamatsurabaya.text = ProfileDataModel.alamatsurabayaku
        //keempat
        riwayatalergi.text = ProfileDataModel.riwayatalergiku
        riwayatpenyakit.text = ProfileDataModel.riwayatpenyakitku
        
        print("updateUIProfileData -> Berhasil")
    }
    

    
    

}
