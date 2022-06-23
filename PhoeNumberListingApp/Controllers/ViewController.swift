//
//  ViewController.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import UIKit
import RealmSwift

class ViewController: BaseClass {

    @IBOutlet weak var phoneNumberTableView: PhoneNumberTableView!
    
    var notifToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("REALM FILE PATH => \(RealmService.shared.getRealmFileURL())")
        
        self.phoneNumberTableView.parentVC = self
        
        let realm = RealmService.shared.realm
        let phoneNumbs = Array(realm.objects(PhoneNumber.self))
        self.phoneNumberTableView.numbers = phoneNumbs
        
        notifToken = realm.observe { [weak self] notification, realm in
            self?.phoneNumberTableView.numbers = Array(realm.objects(PhoneNumber.self))
            self?.phoneNumberTableView.reloadData()
        }
        
        RealmService.shared.observeRealmErrors(in: self) { err in
            print(err?.localizedDescription ?? "No error")
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notifToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        AlertService.addAlert(in: self) { [weak self] name, phone in
            let newPN = PhoneNumber(name: name, phone: phone)
            RealmService.shared.create(newPN)
        }
    }
    
}




