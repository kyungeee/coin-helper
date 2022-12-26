//
//  LoginView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/19.
//

import SwiftUI

// 회원가입, 로그인, 회원정보
// 회원가입 중복검사

// 로그인 뷰 구현
struct LoginView: View {
    
    @EnvironmentObject var userVM: UserVM
    
    @Environment(\.dismiss) var dismiss
    
    @State private var userEmail: String = ""
    @State private var userPW: String = ""
    
    @State fileprivate var shouldShowAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading){
                    Section(header: Text("이메일").font(.callout)) {
                        TextField("예) coper@coper.co.kr", text: $userEmail)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .textFieldStyle(.roundedBorder)
                    }
                    Section(header: Text("비밀번호").font(.callout)) {
                        SecureField("", text: $userPW)
                            .keyboardType(.default)
                            .textFieldStyle(.roundedBorder)
                    }
                }// email, pw vstack
                .padding(20)
                
                Button {
                    print("로그인 버튼 클릭")
                    userVM.login(email: userEmail, password: userPW)
                } label: {
                    Text("로그인")
                        .foregroundColor(.white)
                }
                .frame(width: 350, height: 50)
                .background(.black)
                .cornerRadius(40)
                .padding(.top, 40)
                .onReceive(userVM.loginSuccess, perform: {
                    print("LoginView - loginSuccess() called")
                    self.shouldShowAlert = true
                })
                .alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert){
                    Button("확인", role: .cancel){
                        self.dismiss()
                    }
                }
                
                HStack {
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("이메일 가입  ")
                            .foregroundColor(.black)
                    }
                    Text("|")
                        .foregroundColor(.gray)
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("이메일 찾기  ")
                            .foregroundColor(.black)
                    }
                    Text("|")
                        .foregroundColor(.gray)
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("비밀번호 찾기 ")
                            .foregroundColor(.black)
                    }
                } // hstack
                .font(.caption)
                .padding()
                
                VStack {
                    Image("login")
                        .padding(.top, 60)
                }
            }// email, pw vstack
        }// top vstack
    }
    
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
