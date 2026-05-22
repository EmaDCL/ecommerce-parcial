<!DOCTYPE html>
<html lang="es">

<head>

    <title>Skynet Music</title>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700;900&family=Space+Mono:wght@400;700&display=swap"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/cassette.css">

</head>

<body>

<!-- AUDIO -->
<audio id="globalAudio" loop hidden>

    <source id="globalSource"
            src="${pageContext.request.contextPath}/audio/hope_is_the_thing.mp3"
            type="audio/mp3">

</audio>

<!-- BOTON REGRESAR -->
<a href="${pageContext.request.contextPath}/index.jsp"
   class="back-btn">

    ? Regresar

</a>

<!-- CONTENIDO -->
<div class="cassette-page">

    <!-- GALERIA -->
    <div class="gallery-col">

        <div class="frame-v">
            <img src="${pageContext.request.contextPath}/img/frame1.png">
        </div>

        <div class="frame-v">
            <img src="${pageContext.request.contextPath}/img/frame2.png">
        </div>

        <div class="frame-v">
            <img src="${pageContext.request.contextPath}/img/frame3.png">
        </div>

        <div class="frame-v">
            <img src="${pageContext.request.contextPath}/img/frame4.png">
        </div>

        <div class="frame-v">
            <img src="${pageContext.request.contextPath}/img/frame5.png">
        </div>

    </div>

    <!-- PLAYER -->
    <div class="player-col">

        <div class="album-cover-wrap">

            <img id="albumCover"
                 src="${pageContext.request.contextPath}/img/frame1.png"
                 alt="Album">

            <div class="spin-ring"
                 id="spinRing"></div>

        </div>

        <!-- INFO -->
        <div class="song-info">

            <div class="song-title"
                 id="songTitle">

                Hope Is The Thing

            </div>

            <div class="song-artist"
                 id="songArtist">

                SKYNET FM

            </div>

        </div>

        <!-- PROGRESO -->
        <div class="progress-section">

            <div class="progress-bar-wrap"
                 id="progressWrap"
                 onclick="seekMusic(event)">

                <div class="progress-bar-fill"
                     id="progressFill"></div>

            </div>

            <div class="progress-times">

                <span id="currentTime">0:00</span>

                <span id="totalTime">0:00</span>

            </div>

        </div>

        <!-- CONTROLES -->
        <div class="music-controls">

            <button class="ctrl-btn small-btn"
                    onclick="toggleShuffle()"
                    id="shuffleBtn">

                ?

            </button>

            <button class="ctrl-btn side-btn"
                    onclick="prevSong()">

                ?

            </button>

            <button class="ctrl-btn main-btn"
                    onclick="togglePlay()"
                    id="playPauseBtn">

                <span id="playIcon">?</span>

                <span id="pauseIcon"
                      style="display:none;">

                    ?

                </span>

            </button>

            <button class="ctrl-btn side-btn"
                    onclick="nextSong()">

                ?

            </button>

            <button class="ctrl-btn small-btn"
                    onclick="toggleRepeat()"
                    id="repeatBtn">

                ?

            </button>

        </div>

    </div>

    <!-- PLAYLIST -->
    <div class="playlist-col">

        <div class="playlist-header">
            SKYNET FM
        </div>

        <div class="playlist-sub">
            Cyberpunk Playlist
        </div>

        <div class="playlist-list">

            <div class="playlist-item active-song"
                 onclick="changeSong(
                 '${pageContext.request.contextPath}/audio/hope_is_the_thing.mp3',
                 'Hope Is The Thing',
                 'SKYNET FM',
                 0)">

                Hope Is The Thing

            </div>

            <div class="playlist-item"
                 onclick="changeSong(
                 '${pageContext.request.contextPath}/audio/breaking_the_habit.mp3',
                 'Breaking The Habit',
                 'Linkin Park',
                 1)">

                Breaking The Habit

            </div>

            <div class="playlist-item"
                 onclick="changeSong(
                 '${pageContext.request.contextPath}/audio/join_me_in_death.mp3',
                 'Join Me In Death',
                 'HIM',
                 2)">

                Join Me In Death

            </div>

            <div class="playlist-item"
                 onclick="changeSong(
                 '${pageContext.request.contextPath}/audio/karma_police.mp3',
                 'Karma Police',
                 'Radiohead',
                 3)">

                Karma Police

            </div>

            <div class="playlist-item"
                 onclick="changeSong(
                 '${pageContext.request.contextPath}/audio/numb.mp3',
                 'Numb',
                 'Linkin Park',
                 4)">

                Numb

            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/js/cassette.js"></script>

</body>
</html>