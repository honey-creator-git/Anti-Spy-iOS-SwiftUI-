//
//  VibrationHelper.swift
//  AntiSpy
//
//  Created by Rome on 4/23/23.
//

import Foundation
import SwiftUI

func makeVibration(){
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}
