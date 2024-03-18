import SwiftUI

struct AddThingView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var someThings: ThingStore
    @State private var thing = ""
    @FocusState private var thingIsFocused: Bool

    var body: some View {
        VStack {
            TextField("Things I Learned",text: $thing)
                .focused($thingIsFocused).textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
            Button("Done") {
                if !thing.isEmpty{
                    someThings.things.append(thing)
                }
                dismiss()
            }
            Spacer()
        }.environment(\.textCase, nil).onAppear{
            thingIsFocused = true
        }
    }
}

struct AddThingView_Previews: PreviewProvider {
    static var previews: some View {
        AddThingView(someThings:ThingStore())
    }
}
