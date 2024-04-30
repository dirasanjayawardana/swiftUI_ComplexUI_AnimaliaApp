//
//  VideoPlayerView.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSlected: String
    var videoTitle: String
    
    var body: some View {
        Group {
            VideoPlayer(player: playVideo(fileName: videoSlected, fileFormat: "mp4")) {
            }
            .overlay(alignment:.topLeading) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top)
                    .padding(.horizontal, 8)
                
            }
        }
        .navigationTitle(videoTitle)
    }
}

#Preview {
    VideoPlayerView(videoSlected: "cheetah", videoTitle: "Cheetah")
}
