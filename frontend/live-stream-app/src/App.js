import "./App.css";
import DropDown from "./DropDown/DropDown";
import VideoPlayer from "./VideoPlayer/VideoPlayer";
function App() {
	let movies = [
		{
			name: "Dark knight",
			key: "dark-knight",
		},
		{
			name: "The Spider Man",
			key: "spider-man",
		},
		{
			name: "Iron Man",
			key: "iron-man",
		},
	];
	function onMovieChange(selectedMovie) {
		let selectedMovieObject = movies.filter((movie) => movie.key === selectedMovie).at(0);
		console.log(selectedMovieObject);
	}
	return (
		<div className="App">
			<DropDown movies={movies} onMovieChange={onMovieChange}></DropDown>
			<VideoPlayer></VideoPlayer>
		</div>
	);
}

export default App;
