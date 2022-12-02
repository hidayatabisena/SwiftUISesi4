//
//  SettingsView.swift
//  SwiftUISesi4
//
//  Created by Hidayat Abisena on 02/12/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @AppStorage("switchColorScheme") var switchColorScheme: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // MARK: - SECTION INFO
                    sectionInfo
                    
                    // MARK: - COLOR SCHEME
                    colorScheme
                    
                    // MARK: - SECTION APP
                    appInfo
                    
                } //: VSTACK
                
            } //: SCROLL
            .preferredColorScheme(switchColorScheme ? .dark : .light)
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}

// MARK: - SECTION
struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - EXTENSION
extension SettingsView {
    private var sectionInfo: some View {
        GroupBox {
            Divider().padding(.vertical, 4)
            HStack(spacing: 10) {
                Image("logo-full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                
                Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                    .font(.system(size: 12))
            }
        } label: {
            SettingsLabelView(labelText: "SwiftUI sesi 5", labelImage: "info.circle")
        }
        .padding()
    }
    
    private var appInfo: some View {
        GroupBox {
            SettingsRow(name: "Developer", content: "Hidayat Abisena")
            
            SettingsRow(name: "Designer", content: "Wendy Reveluv")
            
            SettingsRow(name: "Compatibility", content: "iOS 16")
            
            SettingsRow(name: "Website", linkLabel: "iSwift Bootcamp", linkDestination: "iswiftbootcamp.com")
            
            SettingsRow(name: "Twitter", linkLabel: "@hidayatabisena", linkDestination: "twitter.com/hidayatabisena")
            
            SettingsRow(name: "SwiftUI", content: "4.0")
            
            SettingsRow(name: "Version", content: "1.1.0")
            
        } label: {
            SettingsLabelView(labelText: "Application", labelImage: "iphone")
        }
        .padding()
    }
    
    private var colorScheme: some View {
        GroupBox {
            Divider().padding(.vertical, 4)
            
            Text("If you wish you can toggle the theme color of the application by switch on/off in this box. That way you can see your apps switch from Light & Dark mode.")
                .padding(.vertical, 8)
                .frame(minHeight: 60)
                .layoutPriority(1)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
            Toggle(isOn: $switchColorScheme) {
                Text("Switch Mode Dark / Light".uppercased())
                    .font(.footnote)
            }
            
        } label: {
            SettingsLabelView(labelText: "Theme Customization", labelImage: "paintbrush")
        }
        .padding()
    }
}

// MARK: - SETTINGS ROW
struct SettingsRow: View {
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content ?? "N/A")
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                        .tint(.secondary)
                    
                    Image(systemName: "arrow.up.right.square").foregroundColor(.purple)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
