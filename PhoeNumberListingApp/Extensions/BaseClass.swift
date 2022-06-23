//
//  BaseClass.swift
//  PhoeNumberListingApp
//
//  Created by Ruttab Haroon on 23/06/2022.
//

import UIKit

class BaseClass: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
