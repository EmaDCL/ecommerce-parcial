const globalAudio = document.getElementById("globalAudio");
const globalSource = document.getElementById("globalSource");


let isPlaying = false;
let isShuffle = false;
let isRepeat = false;
let currentIndex = 0;


const BASE_AUDIO = "../audio/";
const BASE_IMG = "../img/";


const songs = [
    {
        src: BASE_AUDIO + "hope_is_the_thing.mp3",
        title: "Hope Is The Thing",
        artist: "SKYNET FM",
        cover: BASE_IMG + "frame1.png"
    },
    {
        src: BASE_AUDIO + "breaking_the_habit.mp3",
        title: "Breaking The Habit",
        artist: "Linkin Park",
        cover: BASE_IMG + "frame2.png"
    },
    {
        src: BASE_AUDIO + "join_me_in_death.mp3",
        title: "Join Me In Death",
        artist: "HIM",
        cover: BASE_IMG + "frame3.png"
    },
    {
        src: BASE_AUDIO + "karma_police.mp3",
        title: "Karma Police",
        artist: "Radiohead",
        cover: BASE_IMG + "frame4.png"
    },
    {
        src: BASE_AUDIO + "numb.mp3",
        title: "Numb",
        artist: "Linkin Park",
        cover: BASE_IMG + "frame5.png"
    }
];


function togglePlay() {

    if (globalAudio.paused) {

        globalAudio.play()
            .then(() => {

                localStorage.setItem(
                    "skynet-playing",
                    "true"
                );

                setPlaying(true);

            })
            .catch(err => console.log(err));

    } else {

        globalAudio.pause();

        localStorage.setItem(
            "skynet-playing",
            "false"
        );

        setPlaying(false);
    }
}

/* ─────────────────────────────
   UI PLAYING
───────────────────────────── */
function setPlaying(state) {

    isPlaying = state;

    const playIcon =
        document.getElementById("playIcon");

    const pauseIcon =
        document.getElementById("pauseIcon");

    const spinRing =
        document.getElementById("spinRing");

    if (state) {

        playIcon.style.display = "none";
        pauseIcon.style.display = "block";

        if (spinRing) {
            spinRing.classList.add("playing");
        }

    } else {

        playIcon.style.display = "block";
        pauseIcon.style.display = "none";

        if (spinRing) {
            spinRing.classList.remove("playing");
        }
    }
}

/* ─────────────────────────────
   CAMBIAR CANCION
───────────────────────────── */
function changeSong(src, title, artist, index) {

    currentIndex = index;

    globalSource.src = src;

    globalAudio.load();

    globalAudio.play()
        .then(() => {

            setPlaying(true);

            localStorage.setItem(
                "skynet-playing",
                "true"
            );

        })
        .catch(err => console.log(err));

    /* INFO */
    document.getElementById("songTitle").textContent =
        title;

    document.getElementById("songArtist").textContent =
        artist;

    /* CARATULA */
    const song = songs[index];

    if (song) {

        document.getElementById("albumCover").src =
            song.cover;
    }

    /* PLAYLIST */
    document
        .querySelectorAll(".playlist-item")
        .forEach((item, i) => {

            item.classList.toggle(
                "active-song",
                i === index
            );

            const indicator =
                document.getElementById(
                    "indicator" + i
                );

            if (indicator) {

                indicator.textContent =
                    i === index ? "▶" : "";
            }
        });

    /* RESET PROGRESO */
    document.getElementById(
        "progressFill"
    ).style.width = "0%";

    document.getElementById(
        "currentTime"
    ).textContent = "0:00";

    /* GUARDAR */
    localStorage.setItem(
        "skynet-song",
        JSON.stringify({
            src: src,
            title: title,
            artist: artist,
            index: index
        })
    );
}

/* ─────────────────────────────
   SIGUIENTE
───────────────────────────── */
function nextSong() {

    let nextIndex;

    if (isShuffle) {

        nextIndex =
            Math.floor(
                Math.random() * songs.length
            );

    } else {

        nextIndex =
            (currentIndex + 1) % songs.length;
    }

    const nextSongObj =
        songs[nextIndex];

    changeSong(
        nextSongObj.src,
        nextSongObj.title,
        nextSongObj.artist,
        nextIndex
    );
}

/* ─────────────────────────────
   ANTERIOR
───────────────────────────── */
function prevSong() {

    if (globalAudio.currentTime > 3) {

        globalAudio.currentTime = 0;
        return;
    }

    const prevIndex =
        (currentIndex - 1 + songs.length)
        % songs.length;

    const prevSongObj =
        songs[prevIndex];

    changeSong(
        prevSongObj.src,
        prevSongObj.title,
        prevSongObj.artist,
        prevIndex
    );
}

/* ─────────────────────────────
   SHUFFLE
───────────────────────────── */
function toggleShuffle() {

    isShuffle = !isShuffle;

    document.getElementById(
        "shuffleBtn"
    ).style.color =
        isShuffle ? "#00f2ff" : "";
}

/* ─────────────────────────────
   REPEAT
───────────────────────────── */
function toggleRepeat() {

    isRepeat = !isRepeat;

    globalAudio.loop = isRepeat;

    document.getElementById(
        "repeatBtn"
    ).style.color =
        isRepeat ? "#00f2ff" : "";
}

/* ─────────────────────────────
   SEEK
───────────────────────────── */
function seekMusic(event) {

    const wrap =
        document.getElementById(
            "progressWrap"
        );

    const rect =
        wrap.getBoundingClientRect();

    const ratio =
        (event.clientX - rect.left)
        / rect.width;

    if (globalAudio.duration) {

        globalAudio.currentTime =
            ratio * globalAudio.duration;
    }
}

/* ─────────────────────────────
   FORMATO TIEMPO
───────────────────────────── */
function formatTime(sec) {

    if (isNaN(sec)) {
        return "0:00";
    }

    const minutes =
        Math.floor(sec / 60);

    const seconds =
        Math.floor(sec % 60)
            .toString()
            .padStart(2, "0");

    return `${minutes}:${seconds}`;
}

/* ─────────────────────────────
   BARRA PROGRESO
───────────────────────────── */
globalAudio.addEventListener(
    "timeupdate",
    () => {

        const current =
            globalAudio.currentTime;

        const duration =
            globalAudio.duration || 0;

        const percent =
            duration
                ? (current / duration) * 100
                : 0;

        document.getElementById(
            "progressFill"
        ).style.width =
            percent + "%";

        document.getElementById(
            "currentTime"
        ).textContent =
            formatTime(current);

        document.getElementById(
            "totalTime"
        ).textContent =
            formatTime(duration);

        localStorage.setItem(
            "skynet-progress",
            current
        );
    }
);


globalAudio.addEventListener(
    "ended",
    () => {

        if (!isRepeat) {
            nextSong();
        }
    }
);

/* ─────────────────────────────
   SINCRONIZAR ESTADO
───────────────────────────── */
globalAudio.addEventListener(
    "play",
    () => setPlaying(true)
);

globalAudio.addEventListener(
    "pause",
    () => setPlaying(false)
);

/* ─────────────────────────────
   CARGAR ESTADO
───────────────────────────── */
window.addEventListener(
    "DOMContentLoaded",
    () => {

        const savedSong =
            localStorage.getItem(
                "skynet-song"
            );

        if (savedSong) {

            try {

                const song =
                    JSON.parse(savedSong);

                globalSource.src =
                    song.src;

                globalAudio.load();

                document.getElementById(
                    "songTitle"
                ).textContent =
                    song.title;

                document.getElementById(
                    "songArtist"
                ).textContent =
                    song.artist;

                currentIndex =
                    song.index || 0;

                if (songs[currentIndex]) {

                    document.getElementById(
                        "albumCover"
                    ).src =
                        songs[currentIndex].cover;
                }

                document
                    .querySelectorAll(
                        ".playlist-item"
                    )
                    .forEach((item, i) => {

                        item.classList.toggle(
                            "active-song",
                            i === currentIndex
                        );

                        const indicator =
                            document.getElementById(
                                "indicator" + i
                            );

                        if (indicator) {

                            indicator.textContent =
                                i === currentIndex
                                    ? "▶"
                                    : "";
                        }
                    });

                const savedProgress =
                    localStorage.getItem(
                        "skynet-progress"
                    );

                globalAudio.addEventListener(
                    "loadedmetadata",
                    () => {

                        if (savedProgress) {

                            globalAudio.currentTime =
                                parseFloat(
                                    savedProgress
                                );
                        }

                        const wasPlaying =
                            localStorage.getItem(
                                "skynet-playing"
                            );

                        if (
                            wasPlaying === "true"
                        ) {

                            globalAudio.play()
                                .then(() => {

                                    setPlaying(
                                        true
                                    );

                                })
                                .catch(err =>
                                    console.log(err)
                                );

                        } else {

                            setPlaying(false);
                        }
                    },
                    { once: true }
                );

            } catch (e) {

                console.log(
                    "Error cargando estado:",
                    e
                );
            }

        } else {

            /* PRIMERA CARGA */
            changeSong(
                songs[0].src,
                songs[0].title,
                songs[0].artist,
                0
            );

            globalAudio.pause();

            setPlaying(false);
        }
    }
);