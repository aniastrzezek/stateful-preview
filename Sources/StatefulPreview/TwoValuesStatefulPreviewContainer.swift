import SwiftUI

public struct TwoValuesStatefulPreviewContainer<FirstValue, SecondValue, Content: View>: View {
    @State private var value: FirstValue
    @State private var otherValue: SecondValue

    private var content: (Binding<FirstValue>, Binding<SecondValue>) -> Content

    init(first: FirstValue, second: SecondValue, content: @escaping (Binding<FirstValue>, Binding<SecondValue>) -> Content) {
        self._value = State(wrappedValue: first)
        self._otherValue = State(wrappedValue: second)
        self.content = content
    }

    public var body: some View {
        content($value, $otherValue)
    }
}

#Preview {
    @State var toggleIsOn: Bool = true
    @State var typedInNumber: Double = 124

    return TwoValuesStatefulPreviewContainer(first: toggleIsOn,
                                             second: typedInNumber) { isOn, number in
        VStack {
            VStack {
                Spacer()
                Toggle(isOn: isOn) {
                    Text("Toggle is on")
                }
            }
            .frame(height: 100)
            .background(Color.white)
            .zIndex(1000)

            if isOn.wrappedValue {
                Divider()

                HStack {
                    Text("Typed in number:")
                    Spacer()
                    TextField("Type the number in ", value: number, format: .number.locale(.current))
                        .multilineTextAlignment(.trailing)
                }
                .transition(.move(edge: .top))

                Text("The toggle is on and the number is \(number.wrappedValue)!")
                    .multilineTextAlignment(.center)
                    .transition(.move(edge: .top))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.99))
                            .shadow(color: .black.opacity(0.2), radius: 2, y: 1)
                    }
            }
        }
        .padding()
        .offset(y: -50)
        .animation(.bouncy, value: isOn.wrappedValue)
    }
}
