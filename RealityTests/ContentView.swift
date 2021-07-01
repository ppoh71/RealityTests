//
//  ContentView.swift
//  ArreaSwiftUI
//
//  Created by Peter Pohlmann on 15/06/2021.
//

import SwiftUI
import Combine
import RealityKit
import ARKit

struct ContentView : View {
  @EnvironmentObject var observer: ObserverUI

  var body: some View {
    ZStack(alignment: .bottom ){
      //ARViewContainer(observer)
      //TextFieldKeyboardTest()
      UIDummy()
    }
    .edgesIgnoringSafeArea(.all)
    .statusBar(hidden: true)
  }
}

struct UIDummy: View {
  @EnvironmentObject var observer: ObserverUI

  var body: some View {

    VStack{

      HStack{
        Button(action: {
          observer.delegateBasicEntity?.showFocus()
        }) {
          Text("Show")
        }

        Button(action: {
          observer.delegateBasicEntity?.hideFocus()
        }) {
          Text("Hide")
        }

        Button(action: {
          observer.delegateBasicEntity?.basicAction(type: .enableFocus)
        }) {
          Text("Enable")
        }

        Button(action: {
          observer.delegateBasicEntity?.basicAction(type: .disableFocus)
        }) {
          Text("Disable")
        }

        Button(action: {
          observer.delegateBasicEntity?.basicAction(type: .mockImport)
        }) {
          Text("obj3")
        }
      }

      ScrollView(Axis.Set.horizontal, showsIndicators: false) {
        HStack{
          ForEach((1...100), id:\.self) { index in
            Image("dummy")
              .resizable()
              .frame(width: 180, height: 180, alignment: .bottom)
          }
        }
      }
    }
  }
}


// MARK: RealityView

struct ARViewContainer: UIViewRepresentable {

  private var observer: ObserverUI

  public init(_ observer: ObserverUI) {
    self.observer = observer
  }

  func makeUIView(context: Context) -> RealityView {
    let arView = RealityView(frame: .zero, observer: observer)
    arView.setup()
    return arView
  }

  func updateUIView(_ view: RealityView, context: Context) {

  }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
