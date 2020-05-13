//
//  ArduinoPeripheral.swift
//  TempControl2
//
//  Created by Michael Marsella on 5/9/20.
//  Copyright © 2020 Michael Marsella. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class ArduinoPeripheral: NSObject {
    //Arduino identifiers needed here
    public static let serviceUUID = CBUUID.init(string: "FFE0")
    public static let editUUID = CBUUID.init(string: "FFE1")
}
