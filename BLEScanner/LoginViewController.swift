//
//  LoginViewController.swift
//  BLEScanner
//
//  Created by Mohammed Ashfaq on 28/01/1440 AH.
//  Copyright © 1440 Mohammed Ashfaq. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController
{
    
    let URL_USER_LOGIN = "http://www.albasr.novsys.org/webservices/signin.php"
    
    let defaultValues = UserDefaults.standard

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
        labelMessage.text = ""
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //if user is already logged in switching to profile screen
        if defaultValues.string(forKey: "username") != nil
        {
            
            let startPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartPageViewController") as! StartPageViewController
            self.navigationController?.pushViewController(startPageViewController, animated: true)
            
        }

    }

    @IBAction func LoginButton(_ sender: Any)
    {
        let parameters: Parameters = [
            "email":usernameTextfield.text!,
            "password":passwordTextfield.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                //print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if((jsonData.value(forKey: "error") == nil))
                    {
                        
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "data") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "user_id") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userUsername = user.value(forKey: "name") as! String
                        let userName = user.value(forKey: "user_name") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userUsername, forKey: "userusername")
                        self.defaultValues.set(userName, forKey: "username")
                        
                        //switching the screen
                        let startPageViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartPageViewController") as! StartPageViewController
                        self.navigationController?.pushViewController(startPageViewController, animated: true)
                        
                        self.dismiss(animated: false, completion: nil)
                    }
                    else
                    {
                        //error message in case of invalid credential
                        self.labelMessage.text = "Invalid username or password"
                    }
                }
        }
        
        passwordTextfield.resignFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIViewController
{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
