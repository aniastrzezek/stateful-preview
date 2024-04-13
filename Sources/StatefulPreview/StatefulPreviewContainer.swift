import SwiftUI

struct StatefulPreviewContainer<Value, Content: View>: View {
    @State var value: Value

    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}

#Preview {
    @State var toggleIsOn: Bool = true

    return StatefulPreviewContainer(toggleIsOn) { isOn in
        VStack {
            Toggle(isOn: isOn) {
                Text("Toggle is on")
            }
            .background(Color.white)

            if isOn.wrappedValue {
                Text("The toggle is on!")
                    .transition(.move(edge: .top))
            }
        }
        .padding()
        .animation(.bouncy, value: isOn.wrappedValue)
    }
}
