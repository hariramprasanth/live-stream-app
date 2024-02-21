import React from "react";
import "./VideoPlayer.css";

function VideoPlayer({ selectedMovieSource }) {
	return (
		<div className="video-container">
			<video src={selectedMovieSource} controls autoPlay type="video/mp4"></video>
		</div>
	);
}

export default VideoPlayer;
