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

			setSelectedMovieSource(selectedMovieObject.source);
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
