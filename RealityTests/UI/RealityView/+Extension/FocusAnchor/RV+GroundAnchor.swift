//
//  RV+GroundAnchor.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 16/06/2021.
//

import ARKit
import Combine
import SwiftUI
import RealityKit

extension RealityView {

  func startPlaneRaycast() {

    guard let query = arView.makeRaycastQuery(from: arView.center, allowing: .estimatedPlane, alignment: .horizontal) else { return }
    guard let raycastResult = arView.session.raycast(query).first else { return }

    // Set a transform to the FocusAnchor entity
    let transform = Transform(matrix: raycastResult.worldTransform)
    anchor.move(to: transform, relativeTo: anchor.parent, duration: 0.07, timingFunction: .easeInOut)




  }
}

