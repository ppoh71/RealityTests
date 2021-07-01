//
//  RV+Setup.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 18/06/2021.
//

import ARKit

extension RealityView {

  /// Setup AR
  func setup() {

    /// delegates to connet ui with realityview
    self.observer.delegateBasicEntity = self

    /// Setup World Tracking
    configureWorldTracking()

    /// Add Focus Anchor
    arView.scene.addAnchor(anchor)
  }


  /// Configure World Tracking
  private func configureWorldTracking() {
    let configuration = ARWorldTrackingConfiguration()

    let sceneReconstruction: ARWorldTrackingConfiguration.SceneReconstruction = .mesh
    if ARWorldTrackingConfiguration.supportsSceneReconstruction(sceneReconstruction) {
      configuration.sceneReconstruction = sceneReconstruction
    }

    let frameSemantics: ARConfiguration.FrameSemantics = [.smoothedSceneDepth, .sceneDepth]
    if ARWorldTrackingConfiguration.supportsFrameSemantics(frameSemantics) {
      configuration.frameSemantics.insert(frameSemantics)
    }

    configuration.planeDetection.insert(.horizontal)
    session.run(configuration)
    defer { session.delegate = self }

    arView.renderOptions.insert(.disableMotionBlur)
  }
}
