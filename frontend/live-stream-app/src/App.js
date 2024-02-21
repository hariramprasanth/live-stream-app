import React, { useState, useEffect } from "react";
import "./App.css";
import DropDown from "./DropDown/DropDown";
import VideoPlayer from "./VideoPlayer/VideoPlayer";
import apiurls from "./endpoints";

function App() {
	const [selectedMovieSource, setSelectedMovieSource] = useState("");

	useEffect(() => {
		const urlParams = new URLSearchParams(window.location.search);
		const initialMovieKey = urlParams.get("videokey");
		changeSelectedMovieUrl(initialMovieKey || "");
	}, []);

	function changeSelectedMovieUrl(selectedMovieKey) {
		if (selectedMovieKey !== "") {
			let url = apiurls.movie + "?videokey=" + selectedMovieKey;
			setSelectedMovieSource(url);
		}
	}

	function handleMovieChange(movieKey) {
		window.history.pushState({}, "", `?videokey=${movieKey}`);
		changeSelectedMovieUrl(movieKey);
	}
	return (
		<div className="App">
			<DropDown onMovieChange={handleMovieChange}></DropDown>
			<VideoPlayer selectedMovieSource={selectedMovieSource}></VideoPlayer>
		</div>
	);
}

export default App;
