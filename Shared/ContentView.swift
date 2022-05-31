//
//  ContentView.swift
//  Shared
//
//  Created by Jesús Francisco Leyva Juárez on 30/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let saveEmail = UserDefaults.standard.string(forKey: "userEmail") ?? ""
        Text(saveEmail)
            .onAppear() {
                let userEmail = "Leyva527@gmail.com"
                UserDefaults.standard.set(userEmail, forKey: "userEmail")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        pantalla2()
    }
}
struct pantalla2: View {
    @State private var nombre = ""
    @State private var edad: Int?
    @State private var loggin = false
    @State private var saveName = ""
    @State private var saveEdad = 0
    @State private var saveLoggin = false
    var body: some View {
        VStack {
            TextField("Nombre", text: $nombre)
            TextField("Edad", value: $edad, format: .number)
            Button("Guardar") {
                self.loggin.toggle()
                saveData()
                obtenerData()
            }
            Text(saveName)
            Text("\(saveEdad)")
            Text("\(saveLoggin.description)")
        }
        .onAppear() {
            obtenerData()
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        
    }
    func saveData() {
        UserDefaults.standard.set(nombre, forKey: "nombre")
        UserDefaults.standard.set(edad, forKey: "edad")
        UserDefaults.standard.set(loggin, forKey: "loggin")
    }
     func obtenerData() {
         self.saveName = UserDefaults.standard.string(forKey: "nombre") ?? ""
        self.saveEdad = UserDefaults.standard.integer(forKey: "edad")
         self.saveLoggin = UserDefaults.standard.bool(forKey: "loggin")
    }
}
