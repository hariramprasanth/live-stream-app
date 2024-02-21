import React, { useState, useEffect } from "react";
import { getMoviesList } from "../api/getMoviesList";
import "./DropDown.css";

function DropDown({ onMovieChange }) {
	const [selectedMovie, setSelectedMovie] = useState("");
	const [movies, setMovies] = useState([]);

	useEffect(() => {
		const urlParams = new URLSearchParams(window.location.search);
		const initialMovieKey = urlParams.get("videokey");
		setSelectedMovie(initialMovieKey || "");
		async function fetchData() {
			try {
				let response = await getMoviesList();
				setMovies(response.data);
			} catch (error) {
				console.error(error);
			}
		}
		fetchData();
	}, []);

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
