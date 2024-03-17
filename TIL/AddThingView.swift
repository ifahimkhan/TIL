import SwiftUI

struct AddThingView: View {
  @Environment(\.dismiss) var dismiss
    @Binding var someThings: ThingStore

  var body: some View {
    VStack {
      Button("Done") {
          someThings.things.append("FOMO")
        dismiss()
      }
      Spacer()
    }
  }
}

struct AddThingView_Previews: PreviewProvider {
  static var previews: some View {
      AddThingView(someThings: .constant(ThingStore()))
  }
}
