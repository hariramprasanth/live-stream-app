import axios from "axios";
import apiurls from "../endpoints";

async function getMoviesList() {
	const response = await axios.get(apiurls.moviesList);

	return response;
}

export { getMoviesList };
