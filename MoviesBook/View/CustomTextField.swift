import SwiftUI

struct CustomTextField: View {
    var iconTint: Color = .gray
    var hint: String
    var isPassword: Bool = false
    
    @Binding var value: String
    
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .leading) {
                    if value.isEmpty {
                        Text(hint)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16) // Adjusted padding
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    if isPassword {
                        Group {
                            if showPassword {
                                TextField("", text: $value)
                                    .foregroundColor(.white)
                                    .accentColor(.white)
                                    .padding(15) // Adjusted padding
                                    .background(Color.black.opacity(0.4))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white, lineWidth: 0.5)
                                    )
                                    .padding(.horizontal,10)
                                    .font(.system(size: 16, weight: .regular))

                            } else {
                                SecureField("", text: $value)
                                    .foregroundColor(.white)
                                    .accentColor(.white)
                                    .padding(15) // Adjusted padding
                                    .background(Color.black.opacity(0.4))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                    )
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(.horizontal,10)
                            }
                            
                        }
                        
                    } else {
                        TextField("", text: $value)
                            .foregroundColor(.white)
                            .accentColor(.white)
                            .padding(15) // Adjusted padding
                            .background(Color.black.opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 0.5)
                            )
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal,10)

                    }
                }
                .frame(maxWidth: .infinity) // Ensure the text field fills available width
            }
            .overlay(alignment: .trailing) {
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(10)
                            .contentShape(Rectangle())
                    }
                    .padding(.horizontal)
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    SignInView()
}

