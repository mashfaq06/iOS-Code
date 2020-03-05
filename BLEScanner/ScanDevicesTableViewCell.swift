//
//  ScanDevicesTableViewCell.swift
//  BLEScanner
//
//  Created by Mohammed Ashfaq on 29/01/1440 AH.
//  Copyright © 1440 Mohammed Ashfaq. All rights reserved.
//

import UIKit


class ScanDevicesTableViewCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ConnectButton(_ sender: Any)
    {
    }
    

}
