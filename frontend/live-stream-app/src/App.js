import React, { useState, useEffect } from "react";
import "./App.css";
import DropDown from "./DropDown/DropDown";
import VideoPlayer from "./VideoPlayer/VideoPlayer";
import movies from "./VideoData/videoData";

function App() {
	const [selectedMovieKey, setSelectedMovieKey] = useState("");
	const [selectedMovieSource, setSelectedMovieSource] = useState("");

	useEffect(() => {
		const urlParams = new URLSearchParams(window.location.search);
		const initialMovieKey = urlParams.get("videokey");
		setSelectedMovieKey(initialMovieKey || "");

		if (selectedMovieKey !== "") {
			let selectedMovieObject = movies.filter((movie) => movie.key === selectedMovieKey).at(0);
			let url = "http://localhost:8080/video?videokey=" + selectedMovieObject.key;
			setSelectedMovieSource(url);
		}
	}, [selectedMovieKey]);

	const handleMovieChange = (newMovieKey) => {
		setSelectedMovieKey(newMovieKey);
		window.history.pushState({}, "", `?videokey=${newMovieKey}`); 
	};
	return (
		<div className="App">
			<DropDown onMovieChange={handleMovieChange}></DropDown>
			<VideoPlayer selectedMovieSource={selectedMovieSource}></VideoPlayer>
		</div>
	);
}

export default App;
