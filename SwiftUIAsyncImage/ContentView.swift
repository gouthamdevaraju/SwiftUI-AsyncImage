//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Goutham Devaraju on 22/04/25.
//

import SwiftUI

extension Image {
    
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private let imageURL = "https://img.freepik.com/free-vector/medical-lab-blood-test-from-sample-tube-human-hand-person-holding-vial-near-list-with-results-flat-vector-illustration-report-medicine-concept-banner-website-design-landing-web-page_74855-26064.jpg?semt=ais_hybrid&w=740"
    
    var body: some View {
        
        // MARK: - 1 Basic
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2.  SCALE
//        AsyncImage(url: URL(string: imageURL), scale: 1.0)
        
        // MARK: - 3. Placeholder
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
        
        // MARK: - 4. Phase
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            
//            // SUCCESS: The image successfully loaded
//            // FAILURE: The image failed to load with an error
//            // EMPTY: No image is loaded
//            
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill")
//                    .iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill")
//                    .iconModifier()
//            }
//            
//        }
//        .padding(40)
        
        // MARK: - 5. Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            
            switch phase {
            case .success(let image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill")
                    .iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
        
    }
}

#Preview {
    ContentView()
}
