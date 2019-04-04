//
//  SecondViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/6/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    //properties
    var allData = [listAnak]()
    let URL_API = "https://outclass.ga/?api"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.delegate = self
        callAlamo()
        
        self.tableViewAnak.setContentOffset(CGPoint(x:0, y:44), animated: true)
        
        searchController.searchResultsUpdater = self
//        if #available(iOS 9.1, *) {
//            searchController.obscuresBackgroundDuringPresentation = false
//        } else {
//            // Fallback on earlier versions
//        }
        searchController.searchBar.placeholder = "Cari siapa?"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
            navigationItem.titleView = searchController.searchBar
        }
        definesPresentationContext = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var tableViewAnak: UITableView!
    @IBOutlet weak var SearchAnak: UISearchBar!
    
    func callAlamo() {
        let parameters: Parameters=[
            "type":"fetch_all_data",
            "asli":"yes",
            "api_key":myApiKey.api_key]
        let headers: HTTPHeaders = [
            "X-CYDUK" : "yes"]
        Alamofire.request(URL_API, method: .post, parameters: parameters, headers: headers).responseJSON {
            response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")
            print("\(String(describing: response.result.value))")
            
            if let json = response.result.value{
                let anakArray : NSArray = json as! NSArray
                
                for i in 0..<anakArray.count{
                    self.allData.append(listAnak(
                        NRP : (anakArray[i] as AnyObject).value(forKey: "nrp") as? String,
                        panggilan : (anakArray[i] as AnyObject).value(forKey: "panggilan") as? String,
                        idline : (anakArray[i] as AnyObject).value(forKey: "line") as? String,
                        namalengkap: (anakArray[i] as AnyObject).value(forKey: "nama") as? String,
                        gender: (anakArray[i] as AnyObject).value(forKey: "gender") as? String,
                        agama: (anakArray[i] as AnyObject).value(forKey: "agama") as? String,
                        nohppribadi: (anakArray[i] as AnyObject).value(forKey: "nohpdiri") as? String,
                        nohportu: (anakArray[i] as AnyObject).value(forKey: "nohportu") as? String,
                        nohpwali: (anakArray[i] as AnyObject).value(forKey: "wali") as? String,
                        email: (anakArray[i] as AnyObject).value(forKey: "email") as? String,
                        tempatlahir: (anakArray[i] as AnyObject).value(forKey: "tempatlahir") as? String,
                        tanggallahir: (anakArray[i] as AnyObject).value(forKey: "tgllahir") as? String,
                        alamatasal: (anakArray[i] as AnyObject).value(forKey: "asal") as? String,
                        asalkota: (anakArray[i] as AnyObject).value(forKey: "asalkota") as? String,
                        alamatsby: (anakArray[i] as AnyObject).value(forKey: "sby") as? String
                    ))
                }
                self.tableViewAnak.reloadData()
            }
            
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredAnak.count
        }
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondViewControllerTableViewCell
        var anak = allData[indexPath.row]
        if isFiltering() {
            anak = filteredAnak[indexPath.row]
        } else {
            anak = allData[indexPath.row]
        }
        cell.labelPanggilan.text = anak.panggilan
        cell.labelidline.text = anak.idline
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = storyboard.instantiateViewController(withIdentifier: "DetailAnakViewController") as! DetailAnakViewController
        
        let satuAnak = allData[indexPath.row]
        DvC.getPanggilan = satuAnak.panggilan!
        DvC.getNama = satuAnak.namalengkap!
        DvC.getNRPanak = satuAnak.NRP!
        DvC.getAgama = satuAnak.agama!
        DvC.getGender = satuAnak.gender!
        DvC.getnohhpdiri = satuAnak.nohppribadi!
        DvC.getnohhportu = satuAnak.nohportu!
        DvC.getwali = satuAnak.nohpwali!
        DvC.getLine = satuAnak.idline!
        DvC.getEmail = satuAnak.email!
        DvC.gettempatLahir = satuAnak.tempatlahir!
        DvC.gettgllahir = satuAnak.tanggallahir!
        DvC.getAsalAlamat = satuAnak.alamaatasal!
        DvC.getAsalKota = satuAnak.asalkota!
        DvC.getSbyTinggal = satuAnak.alamatsby!
        
        self.navigationController?.pushViewController(DvC, animated: true)
    }
    
    //searchingAnak
    var filteredAnak = [listAnak]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        // Filter the array using the filter method
        filteredAnak = allData.filter({ (aSpecies: listAnak) -> Bool in
            return aSpecies.namalengkap!.lowercased().contains(searchText.lowercased())
            return aSpecies.panggilan!.lowercased().contains(searchText.lowercased())
            return aSpecies.NRP!.lowercased().contains(searchText.lowercased())
            return aSpecies.asalkota!.lowercased().contains(searchText.lowercased())
            return aSpecies.idline!.lowercased().contains(searchText.lowercased())
            return aSpecies.nohppribadi!.lowercased().contains(searchText.lowercased())
            return aSpecies.agama!.lowercased().contains(searchText.lowercased())
            return aSpecies.gender!.lowercased().contains(searchText.lowercased())
        })
        tableViewAnak.reloadData()
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    
}

extension SecondViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

