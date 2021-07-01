//
//  RealityView+SessionDelegates.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 16/06/2021.
//

import ARKit
import Combine
import SwiftUI
import RealityKit

extension RealityView: ARSessionDelegate {

func session(_ session: ARSession, didUpdate frame: ARFrame) {
  guard (session.currentFrame?.camera) != nil else { return }

  startPlaneRaycast()
}

  func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
    print("did add anchor")
  }

}
