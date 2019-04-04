//
//  FirstViewController.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/6/17.
//  Copyright © 2017 tc17. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SpeciesWrapper {
    var species: [StarWarsSpecies]?
    var count: Int?
    var next: String?
    var previous: String?
}

enum SpeciesFields: String {
    case Name = "name"
    case Classification = "classification"
    case Designation = "designation"
    case AverageHeight = "average_height"
    case SkinColors = "skin_colors"
    case HairColors = "hair_colors"
    case EyeColors = "eye_colors"
    case AverageLifespan = "average_lifespan"
    case Homeworld = "homeworld"
    case Language = "language"
    case People = "people"
    case Films = "films"
    case Created = "created"
    case Edited = "edited"
    case Url = "url"
}

class StarWarsSpecies {
    var idNumber: Int?
    var name: String?
    var classification: String?
    var designation: String?
    var averageHeight: Int?
    var skinColors: [String]?
    var hairColors: [String]?
    var eyeColors: [String]?
    var averageLifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: Date?
    var edited: Date?
    var url: String?
    
    required init(json: [String: Any]) {
        self.name = json[SpeciesFields.Name.rawValue] as? String
        self.classification = json[SpeciesFields.Classification.rawValue] as? String
        self.designation = json[SpeciesFields.Designation.rawValue] as? String
        self.averageHeight = json[SpeciesFields.AverageHeight.rawValue] as? Int
        // TODO: more fields!
    }
}

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

