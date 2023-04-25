//
//  DatePicker.swift
//  SwiftTweaks
//
//  Created by Vincent Villalta on 4/25/23.
//  Copyright © 2023 Khan Academy. All rights reserved.
//

import Foundation
import UIKit

class DatePicker {
	fileprivate let tweak: Tweak<Date>
	fileprivate let tweakStore: TweakStore
	
	init(anyTweak: AnyTweak, tweakStore: TweakStore) {
		assert(anyTweak.tweakViewDataType == .date, "Not allowed")
		self.tweak = anyTweak.tweak as! Tweak<Date>
		self.tweakStore = tweakStore
	}
	
	public func showDatePicker() {
		let datePicker = UIDatePicker()
		datePicker.date = tweakStore.currentValueForTweak(self.tweak)
		datePicker.locale = .current
		datePicker.addTarget(self, action: #selector(onDateValueChanged(_:)), for: .valueChanged)
	}
	
	@objc private func onDateValueChanged(_ datePicker: UIDatePicker) {
		tweakStore.setValue(
			.date(value: datePicker.date),
			forTweak: AnyTweak(tweak: tweak)
		)
	}
}
