<!DOCTYPE html>
<html lang="es">

<head>

    <title>Tienda Skynet</title>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        :root {
            --cyan: #00f2ff;
            --purple: #8b5cf6;
            --bg: #0d0d1a;
            --bg2: #13131f;
            --bg3: #1a1a2e;
            --muted: #6b7280;
            --soft: #9ca3af;
            --border: rgba(255,255,255,0.07);
            --sidebar-w: 200px;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            background: var(--bg);
            color: white;
            font-family: 'Inter', sans-serif;
            height: 100vh;
            overflow: hidden;
            display: flex;
        }

        .sidebar {
            width: var(--sidebar-w);
            height: 100vh;
            background: var(--bg2);
            border-right: 1px solid var(--border);
            display: flex;
            flex-direction: column;
            padding: 28px 20px;
            flex-shrink: 0;
        }

        .sidebar-dots {
            display: flex;
            gap: 6px;
            margin-bottom: 28px;
        }

        .sidebar-dots span {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: rgba(255,255,255,0.15);
        }

        .sidebar-avatar {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 28px;
        }

        .avatar-circle {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--cyan), var(--purple));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
            font-weight: 700;
            color: #0d0d1a;
        }

        .avatar-name {
            font-size: 14px;
            font-weight: 600;
        }

        .avatar-badge {
            font-size: 9px;
            background: var(--cyan);
            color: #0d0d1a;
            padding: 1px 6px;
            border-radius: 4px;
            font-weight: 700;
        }

        .nav-group {
            margin-bottom: 22px;
        }

        .nav-group-label {
            font-size: 10px;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 8px;
            padding-left: 4px;
        }

        .nav-link-s {
            display: block;
            color: var(--soft);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            padding: 7px 8px;
            border-radius: 8px;
            transition: 0.2s;
            margin-bottom: 2px;
        }

        .nav-link-s:hover {
            color: white;
            background: rgba(255,255,255,0.05);
        }

        .sidebar-bottom {
            margin-top: auto;
        }

        .skynet-fm-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(0,242,255,0.07);
            border: 1px solid rgba(0,242,255,0.15);
            border-radius: 10px;
            padding: 10px 12px;
            color: var(--cyan);
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .main-content {
            flex: 1;
            height: 100vh;
            overflow-y: auto;
            overflow-x: hidden;
            background: var(--bg);
            padding-bottom: 80px;
        }

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 28px;
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            background: rgba(13,13,26,0.92);
            backdrop-filter: blur(12px);
            z-index: 10;
        }

        .search-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            background: rgba(255,255,255,0.05);
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 8px 16px;
            width: 240px;
            color: var(--muted);
            font-size: 13px;
            text-decoration: none;
        }

        .topbar-right {
            display: flex;
            gap: 10px;
        }

        .icon-btn {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            background: rgba(255,255,255,0.05);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--soft);
            text-decoration: none;
        }

        .hero-section {
            padding: 28px 28px 0;
        }

        .hero-featured {
            background: linear-gradient(135deg, #160d2a 0%, #0a1628 50%, #0d1e30 100%);
            border-radius: 16px;
            padding: 36px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .hero-title-main {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 6px;
        }

        .hero-subtitle {
            font-size: 15px;
            color: var(--soft);
            margin-bottom: 10px;
        }

        .hero-quote-small {
            font-size: 12px;
            color: var(--muted);
            font-style: italic;
            margin-bottom: 22px;
        }

        .btn-play {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: white;
            color: #0d0d1a;
            font-weight: 700;
            font-size: 13px;
            padding: 9px 20px;
            border-radius: 50px;
            text-decoration: none;
        }

        .hero-img {
            width: 150px;
            height: 150px;
            border-radius: 12px;
            object-fit: cover;
        }

        .cards-section {
            padding: 24px 28px 0;
        }

        .section-title-s {
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 14px;
        }

        .product-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
        }

        .product-card {
            background: var(--bg2);
            border-radius: 12px;
            overflow: hidden;
            text-decoration: none;
            border: 1px solid var(--border);
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-4px);
        }

        .product-card-img-placeholder {
            width: 100%;
            aspect-ratio: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            background: var(--bg3);
        }

        .product-card-info {
            padding: 10px 12px;
        }

        .product-card-name {
            font-size: 13px;
            font-weight: 600;
            color: white;
        }

        .product-card-cat {
            font-size: 11px;
            color: var(--muted);
        }

        .about-strip {
            margin: 24px 28px 0;
            background: var(--bg2);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 24px 28px;
            display: flex;
            gap: 20px;
        }

        .about-avatar-big {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--cyan), var(--purple));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 800;
            color: #0d0d1a;
        }

        .about-name-s {
            font-size: 17px;
            font-weight: 700;
        }

        .about-role-s {
            font-size: 12px;
            color: var(--muted);
            margin-bottom: 10px;
        }

        .mini-player {
            position: fixed;
            bottom: 0;
            left: var(--sidebar-w);
            right: 0;
            height: 62px;
            background: rgba(13,13,26,0.97);
            border-top: 1px solid var(--border);
            display: flex;
            align-items: center;
            padding: 0 24px;
            justify-content: space-between;
            z-index: 50;
        }

        .mini-song-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .mini-thumb {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: rgba(0,242,255,0.08);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .mini-controls {
            display: flex;
            align-items: center;
        }

        .mini-play-btn {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: white;
            border: none;
            cursor: pointer;
        }

        .mini-go-btn {
            font-size: 12px;
            color: var(--cyan);
            text-decoration: none;
            border: 1px solid rgba(0,242,255,0.2);
            border-radius: 8px;
            padding: 5px 12px;
        }

        #music-toast {
            position: fixed;
            bottom: 76px;
            left: calc(var(--sidebar-w) + 20px);
            z-index: 999;
            background: rgba(19,19,31,0.97);
            border-radius: 14px;
            padding: 12px 14px;
            display: none;
            align-items: center;
            gap: 12px;
        }

        .toast-btns-s {
            display: flex;
            gap: 6px;
        }

        .tbtn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: none;
            cursor: pointer;
        }

        @media (max-width: 860px) {

            body {
                flex-direction: column;
                overflow: auto;
                height: auto;
            }

            .sidebar {
                display: none;
            }

            .mini-player {
                left: 0;
            }

            .product-cards {
                grid-template-columns: repeat(2, 1fr);
            }

        }

    </style>

</head>

<body>

<audio id="globalAudio" loop hidden>
    <source id="globalSource" src="${pageContext.request.contextPath}/audio/hope_is_the_thing.mp3" type="audio/mp3">
</audio>

<!-- SIDEBAR -->
<aside class="sidebar">

    <div class="sidebar-dots">
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="sidebar-avatar">

        <div class="avatar-circle">Z</div>

        <div>
            <div class="avatar-name">Zack</div>
            <span class="avatar-badge">DEV</span>
        </div>

    </div>

    <div class="nav-group">

        <div class="nav-group-label">Menu</div>

        <a href="#inicio" class="nav-link-s active">Inicio</a>

        <a href="#sobre-mi" class="nav-link-s">Sobre mi</a>

        <a href="#categorias" class="nav-link-s">Categorias</a>

    </div>

    <div class="nav-group">

        <div class="nav-group-label">Tienda</div>

        <a href="${pageContext.request.contextPath}/productos.jsp" class="nav-link-s">
            Explorar
        </a>

        <a href="${pageContext.request.contextPath}/productos.jsp?categoria=tecnologia" class="nav-link-s">
            Tecnologia
        </a>

        <a href="${pageContext.request.contextPath}/productos.jsp?categoria=electrodomestico" class="nav-link-s">
            Electrodomesticos
        </a>

    </div>

    <div class="sidebar-bottom">

        <a href="${pageContext.request.contextPath}/music/cassette.jsp" class="skynet-fm-btn">

            SKYNET FM

        </a>

    </div>

</aside>

<!-- MAIN -->
<div class="main-content">

    <!-- TOPBAR -->
    <div class="topbar">

        <a href="${pageContext.request.contextPath}/productos.jsp" class="search-bar">
            Buscar productos...
        </a>

        <div class="topbar-right">

            <a href="${pageContext.request.contextPath}/music/cassette.jsp" class="icon-btn">
                ?
            </a>

            <a href="${pageContext.request.contextPath}/productos.jsp" class="icon-btn">
                ?
            </a>

        </div>

    </div>

    <!-- HERO -->
    <div class="hero-section" id="inicio">

        <div class="hero-featured">

            <div>

                <div class="hero-title-main">
                    Tienda Skynet
                </div>

                <div class="hero-subtitle">
                    productos a buen precio
                </div>

                <div class="hero-quote-small">
                    "Que las estrellas nos iluminen aunque hayan muerto hace millones de años"
                </div>

                <a href="${pageContext.request.contextPath}/productos.jsp" class="btn-play">
                    Explorar tienda
                </a>

            </div>

            <img
                src="https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=600&auto=format&fit=crop"
                class="hero-img"
                alt="Tech">

        </div>

    </div>

    <!-- CATEGORIAS -->
    <div class="cards-section" id="categorias">

        <div class="section-title-s">
            Categorias destacadas
        </div>

        <div class="product-cards">

            <a href="${pageContext.request.contextPath}/productos.jsp?categoria=tecnologia" class="product-card">

                <div class="product-card-img-placeholder">
                    ?
                </div>

                <div class="product-card-info">

                    <div class="product-card-name">
                        Tecnologia
                    </div>

                    <div class="product-card-cat">
                        Celulares, laptops y mas
                    </div>

                </div>

            </a>

            <a href="${pageContext.request.contextPath}/productos.jsp?categoria=electrodomestico" class="product-card">

                <div class="product-card-img-placeholder">
                    ?
                </div>

                <div class="product-card-info">

                    <div class="product-card-name">
                        Electrodomesticos
                    </div>

                    <div class="product-card-cat">
                        Para el hogar
                    </div>

                </div>

            </a>

            <a href="${pageContext.request.contextPath}/productos.jsp" class="product-card">

                <div class="product-card-img-placeholder">
                    ?
                </div>

                <div class="product-card-info">

                    <div class="product-card-name">
                        Novedades
                    </div>

                    <div class="product-card-cat">
                        Lo mas reciente
                    </div>

                </div>

            </a>

            <a href="${pageContext.request.contextPath}/music/cassette.jsp" class="product-card">

                <div class="product-card-img-placeholder">
                    ?
                </div>

                <div class="product-card-info">

                    <div class="product-card-name">
                        Skynet FM
                    </div>

                    <div class="product-card-cat">
                        Musica de fondo
                    </div>

                </div>

            </a>

        </div>

    </div>

    <!-- SOBRE MI -->
    <div class="cards-section" id="sobre-mi" style="padding-bottom:28px;">

        <div class="section-title-s">
            El creador
        </div>

        <div class="about-strip">

            <div class="about-avatar-big">
                Z
            </div>

            <div>

                <div class="about-name-s">
                    Zack
                </div>

                <div class="about-role-s">
                    Estudiante de Ingenieria de Sistemas
                </div>

                <div class="hero-quote-small">
                    "Que las estrellas nos iluminen aunque hayan muerto hace millones de anos"
                </div>

            </div>

        </div>

    </div>

</div>

<!-- MINI PLAYER -->
<div class="mini-player">

    <div class="mini-song-info">

        <div class="mini-thumb">
            ?
        </div>

        <div>

            <div class="mini-title">
                Hope Is The Thing
            </div>

            <div class="mini-artist">
                SKYNET FM
            </div>

        </div>

    </div>

    <div class="mini-controls">

        <button class="mini-play-btn" onclick="miniToggle()">

            <span id="miniPlayIcon">?</span>

            <span id="miniPauseIcon" style="display:none;">?</span>

        </button>

    </div>

    <div class="mini-right">

        <a href="${pageContext.request.contextPath}/music/cassette.jsp" class="mini-go-btn">
            Abrir reproductor
        </a>

    </div>

</div>

<!-- TOAST -->
<div id="music-toast">

    <div>
        ?
    </div>

    <div>

        <div>
            Musica de fondo
        </div>

        <div id="toastSongName">
            Hope Is The Thing
        </div>

        <div id="toastArtistName">
            SKYNET FM
        </div>

    </div>

    <div class="toast-btns-s">

        <button class="tbtn" id="toastYes">
            ?
        </button>

        <button class="tbtn" id="toastNo">
            ?
        </button>

    </div>

</div>

<script>

const audioEl =
document.getElementById('globalAudio');

const sourceEl =
document.getElementById('globalSource');

window.addEventListener('DOMContentLoaded', () => {

    const savedSong =
    localStorage.getItem('skynet-song');

    if(savedSong){

        try{

            const song =
            JSON.parse(savedSong);

            sourceEl.src =
            song.src;

            audioEl.load();

            document.querySelector('.mini-title').textContent =
            song.title;

            document.querySelector('.mini-artist').textContent =
            song.artist;

            document.getElementById('toastSongName').textContent =
            song.title;

            document.getElementById('toastArtistName').textContent =
            song.artist;

        }catch(e){}

    }

    const savedProgress =
    localStorage.getItem('skynet-progress');

    audioEl.addEventListener('loadedmetadata', () => {

        if(savedProgress){

            audioEl.currentTime =
            parseFloat(savedProgress);

        }

    });

    const wasPlaying =
    localStorage.getItem('skynet-playing');

    if(wasPlaying === 'true'){

        audioEl.play().catch(() => {});

    }

});

audioEl.addEventListener('timeupdate', () => {

    localStorage.setItem(
        'skynet-progress',
        audioEl.currentTime
    );

});

function miniToggle(){

    if(audioEl.paused){

        audioEl.play().catch(() => {});

    }else{

        audioEl.pause();

    }

}

audioEl.addEventListener('play', () => {

    localStorage.setItem(
        'skynet-playing',
        'true'
    );

    document.getElementById('miniPlayIcon').style.display =
    'none';

    document.getElementById('miniPauseIcon').style.display =
    'inline';

});

audioEl.addEventListener('pause', () => {

    localStorage.setItem(
        'skynet-playing',
        'false'
    );

    document.getElementById('miniPlayIcon').style.display =
    'inline';

    document.getElementById('miniPauseIcon').style.display =
    'none';

});

const toast =
document.getElementById('music-toast');

if(!localStorage.getItem('skynet-music-choice')){

    setTimeout(() => {

        toast.style.display =
        'flex';

    }, 1500);

}

document.getElementById('toastYes')
.addEventListener('click', () => {

    audioEl.play().catch(() => {});

    localStorage.setItem(
        'skynet-music-choice',
        'yes'
    );

    toast.style.display =
    'none';

});

document.getElementById('toastNo')
.addEventListener('click', () => {

    localStorage.setItem(
        'skynet-music-choice',
        'no'
    );

    toast.style.display =
    'none';

});

</script>

</body>
</html>