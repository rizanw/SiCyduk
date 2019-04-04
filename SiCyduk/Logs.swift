//
//  Logs.swift
//  SiCyduk
//
//  Created by Rizky Andre on 10/22/17.
//  Copyright © 2017 tc17. All rights reserved.
//
//
//  NSLog.swift
//
//  Copyright © 2016 TestFairy. All rights reserved.
//

import Foundation

public func NSLog(_ format: String, _ args: CVarArg...) {
    let message = String(format: format, arguments:args)
    print(message);
    NSLogv(message, getVaList([]))
}
