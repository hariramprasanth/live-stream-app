let baseUrl = process.env.REACT_APP_BACKEND_URL || "http://localhost:8080";

const apiurls = {
    moviesList: `${baseUrl}/movies-list`,
    movie: `${baseUrl}/video`
}

export default apiurls;