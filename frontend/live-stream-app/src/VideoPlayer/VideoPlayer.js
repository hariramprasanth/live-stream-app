import React from "react";
import "./VideoPlayer.css";

function VideoPlayer({ selectedMovieSource }) {
	return (
		<div className="video-container">
			<video src={selectedMovieSource} controls></video>
		</div>
	);
}

export default VideoPlayer;
