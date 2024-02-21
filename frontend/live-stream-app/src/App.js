import React, { useState, useEffect } from "react";
import "./App.css";
import DropDown from "./DropDown/DropDown";
import VideoPlayer from "./VideoPlayer/VideoPlayer";
import movies from "./VideoData/videoData";

function App() {
	const [selectedMovieKey, setSelectedMovieKey] = useState("");
	const [selectedMovieSource, setSelectedMovieSource] = useState("");

	useEffect(() => {
		if (selectedMovieKey !== "") {
			let selectedMovieObject = movies.filter((movie) => movie.key === selectedMovieKey).at(0);
			let url = "http://localhost:8080/video?videokey=" + selectedMovieObject.key;
		    setSelectedMovieSource(url);
		}
	}, [selectedMovieKey]);

	return (
		<div className="App">
			<DropDown onMovieChange={setSelectedMovieKey}></DropDown>
			<VideoPlayer selectedMovieSource={selectedMovieSource}></VideoPlayer>
		</div>
	);
}

export default App;
