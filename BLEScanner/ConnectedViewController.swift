//
//  ConnectedViewController.swift
//  BLEScanner
//
//  Created by Mohammed Ashfaq on 06/02/1440 AH.
//  Copyright © 1440 Mohammed Ashfaq. All rights reserved.
//

import UIKit
import CoreBluetooth

class ConnectedViewController: UIViewController, CBPeripheralManagerDelegate {

    
    @IBOutlet weak var label: UILabel!
    var transferCharacteristic:CBMutableCharacteristic!
    var dataToSend:NSData!
    
    
    var peripheralManager: CBPeripheralManager?
    var peripheral: CBPeripheral!
    var serviceName:[CBService] = []
    var service:CBService!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.text = "\(peripheral!)"
        peripheralManager = CBPeripheralManager.init(delegate: self, queue: nil)
        peripheralManager?.startAdvertising(nil)
       
        
        // Do any additional setup after loading the view.
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn
        {
            //self.transferCharacteristic = CBMutableCharacteristic.init(type:nil, properties: CBCharacteristicProperties.notify, value: nil, permissions: CBAttributePermissions.readable)
        }
        else
        {
            return
        }
        print("Peripheral manager is running")
    }

    

}//End of Class
