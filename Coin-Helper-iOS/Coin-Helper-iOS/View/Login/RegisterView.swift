//
//  RegisterView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/22.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userVM: UserVM
    
    @Environment(\.dismiss) var dismiss
    
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userPW: String = ""
    
    @State fileprivate var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7){
            
            Section(header: Text("이름").font(.callout)){
                TextField("", text: $userName)
                    .keyboardType(.default)
                    .textFieldStyle(.roundedBorder)
            }
            Section(header: Text("이메일").font(.callout)) {
                HStack {
                    TextField("예) coper@coper.co.kr", text: $userEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        // 이메일 중복 체크
                        userVM.emailCheck(email: userEmail)
                    } label: {
                        Text("이메일 체크")
                    }

                }
            }
            Section(header: Text("비밀번호").font(.callout)) {
                SecureField("", text: $userPW)
                    .keyboardType(.default)
                    .textFieldStyle(.roundedBorder)
                SecureField("비밀번호 확인", text: $userPW)
                    .keyboardType(.default)
                    .textFieldStyle(.roundedBorder)
            }
            
            Section {
                Button {
                    print("회원가입 버튼 클릭!")
                    userVM.register(name: userName, email: userEmail, password: userPW)
                } label: {
                    Text("회원가입 하기")
                }
            }
            .onReceive(userVM.registrationSuccess, perform: {
                print("RegisterView - registrationSuccess() called")
                self.shouldShowAlert = true
            })
            .alert("회원가입이 완료되었습니다.", isPresented: $shouldShowAlert){
                Button("확인", role: .cancel){
                    self.dismiss()
                }
            }
        }// vstack
        .navigationTitle("회원가입")
        .padding(40)
    }// body
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView().environmentObject(UserVM())
//    }
//}
