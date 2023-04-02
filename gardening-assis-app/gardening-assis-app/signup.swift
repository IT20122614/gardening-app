//
//  signup.swift
//  gardening-assis-app
//
//  Created by kavindu madushan on 2023-04-02.
//

import SwiftUI

struct signup: View {
    var title: String
    var body: some View {
        Text("Hello, World!\(title)")
    }
    init(title: String){
        self.title = title
    }
}

struct signup_Previews: PreviewProvider {
    static var previews: some View {
        signup(title: "string")
    }
}
