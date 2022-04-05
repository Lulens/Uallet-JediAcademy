//
//  WalletsViewController.swift
//  Uallet
//
//  Created by Lucia Baez on 05/04/2022.
//

import UIKit


class WalletsViewController: UITableViewController {

    //MARK: - INICIO
    
    let cellIdentifier = "celdaWallets"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        title = "Wallets"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))


        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWallet))
        // Registrar una celda custom
        let nib = UINib(nibName: "WalletCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)

    }

    //MARK: - Eventos de UI
    
    @objc func addWallet() {
        let addVC = WalletAddViewController()
        present(UINavigationController(rootViewController: addVC), animated: true)

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletsStorage.shared.wallets.count
    }


    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        let wallet = WalletsStorage.shared.wallets[indexPath.row]
        cell.textLabel!.text = wallet.name

        return cell
    }

    fileprivate func crearElementosManual() {
        let stack = UIStackView(frame: CGRect(x: 15, y: 80, width: 300, height: 300))
        stack.axis = .vertical
        self.view.addSubview(stack)

        for wallet in WalletsStorage.shared.wallets {
            let label = UILabel()
            label.text = wallet.name
            stack.addSubview(label)
        }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    }
}
