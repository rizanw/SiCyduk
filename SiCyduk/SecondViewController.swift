//
//  SecondViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/6/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var allData = [listAnak]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondViewControllerTableViewCell
        let anak = allData[indexPath.row]
        cell.labelPanggilan.text = anak.panggilan
        cell.labelidline.text = anak.idline
        return cell
    }
    
    let URL_API = "https://tcits17.ga/?api"

    @IBOutlet weak var tableViewAnak: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                        panggilan : (anakArray[i] as AnyObject).value(forKey: "panggilan") as? String,
                        idline : (anakArray[i] as AnyObject).value(forKey: "line") as? String
                    ))
                }
                self.tableViewAnak.reloadData()
            }
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

