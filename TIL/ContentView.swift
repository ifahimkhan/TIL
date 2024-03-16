import SwiftUI

struct ThingStore {
  var things: [String] = []
}

struct ContentView: View {
  @State private var showAddThing = false
  let tempThings = ["YOLO", "BTW"]

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        ForEach(tempThings, id: \.self) { thing in
          Text(thing)
        }
        Spacer()
      }
      .navigationTitle("TIL")
      .toolbar {
        ToolbarItem {
          // swiftlint:disable:next multiple_closures_with_trailing_closure
          Button(action: { showAddThing.toggle() }) {
            Image(systemName: "plus.circle")
              .font(.title)
          }
        }
      }
      .sheet(isPresented: $showAddThing) {
        AddThingView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
