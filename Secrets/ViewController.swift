//
//  ViewController.swift
//  Secrets
//
//  Created by Andrew Pontious on 8/6/17.
//  Copyright © 2017 Andrew Pontious.
//  Some right reserved: http://opensource.org/licenses/mit-license.php
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()

		do {
			let password = try SAMKeychain.password(forService: "MyService", account: "MyAccount")
			textField.text = password
		} catch let error as NSError {
			if (error.code != Int(errSecItemNotFound)) {
				print("\(error)")
			}
		}

		textField.becomeFirstResponder()
	}

	@IBAction func textFieldDidChange(_ sender: Any) {
		if let text = textField.text, !text.isEmpty {
			do {
				try SAMKeychain.setPassword(text, forService: "MyService", account: "MyAccount")
			} catch let error as NSError {
				print("\(error)")
			}
		} else {
			do {
				try SAMKeychain.deletePassword(forService: "MyService", account: "MyAccount")
			} catch let error as NSError {
				print("\(error)")
			}
		}
	}
}

