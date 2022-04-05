//
//  WalletAddViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 31/03/2022.
//

import UIKit

class WalletAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Wallet"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        
    }
        
    @objc func cancel () {
        dismiss(animated: true)
    }

    @objc func save () {
        dismiss(animated: true)
    }

}
