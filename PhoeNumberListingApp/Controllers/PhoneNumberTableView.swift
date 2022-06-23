//
//  PhoneNumberTableView.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import UIKit


class PhoneNumberTableView: UITableView {
    
    var numbers: [PhoneNumber] = []
    var parentVC: UIViewController?
    
    override func awakeFromNib() {
        registerCells()
    }
    
    func registerCells(){
        register(UINib(nibName: PhoneNumberListCell.nameOfClass(), bundle: nil), forCellReuseIdentifier: PhoneNumberListCell.nameOfClass())
        delegate = self
        dataSource = self
        allowsSelection = true
        allowsMultipleSelection = false
        separatorColor = .clear
    }
}

extension PhoneNumberTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneNumberListCell.nameOfClass(), for: indexPath) as? PhoneNumberListCell else {return UITableViewCell()}
        cell.phoneNumber = numbers[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let phoneNumb = self.numbers[indexPath.row]
        if let vc = parentVC {
            AlertService.updateAlert(in: vc,
                                     phoneNumber: phoneNumb) { name, phone in
                let dict : [String:Any] = [
                    "name": name,
                    "phone": phone
                ]
                RealmService.shared.update(phoneNumb, dictionary: dict)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        let phoneNumb = self.numbers[indexPath.row]
        RealmService.shared.delete(phoneNumb)
    }
}
