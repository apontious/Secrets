//
//  SecretsTests.swift
//  Secrets Unhosted Tests
//  Secrets Hosted Tests
//
//  Created by Andrew Pontious on 10/4/17.
//  Copyright © 2017 Andrew Pontious.
//  Some right reserved: http://opensource.org/licenses/mit-license.php
//

import XCTest

class SecretsTests: XCTestCase {
    
	func testSave() {
        do {
            let _ = try SAMKeychain.password(forService: "MyService", account: "MyTestAccount")

            try SAMKeychain.deletePassword(forService: "MyService", account: "MyTestAccount")
        } catch let error as NSError {
            if (error.code != Int(errSecItemNotFound)) {
                print("\(error)")
            }
        }

        XCTAssertNoThrow(try SAMKeychain.setPassword("Foo", forService: "MyService", account: "MyTestAccount"),
                         "Throws!")
	}
}
