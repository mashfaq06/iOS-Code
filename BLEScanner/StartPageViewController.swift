//
//  StartPageViewController.swift
//  BLEScanner
//
//  Created by Mohammed Ashfaq on 28/01/1440 AH.
//  Copyright © 1440 Mohammed Ashfaq. All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController
{
    
    @IBOutlet weak var labelUserName: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //getting user data from defaults
        let defaultValues = UserDefaults.standard
        if let name = defaultValues.string(forKey: "username"){
            //setting the name to label
            labelUserName.text = name
        }
        else
        {
            //send back to login view controller
        }
    }
    
    
    @IBAction func LogoutButton(_ sender: Any)
    {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //switching to login screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func ScanButton(_ sender: Any)
    {
        let scanDevicesViewController = self.storyboard?.instantiateViewController(withIdentifier: "ScanDevicesViewController") as! ScanDevicesViewController
        self.navigationController?.pushViewController(scanDevicesViewController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
