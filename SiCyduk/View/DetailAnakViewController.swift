//
//  DetailAnakViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/20/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit

class DetailAnakViewController: UIViewController {
    
    // Get data dari table
    var getNRPanak: String?
    var getNama: String?
    var getGender: String?
    var getPanggilan: String?
    var getAgama: String?
    var getnohhpdiri: String?
    var getnohhportu: String?
    var getwali: String?
    var getSbyTinggal: String?
    var getAsalAlamat: String?
    var getAsalKota: String?
    var gettempatLahir: String?
    var gettgllahir: String?
    var getEmail: String?
    var getLine: String?
    
    //asset
    @IBOutlet weak var tampilNRP: UILabel!
    @IBOutlet weak var tampilNama: UILabel!
    @IBOutlet weak var panggilanPanggilan: UILabel!
    @IBOutlet weak var tampilGender: UILabel!
    @IBOutlet weak var tampilAgama: UILabel!
    @IBOutlet weak var tampilTempat: UILabel!
    @IBOutlet weak var tampilTanggalL: UILabel!
    @IBOutlet weak var tampilnohppribadi: UILabel!
    @IBOutlet weak var tampilnohportu: UILabel!
    @IBOutlet weak var tampilnowali: UILabel!
    @IBOutlet weak var tampilidLine: UILabel!
    @IBOutlet weak var tampilEmail: UILabel!
    @IBOutlet weak var tampilAsalKota: UILabel!
    @IBOutlet weak var tampilAsalAlamat: UILabel!
    @IBOutlet weak var tampilSbyAlamaat: UILabel!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tampilkanLengkap()
        
    }


    func tampilkanLengkap() {
        
        //tampilkan data di view
        tampilNRP.text = getNRPanak
        tampilNama.text = getNama
        panggilanPanggilan.text = getPanggilan
        tampilGender.text = getGender
        tampilAgama.text = getAgama
        tampilTempat.text = gettempatLahir
        tampilTanggalL.text = gettgllahir
        tampilnohppribadi.text = getnohhpdiri
        tampilnohportu.text = getnohhportu
        tampilnowali.text = getwali
        tampilidLine.text = getLine
        tampilEmail.text = getEmail
        tampilAsalKota.text = getAsalKota
        tampilAsalAlamat.text = getAsalAlamat
        tampilSbyAlamaat.text = getSbyTinggal
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
