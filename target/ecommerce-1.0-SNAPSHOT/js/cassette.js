
const globalAudio = document.getElementById("globalAudio");
const globalSource = document.getElementById("globalSource");

/* ── ESTADO ── */
let isPlaying = false;
let isShuffle = false;
let isRepeat  = false;
let currentIndex = 0;

/* ── CANCIONES ── */
const songs = [
    {
        src:    '../audio/hope_is_the_thing.mp3',
        title:  'Hope Is The Thing',
        artist: 'SKYNET FM',
        cover:  '../img/frame1.png'
    },
    {
        src:    '../audio/breaking_the_habit.mp3',
        title:  'Breaking The Habit',
        artist: 'Linkin Park',
        cover:  '../img/frame2.png'
    },
    {
        src:    '../audio/join_me_in_death.mp3',
        title:  'Join Me In Death',
        artist: 'HIM',
        cover:  '../img/frame3.png'
    },
    {
        src:    '../audio/karma_police.mp3',
        title:  'Karma Police',
        artist: 'Radiohead',
        cover:  '../img/frame4.png'
    },
    {
        src:    '../audio/numb.mp3',
        title:  'Numb',
        artist: 'Linkin Park',
        cover:  '../img/frame5.png'
    }
];

/* ── PLAY / PAUSE ── */
function togglePlay() {

    if (isPlaying) {

        globalAudio.pause();

        localStorage.setItem(
            'skynet-playing',
            'false'
        );

        setPlaying(false);

    } else {

        globalAudio.play().catch(() => {});

        localStorage.setItem(
            'skynet-playing',
            'true'
        );

        setPlaying(true);
    }
}

function setPlaying(state) {

    isPlaying = state;

    const playIcon  = document.getElementById('playIcon');
    const pauseIcon = document.getElementById('pauseIcon');
    const spinRing  = document.getElementById('spinRing');

    if (state) {

        playIcon.style.display  = 'none';
        pauseIcon.style.display = 'block';

        spinRing.classList.add('playing');

    } else {

        playIcon.style.display  = 'block';
        pauseIcon.style.display = 'none';

        spinRing.classList.remove('playing');
    }
}

/* ── CAMBIAR CANCION ── */
function changeSong(src, title, artist, index) {

    currentIndex = index;

    globalSource.src = src;

    globalAudio.load();

    globalAudio.play().catch(() => {});

    setPlaying(true);

    localStorage.setItem(
        'skynet-playing',
        'true'
    );

    /* Actualizar info */
    document.getElementById('songTitle').textContent  = title;
    document.getElementById('songArtist').textContent = artist;

    /* Actualizar caratula */
    const song = songs[currentIndex];

    if (song && song.cover) {

        document.getElementById('albumCover').src =
        song.cover;
    }

    /* Playlist activa */
    document.querySelectorAll('.playlist-item')
    .forEach((item, i) => {

        item.classList.toggle(
            'active-song',
            i === index
        );

        const ind =
        document.getElementById('indicator' + i);

        if (ind) {

            ind.textContent =
            i === index ? '▶' : '';
        }
    });

    /* Reset barra */
    document.getElementById('progressFill').style.width =
    '0%';

    document.getElementById('currentTime').textContent =
    '0:00';

    /* Guardar cancion */
    localStorage.setItem('skynet-song', JSON.stringify({

        src:
        src.replace('../audio/', 'audio/'),

        title:  title,
        artist: artist
    }));
}

/* ── SIGUIENTE ── */
function nextSong() {

    let next = isShuffle
        ? Math.floor(Math.random() * songs.length)
        : (currentIndex + 1) % songs.length;

    const s = songs[next];

    changeSong(
        s.src,
        s.title,
        s.artist,
        next
    );
}

/* ── ANTERIOR ── */
function prevSong() {

    if (globalAudio.currentTime > 3) {

        globalAudio.currentTime = 0;
        return;
    }

    let prev =
    (currentIndex - 1 + songs.length)
    % songs.length;

    const s = songs[prev];

    changeSong(
        s.src,
        s.title,
        s.artist,
        prev
    );
}

/* ── SHUFFLE ── */
function toggleShuffle() {

    isShuffle = !isShuffle;

    document.getElementById('shuffleBtn')
    .style.color =
    isShuffle ? 'var(--cyan)' : '';
}

/* ── REPEAT ── */
function toggleRepeat() {

    isRepeat = !isRepeat;

    globalAudio.loop = isRepeat;

    document.getElementById('repeatBtn')
    .style.color =
    isRepeat ? 'var(--cyan)' : '';
}

/* ── SEEK ── */
function seekMusic(event) {

    const wrap =
    document.getElementById('progressWrap');

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

/* ── FORMATO TIEMPO ── */
function formatTime(sec) {

    if (isNaN(sec)) return '0:00';

    const m =
    Math.floor(sec / 60);

    const s =
    Math.floor(sec % 60)
    .toString()
    .padStart(2, '0');

    return `${m}:${s}`;
}

/* ── ACTUALIZAR BARRA ── */
globalAudio.addEventListener('timeupdate', () => {

    const cur =
    globalAudio.currentTime;

    const dur =
    globalAudio.duration || 0;

    const pct =
    dur ? (cur / dur) * 100 : 0;

    document.getElementById('progressFill')
    .style.width = pct + '%';

    document.getElementById('currentTime')
    .textContent = formatTime(cur);

    document.getElementById('totalTime')
    .textContent = formatTime(dur);

    localStorage.setItem(
        'skynet-progress',
        cur
    );
});

/* ── AUTO SIGUIENTE ── */
globalAudio.addEventListener('ended', () => {

    if (!isRepeat) {

        nextSong();
    }
});

/* ── SINCRONIZAR ── */
globalAudio.addEventListener(
    'play',
    () => setPlaying(true)
);

globalAudio.addEventListener(
    'pause',
    () => setPlaying(false)
);

/* ── CARGAR ESTADO ── */
window.addEventListener('DOMContentLoaded', () => {

    const savedSong =
    localStorage.getItem('skynet-song');

    if(savedSong){

        try{

            const song =
            JSON.parse(savedSong);

            globalSource.src =
            '../' + song.src;

            globalAudio.load();

            document.getElementById('songTitle')
            .textContent =
            song.title;

            document.getElementById('songArtist')
            .textContent =
            song.artist;

            const index =
            songs.findIndex(s =>
                s.title === song.title
            );

            if(index !== -1){

                currentIndex = index;

                document.getElementById('albumCover')
                .src =
                songs[index].cover;

                document.querySelectorAll('.playlist-item')
                .forEach((item, i) => {

                    item.classList.toggle(
                        'active-song',
                        i === index
                    );

                    const ind =
                    document.getElementById(
                        'indicator' + i
                    );

                    if(ind){

                        ind.textContent =
                        i === index ? '▶' : '';
                    }
                });
            }

            const savedProgress =
            localStorage.getItem(
                'skynet-progress'
            );

            globalAudio.addEventListener(
                'canplay',
                () => {

                    if(savedProgress){

                        globalAudio.currentTime =
                        parseFloat(savedProgress);
                    }

                    const wasPlaying =
                    localStorage.getItem(
                        'skynet-playing'
                    );

                    if(wasPlaying === 'true'){

                        globalAudio.play()
                        .catch(() => {});

                        setPlaying(true);

                    }else{

                        setPlaying(false);
                    }

                },
                { once:true }
            );

        }catch(e){}
    }
});
