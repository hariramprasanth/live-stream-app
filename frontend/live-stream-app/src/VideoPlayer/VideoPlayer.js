import React from "react";
import "./VideoPlayer.css";

function VideoPlayer() {
	return (
		<div className="video-container">
			<video src={"small.mp4"} controls></video>
		</div>
	);
}

export default VideoPlayer;
