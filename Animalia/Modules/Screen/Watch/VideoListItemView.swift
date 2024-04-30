//
//  VideoListItem.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import SwiftUI

struct VideoListItemView: View {
    let video: VideoModel
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 36)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .lineLimit(2, reservesSpace: true)
            }
            
        }
    }
}

#Preview {
    let videos: [VideoModel] = Bundle.main.decode("videos.json")
    return VideoListItemView(video: videos[1])
}
