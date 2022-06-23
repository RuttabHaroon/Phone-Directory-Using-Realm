//
//  AlertService.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addAlert(in vc: UIViewController,
                         completiom: @escaping (String, String)->Void) {
        
        let alertVC = UIAlertController(title: "Add a Phone Number", message: "", preferredStyle: .alert)
        alertVC.addTextField { tf in
            tf.placeholder = "Name"
        }
        alertVC.addTextField { tf in
            tf.placeholder = "Phone"
        }
        let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
            guard let textFields = alertVC.textFields else { return }
            
            if let name = textFields[0].text,
                let phone = textFields[1].text {
                print("Name: \(name)")
                print("Phone: \(phone)")
                
                completiom(name, phone)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            alertVC.dismiss(animated: true, completion: nil)
            completiom("", "")
        }
        
        alertVC.addAction(doneAction)
        alertVC.addAction(cancelAction)
        vc.present(alertVC, animated: true, completion: nil)
        
    }
    
    static func updateAlert(in vc: UIViewController,
                            phoneNumber: PhoneNumber,
                         completiom: @escaping (String, String)->Void) {
        
        let alertVC = UIAlertController(title: "Update a Phone Number", message: "", preferredStyle: .alert)
        alertVC.addTextField { tf in
            tf.placeholder = "Name"
            tf.text = phoneNumber.name
        }
        alertVC.addTextField { tf in
            tf.placeholder = "Phone"
            tf.text = phoneNumber.phone
        }
        let doneAction = UIAlertAction(title: "Update", style: .default) { _ in
            guard let textFields = alertVC.textFields else { return }
            
            if let name = textFields[0].text,
                let phone = textFields[1].text {
                print("Name: \(name)")
                print("Phone: \(phone)")
                
                completiom(name, phone)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            alertVC.dismiss(animated: true, completion: nil)
            completiom("", "")
        }
        
        alertVC.addAction(doneAction)
        alertVC.addAction(cancelAction)
        vc.present(alertVC, animated: true, completion: nil)
        
    }
    
}
