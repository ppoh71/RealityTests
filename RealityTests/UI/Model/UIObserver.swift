//
//  UIObserver.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 17/06/2021.
//

import Combine

class ObserverUI: ObservableObject {
  var didChange = PassthroughSubject<Void, Never>()
  weak var delegateBasicEntity: BasicDelegateProtocol?


}
