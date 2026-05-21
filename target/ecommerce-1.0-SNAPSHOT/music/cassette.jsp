<!DOCTYPE html>
<html>
<head>
    <title>Skynet Music</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/cassette.css">
</head>
<body>

<!-- AUDIO GLOBAL -->
<audio id="globalAudio" loop hidden>
    <source id="globalSource"
            src="../audio/hope_is_the_thing.mp3"
            type="audio/mp3">
</audio>

<!-- BOTON VOLVER -->
<a href="../productos" class="back-btn">&#8592; Regresar</a>

<!-- LAYOUT PRINCIPAL -->
<div class="cassette-page">

    <!-- COLUMNA IZQUIERDA: IMAGENES -->
    <div class="gallery-col">
        <div class="frame-v"><img src="../img/frame1.png"></div>
        <div class="frame-v"><img src="../img/frame2.png"></div>
        <div class="frame-v"><img src="../img/frame3.png"></div>
        <div class="frame-v"><img src="../img/frame4.png"></div>
        <div class="frame-v"><img src="../img/frame5.png"></div>
    </div>

    <!-- COLUMNA CENTRO: PLAYER -->
    <div class="player-col">

        <!-- CARATULA -->
        <div class="album-cover-wrap">
            <img id="albumCover" src="../img/frame1.png" alt="Album cover">
            <div class="spin-ring" id="spinRing"></div>
        </div>

        <!-- INFO -->
        <div class="song-info">
            <div class="song-title" id="songTitle">Hope Is The Thing</div>
            <div class="song-artist" id="songArtist">SKYNET FM</div>
        </div>

        <!-- BARRA DE PROGRESO -->
        <div class="progress-section">
            <div class="progress-bar-wrap" id="progressWrap" onclick="seekMusic(event)">
                <div class="progress-bar-fill" id="progressFill"></div>
            </div>
            <div class="progress-times">
                <span id="currentTime">0:00</span>
                <span id="totalTime">0:00</span>
            </div>
        </div>

        <!-- CONTROLES -->
        <div class="music-controls">
            <button class="ctrl-btn small-btn" onclick="toggleShuffle()" id="shuffleBtn" title="Aleatorio">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="16 3 21 3 21 8"/><line x1="4" y1="20" x2="21" y2="3"/>
                    <polyline points="21 16 21 21 16 21"/><line x1="15" y1="15" x2="21" y2="21"/>
                </svg>
            </button>
            <button class="ctrl-btn side-btn" onclick="prevSong()" title="Anterior">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <polygon points="19 20 9 12 19 4 19 20"/>
                    <line x1="5" y1="19" x2="5" y2="5" stroke="currentColor" stroke-width="2" fill="none"/>
                </svg>
            </button>
            <button class="ctrl-btn main-btn" onclick="togglePlay()" id="playPauseBtn">
                <svg id="playIcon" viewBox="0 0 24 24" fill="currentColor">
                    <polygon points="5 3 19 12 5 21 5 3"/>
                </svg>
                <svg id="pauseIcon" viewBox="0 0 24 24" fill="currentColor" style="display:none;">
                    <rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/>
                </svg>
            </button>
            <button class="ctrl-btn side-btn" onclick="nextSong()" title="Siguiente">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <polygon points="5 4 15 12 5 20 5 4"/>
                    <line x1="19" y1="5" x2="19" y2="19" stroke="currentColor" stroke-width="2" fill="none"/>
                </svg>
            </button>
            <button class="ctrl-btn small-btn" onclick="toggleRepeat()" id="repeatBtn" title="Repetir">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="17 1 21 5 17 9"/><path d="M3 11V9a4 4 0 0 1 4-4h14"/>
                    <polyline points="7 23 3 19 7 15"/><path d="M21 13v2a4 4 0 0 1-4 4H3"/>
                </svg>
            </button>
        </div>

    </div>

    <!-- COLUMNA DERECHA: PLAYLIST -->
    <div class="playlist-col">
        <div class="playlist-header">SKYNET FM</div>
        <div class="playlist-sub">Cyberpunk Playlist</div>
        <div class="playlist-list">
            <div class="playlist-item active-song" onclick="changeSong('../audio/hope_is_the_thing.mp3', 'Hope Is The Thing', 'SKYNET FM', 0)">
                <div class="playlist-num">1</div>
                <div class="playlist-info">
                    <div class="playlist-name">Hope Is The Thing</div>
                    <div class="playlist-artist">SKYNET FM</div>
                </div>
                <div class="playlist-playing" id="indicator0">&#9654;</div>
            </div>
            <div class="playlist-item" onclick="changeSong('../audio/breaking_the_habit.mp3', 'Breaking The Habit', 'Linkin Park', 1)">
                <div class="playlist-num">2</div>
                <div class="playlist-info">
                    <div class="playlist-name">Breaking The Habit</div>
                    <div class="playlist-artist">Linkin Park</div>
                </div>
                <div class="playlist-playing" id="indicator1"></div>
            </div>
            <div class="playlist-item" onclick="changeSong('../audio/join_me_in_death.mp3', 'Join Me In Death', 'HIM', 2)">
                <div class="playlist-num">3</div>
                <div class="playlist-info">
                    <div class="playlist-name">Join Me In Death</div>
                    <div class="playlist-artist">HIM</div>
                </div>
                <div class="playlist-playing" id="indicator2"></div>
            </div>
            <div class="playlist-item" onclick="changeSong('../audio/karma_police.mp3', 'Karma Police', 'Radiohead', 3)">
                <div class="playlist-num">4</div>
                <div class="playlist-info">
                    <div class="playlist-name">Karma Police</div>
                    <div class="playlist-artist">Radiohead</div>
                </div>
                <div class="playlist-playing" id="indicator3"></div>
            </div>
            <div class="playlist-item" onclick="changeSong('../audio/numb.mp3', 'Numb', 'Linkin Park', 4)">
                <div class="playlist-num">5</div>
                <div class="playlist-info">
                    <div class="playlist-name">Numb</div>
                    <div class="playlist-artist">Linkin Park</div>
                </div>
                <div class="playlist-playing" id="indicator4"></div>
            </div>
        </div>
    </div>

</div>

<script src="../js/cassette.js"></script>
</body>
</html>