//
//  StoreService.swift
//  MyAccounts
//
//  Created by Ohjun-Wizardlab on 2023/02/09.
//

import Foundation
import RxSwift

class StoreService {
	struct Object: Codable {
		var name: String
		var cost: Int
	}
	
	let dummy: [Object] = [Object(name: "갈비", cost: 23000),
												 Object(name: "삼겹살", cost: 41000),
												 Object(name: "목살", cost: 22000),
												 Object(name: "갈매기살", cost: 64000),
												 Object(name: "가브리살", cost: 55000)]
	
}


extension Encodable {
	var asDictionary: [String: Any]? {
		guard let object = try? JSONEncoder().encode(self),
					let dictionary = try? JSONSerialization.jsonObject(with: object) as? [String: Any] else { return nil}
		return dictionary
	}
}
