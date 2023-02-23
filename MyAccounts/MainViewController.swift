//
//  ViewController.swift
//  MyAccounts
//
//  Created by Ohjun-Wizardlab on 2023/02/08.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseFirestore

class MainViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var viewModel = MainViewModel()
	
	let db = Firestore.firestore()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		
		tableView.reloadData()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		
	}
	
	func addData() {
		var ref: DocumentReference? = nil
		ref = db.collection("abc").addDocument(data: [
				"first": "Ada",
				"last": "Lovelace",
				"born": 1815
		]) { err in
				if let err = err {
						print("Error adding document: \(err)")
				} else {
						print("Document added with ID: \(ref!.documentID)")
				}
		}
	}
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell") as? BasicCell else { return UITableViewCell() }
		
		let model = viewModel.data[indexPath.row]
		cell.name.text = model.name
		cell.cost.text = "\(model.cost)"
		
		return cell
	}
	
	
}

class BasicCell: UITableViewCell {
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var cost: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
}
