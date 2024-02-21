const express = require("express");
const fs = require("fs");
const path = require("path");
const morgan = require("morgan");
const app = express();
const port = 8080;
const movies = require("./movies.js")
const cors = require("cors");

const videosRootDirectory = process.env.VIDEOS_DIRECTORY || "../videos/";

app.use(morgan("dev"));
app.use(
	cors({
		origin: "*", 
	})
);

app.get("/video", (req, res) => {
	const videokey = req.query.videokey;

	if (!videokey) {
		return res.status(400).send("Missing video key  parameter");
	}

	let videoRelativePath = movies.filter((movie) => movie.key === videokey).at(0).source;

	const videoPath = path.join(videosRootDirectory, videoRelativePath);

    if (!fs.existsSync(videoPath)) {
		return res.status(404).send("Video not found at ${videoPath}");
	}

	const stat = fs.statSync(videoPath);
	const fileSize = stat.size;
	const range = req.headers.range;

	if (range) {
		const parts = range.replace(/bytes=/, "").split("-");
		const start = parseInt(parts[0], 10);
		const end = parts[1] ? parseInt(parts[1], 10) : fileSize - 1;
		const chunkSize = end - start + 1;

		const file = fs.createReadStream(videoPath, { start, end });
		const headers = {
			"Content-Range": `bytes ${start}-${end}/${fileSize}`,
			"Accept-Ranges": "bytes",
			"Content-Length": chunkSize,
			"Content-Type": "video/mp4",
		};

		res.writeHead(206, headers);
		file.pipe(res);
	} else {
		const headers = {
			"Content-Length": fileSize,
			"Content-Type": "video/mp4",
		};

		res.writeHead(200, headers);
		fs.createReadStream(videoPath).pipe(res);
	}
});

app.get("/movies-list", (req, res) => {
	const movieList = movies.map((movie) => ({ name: movie.name, key: movie.key }));
	res.json(movieList);
})
app.listen(port, () => {
	console.log(`Server is running`);
});
