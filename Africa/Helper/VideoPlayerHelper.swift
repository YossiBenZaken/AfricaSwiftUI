//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Yosef Ben Zaken on 28/09/2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: "Video/\(fileName)", withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "Video/\(fileName)", withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
