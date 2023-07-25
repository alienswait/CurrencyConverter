//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Mertcan Ünek on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -VARIABLES
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    
    //MARK: -FUNCTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1- Request & Session
        // 2- Response & Data
        // 3- Parsing
        
        //1-
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=10d9c653b83164affbd4c67e088e90b3")
        
        let session = URLSession.shared
        //Closure
        let task = session.dataTask(with: url!) { Data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                //2-
                if Data != nil {
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: Data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                    }catch{
                        print("error")
                    }
                    
                }
            }
                
                
                }
        
        task.resume()
            }
    
            
        
    
    
}

