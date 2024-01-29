//
//  ViewController.swift
//  WeatherApp
//
//  Created by DOGUHAN on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 6
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn(_ sender: UIButton) {
        
        let city = textField.text ?? ""
        
        if city.isEmpty{
            
            let alert = UIAlertController(title: "UYARI", message: "sehir adi giriniz", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
        }else {
            
            let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            
            vc.city = city
            
            self.show(vc, sender: nil)
        }
        
        
    }
    
}

