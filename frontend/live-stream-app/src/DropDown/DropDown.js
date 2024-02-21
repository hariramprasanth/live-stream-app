import React, { useState } from "react";
import "./DropDown.css";
import movies from "../VideoData/videoData";

function DropDown({onMovieChange }) {
	const [selectedMovie, setSelectedMovie] = useState("");

	function onMovieClick(e) {
        setSelectedMovie(e.target.value);
        onMovieChange(e.target.value);
	}

	function showMovies(movie) {
		return (
			<option key={movie.key} value={movie.key}>
				{movie.name}
			</option>
		);
	}

	return (
		<div className="dropdown-container">
			<select className="drop-down" value={selectedMovie} onChange={onMovieClick}>
				{!selectedMovie && <option value="">Select a movie</option>}
				{movies.map(showMovies)}
			</select>
		</div>
	);
}

export default DropDown;
