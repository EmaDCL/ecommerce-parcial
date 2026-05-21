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

        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        html { scroll-behavior: smooth; }

        body {
            background: var(--bg);
            color: white;
            font-family: 'Inter', sans-serif;
            height: 100vh;
            overflow: hidden;
            display: flex;
        }

        /* SIDEBAR */
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

        .sidebar-dots { display: flex; gap: 6px; margin-bottom: 28px; }
        .sidebar-dots span { width: 10px; height: 10px; border-radius: 50%; background: rgba(255,255,255,0.15); }

        .sidebar-avatar { display: flex; align-items: center; gap: 10px; margin-bottom: 28px; }

        .avatar-circle {
            width: 38px; height: 38px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--cyan), var(--purple));
            display: flex; align-items: center; justify-content: center;
            font-size: 15px; font-weight: 700; color: #0d0d1a; flex-shrink: 0;
        }

        .avatar-info { line-height: 1.3; }
        .avatar-name { font-size: 14px; font-weight: 600; color: white; }
        .avatar-badge {
            font-size: 9px; background: var(--cyan); color: #0d0d1a;
            padding: 1px 6px; border-radius: 4px; font-weight: 700; letter-spacing: 0.5px;
        }

        .nav-group { margin-bottom: 22px; }

        .nav-group-label {
            font-size: 10px; color: var(--muted);
            text-transform: uppercase; letter-spacing: 1.5px;
            margin-bottom: 8px; padding-left: 4px;
        }

        .nav-link-s {
            display: block; color: var(--soft); text-decoration: none;
            font-size: 14px; font-weight: 500; padding: 7px 8px;
            border-radius: 8px; transition: 0.2s; margin-bottom: 2px;
        }

        .nav-link-s:hover { color: white; background: rgba(255,255,255,0.05); }
        .nav-link-s.active { color: white; font-weight: 600; }

        .sidebar-bottom { margin-top: auto; }

        .skynet-fm-btn {
            display: flex; align-items: center; gap: 8px;
            background: rgba(0,242,255,0.07);
            border: 1px solid rgba(0,242,255,0.15);
            border-radius: 10px; padding: 10px 12px;
            color: var(--cyan); text-decoration: none;
            font-size: 13px; font-weight: 600; transition: 0.2s;
        }

        .skynet-fm-btn:hover { background: rgba(0,242,255,0.12); color: white; }
        .skynet-fm-btn svg { width: 15px; height: 15px; }

        /* MAIN */
        .main-content {
            flex: 1; height: 100vh;
            overflow-y: auto; overflow-x: hidden;
            background: var(--bg); padding-bottom: 64px;
        }

        .main-content::-webkit-scrollbar { width: 4px; }
        .main-content::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.08); border-radius: 4px; }

        /* TOPBAR */
        .topbar {
            display: flex; align-items: center; justify-content: space-between;
            padding: 16px 28px; border-bottom: 1px solid var(--border);
            position: sticky; top: 0;
            background: rgba(13,13,26,0.92); backdrop-filter: blur(12px);
            z-index: 10;
        }

        .search-bar {
            display: flex; align-items: center; gap: 10px;
            background: rgba(255,255,255,0.05); border: 1px solid var(--border);
            border-radius: 10px; padding: 8px 16px; width: 240px;
            color: var(--muted); font-size: 13px; cursor: pointer;
            text-decoration: none; transition: 0.2s;
        }

        .search-bar:hover { border-color: rgba(0,242,255,0.2); color: var(--soft); }
        .search-bar svg { width: 15px; height: 15px; flex-shrink: 0; }

        .topbar-right { display: flex; align-items: center; gap: 10px; }

        .icon-btn {
            width: 34px; height: 34px; border-radius: 8px;
            background: rgba(255,255,255,0.05); border: 1px solid var(--border);
            display: flex; align-items: center; justify-content: center;
            cursor: pointer; transition: 0.2s; color: var(--soft); text-decoration: none;
        }

        .icon-btn:hover { background: rgba(255,255,255,0.1); color: white; }
        .icon-btn svg { width: 15px; height: 15px; }

        /* HERO */
        .hero-section { padding: 28px 28px 0; }

        .hero-featured {
            background: linear-gradient(135deg, #160d2a 0%, #0a1628 50%, #0d1e30 100%);
            border-radius: 16px; padding: 36px 40px;
            display: flex; align-items: center; justify-content: space-between;
            gap: 20px; position: relative; overflow: hidden; min-height: 200px;
        }

        .hero-featured::before {
            content: ''; position: absolute;
            width: 350px; height: 350px;
            background: radial-gradient(circle, rgba(139,92,246,0.2), transparent 70%);
            top: -100px; right: 120px; pointer-events: none;
        }

        .hero-label { font-size: 11px; color: var(--soft); text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; }
        .hero-title-main { font-size: 36px; font-weight: 800; line-height: 1.1; margin-bottom: 6px; letter-spacing: -0.5px; }
        .hero-subtitle { font-size: 15px; color: var(--soft); margin-bottom: 6px; }

        .hero-quote-small {
            font-size: 12px; color: var(--muted); font-style: italic;
            max-width: 320px; line-height: 1.5; margin-bottom: 22px;
            border-left: 2px solid rgba(0,242,255,0.35); padding-left: 10px;
        }

        .btn-play {
            display: inline-flex; align-items: center; gap: 8px;
            background: white; color: #0d0d1a; font-weight: 700;
            font-size: 13px; padding: 9px 20px; border-radius: 50px;
            text-decoration: none; transition: 0.25s;
        }

        .btn-play:hover { background: var(--cyan); color: #0d0d1a; transform: scale(1.03); }
        .btn-play svg { width: 14px; height: 14px; }

        .hero-img {
            width: 150px; height: 150px; border-radius: 12px;
            object-fit: cover; flex-shrink: 0; position: relative; z-index: 1;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
        }

        /* CARDS */
        .cards-section { padding: 24px 28px 0; }

        .section-title-s { font-size: 13px; font-weight: 700; color: white; margin-bottom: 14px; }

        .product-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; }

        .product-card {
            background: var(--bg2); border-radius: 12px; overflow: hidden;
            text-decoration: none; transition: 0.3s; border: 1px solid var(--border);
        }

        .product-card:hover {
            transform: translateY(-4px);
            border-color: rgba(0,242,255,0.2);
            box-shadow: 0 10px 28px rgba(0,0,0,0.4);
        }

        .product-card-img-placeholder {
            width: 100%; aspect-ratio: 1;
            display: flex; align-items: center; justify-content: center;
            font-size: 36px; background: var(--bg3);
        }

        .product-card-info { padding: 10px 12px; }
        .product-card-name { font-size: 13px; font-weight: 600; color: white; margin-bottom: 2px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .product-card-cat { font-size: 11px; color: var(--muted); }

        /* ABOUT */
        .about-strip {
            margin: 24px 28px 0;
            background: var(--bg2); border: 1px solid var(--border);
            border-radius: 14px; padding: 24px 28px;
            display: flex; align-items: flex-start; gap: 20px;
        }

        .about-avatar-big {
            width: 50px; height: 50px; border-radius: 50%;
            background: linear-gradient(135deg, var(--cyan), var(--purple));
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; font-weight: 800; color: #0d0d1a; flex-shrink: 0;
        }

        .about-info { flex: 1; }
        .about-name-s { font-size: 17px; font-weight: 700; margin-bottom: 3px; }
        .about-role-s { font-size: 12px; color: var(--muted); margin-bottom: 10px; }

        .about-quote-s {
            font-size: 12px; color: var(--soft); font-style: italic;
            border-left: 2px solid var(--cyan); padding-left: 10px; line-height: 1.5;
        }

        .about-tags-s { display: flex; gap: 7px; flex-wrap: wrap; margin-top: 10px; }

        .about-tag-s {
            background: rgba(139,92,246,0.1); border: 1px solid rgba(139,92,246,0.2);
            border-radius: 50px; padding: 3px 10px;
            font-size: 11px; color: #a78bfa; font-weight: 500;
        }

        /* MINI PLAYER */
        .mini-player {
            position: fixed; bottom: 0; left: var(--sidebar-w); right: 0;
            height: 62px; background: rgba(13,13,26,0.97);
            border-top: 1px solid var(--border); backdrop-filter: blur(20px);
            display: flex; align-items: center; padding: 0 24px; gap: 20px; z-index: 50;
        }

        .mini-song-info { display: flex; align-items: center; gap: 12px; flex: 1; min-width: 0; }

        .mini-thumb {
            width: 38px; height: 38px; border-radius: 8px;
            background: rgba(0,242,255,0.08); border: 1px solid var(--border);
            display: flex; align-items: center; justify-content: center; flex-shrink: 0;
        }

        .mini-thumb svg { width: 15px; height: 15px; color: var(--cyan); }
        .mini-title { font-size: 13px; font-weight: 600; }
        .mini-artist { font-size: 11px; color: var(--muted); }
        .mini-controls { display: flex; align-items: center; gap: 14px; }

        .mini-play-btn {
            width: 34px; height: 34px; border-radius: 50%;
            background: white; color: #0d0d1a; border: none; cursor: pointer;
            display: flex; align-items: center; justify-content: center; transition: 0.2s;
        }

        .mini-play-btn:hover { background: var(--cyan); }
        .mini-play-btn svg { width: 14px; height: 14px; }

        .mini-right { display: flex; align-items: center; justify-content: flex-end; flex: 1; }

        .mini-go-btn {
            font-size: 12px; color: var(--cyan); text-decoration: none;
            border: 1px solid rgba(0,242,255,0.2); border-radius: 8px;
            padding: 5px 12px; transition: 0.2s; font-weight: 500;
        }

        .mini-go-btn:hover { background: rgba(0,242,255,0.08); color: white; }

        /* TOAST */
        #music-toast {
            position: fixed; bottom: 76px;
            left: calc(var(--sidebar-w) + 20px);
            z-index: 999; background: rgba(19,19,31,0.97);
            border: 1px solid rgba(0,242,255,0.15); border-radius: 14px;
            backdrop-filter: blur(20px); box-shadow: 0 8px 40px rgba(0,0,0,0.6);
            padding: 12px 14px; display: none;
            align-items: center; gap: 12px; width: 260px;
        }

        @keyframes toastIn {
            from { opacity: 0; transform: translateY(16px) scale(0.96); }
            to   { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes toastOut {
            from { opacity: 1; transform: translateY(0); }
            to   { opacity: 0; transform: translateY(10px); }
        }

        #music-toast.show { animation: toastIn 0.4s cubic-bezier(0.34,1.56,0.64,1) forwards; }
        #music-toast.hide { animation: toastOut 0.3s ease forwards; }

        .toast-icon-s {
            width: 36px; height: 36px; border-radius: 10px;
            background: rgba(0,242,255,0.08); border: 1px solid rgba(0,242,255,0.15);
            display: flex; align-items: center; justify-content: center; flex-shrink: 0;
        }

        .toast-icon-s svg { width: 17px; height: 17px; color: var(--cyan); }
        .toast-text-s { flex: 1; min-width: 0; }
        .toast-label-s { font-size: 10px; color: var(--muted); text-transform: uppercase; letter-spacing: 1px; }
        .toast-song-s { font-size: 13px; font-weight: 700; }
        .toast-artist-s { font-size: 11px; color: var(--muted); }
        .toast-btns-s { display: flex; gap: 6px; }

        .tbtn {
            width: 30px; height: 30px; border-radius: 50%; border: none; cursor: pointer;
            font-size: 14px; font-weight: 700; transition: 0.2s;
            display: flex; align-items: center; justify-content: center;
        }

        .tbtn.y { background: var(--cyan); color: #0d0d1a; }
        .tbtn.y:hover { background: white; transform: scale(1.1); }
        .tbtn.n { background: rgba(255,255,255,0.08); color: var(--muted); }
        .tbtn.n:hover { background: rgba(255,255,255,0.15); color: white; }

        /* RESPONSIVE */
        @media (max-width: 860px) {
            body { flex-direction: column; overflow: auto; height: auto; }
            .sidebar { display: none; }
            .main-content { height: auto; overflow: visible; padding-bottom: 80px; }
            .mini-player { left: 0; }
            .product-cards { grid-template-columns: repeat(2, 1fr); }
            #music-toast { left: 16px; }
        }
    </style>
</head>

<!-- AUDIO -->
<audio id="globalAudio" loop hidden>
    <source id="globalSource" src="audio/hope_is_the_thing.mp3" type="audio/mp3">
</audio>

<!-- MINI PLAYER -->
<div class="mini-player">

    <div class="mini-song-info">

        <div class="mini-thumb">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 18V5l12-2v13"/>
                <circle cx="6" cy="18" r="3"/>
                <circle cx="18" cy="16" r="3"/>
            </svg>
        </div>

        <div>
            <div class="mini-title">Hope Is The Thing</div>
            <div class="mini-artist">SKYNET FM</div>
        </div>

    </div>

    <div class="mini-controls">

        <button
            class="mini-play-btn"
            onclick="miniToggle()"
            id="miniPlayBtn">

            <!-- PLAY -->
            <svg
                id="miniPlayIcon"
                viewBox="0 0 24 24"
                fill="currentColor">

                <polygon points="5 3 19 12 5 21 5 3"/>

            </svg>

            <!-- PAUSE -->
            <svg
                id="miniPauseIcon"
                viewBox="0 0 24 24"
                fill="currentColor"
                style="display:none;">

                <rect x="6" y="4" width="4" height="16"/>
                <rect x="14" y="4" width="4" height="16"/>

            </svg>

        </button>

    </div>

    <div class="mini-right">

        <a href="music/cassette.jsp" class="mini-go-btn">
            Abrir reproductor
        </a>

    </div>

</div>

<!-- TOAST -->
<div id="music-toast">

    <div class="toast-icon-s">

        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M9 18V5l12-2v13"/>
            <circle cx="6" cy="18" r="3"/>
            <circle cx="18" cy="16" r="3"/>
        </svg>

    </div>

    <div class="toast-text-s">

        <div class="toast-label-s">
            Musica de fondo
        </div>

        <div class="toast-song-s" id="toastSongName">
            Hope Is The Thing
        </div>

        <div class="toast-artist-s" id="toastArtistName">
            SKYNET FM
        </div>

    </div>

    <div class="toast-btns-s">

        <button class="tbtn y" id="toastYes">
            &#10003;
        </button>

        <button class="tbtn n" id="toastNo">
            &#10005;
        </button>

    </div>

</div>

<script>

const audio =
document.getElementById('globalAudio');

const source =
document.getElementById('globalSource');

/* =========================
   RESTAURAR CANCION
========================= */

window.addEventListener('DOMContentLoaded', () => {

    const savedSong =
    localStorage.getItem('skynet-song');

    if(savedSong){

        try{

            const song =
            JSON.parse(savedSong);

            source.src = song.src;

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

    audio.addEventListener('loadedmetadata', () => {

        if(savedProgress){

            audio.currentTime =
            parseFloat(savedProgress);

        }

    });

    const wasPlaying =
    localStorage.getItem('skynet-playing');

    if(wasPlaying === 'true'){

        audio.play().catch(() => {});

    }

});

/* =========================
   GUARDAR PROGRESO
========================= */

audio.addEventListener('timeupdate', () => {

    localStorage.setItem(
        'skynet-progress',
        audio.currentTime
    );

});

/* =========================
   PLAY / PAUSE
========================= */

audio.addEventListener('play', () => {

    localStorage.setItem(
        'skynet-playing',
        'true'
    );

    document.getElementById('miniPlayIcon').style.display =
    'none';

    document.getElementById('miniPauseIcon').style.display =
    'block';

});

audio.addEventListener('pause', () => {

    localStorage.setItem(
        'skynet-playing',
        'false'
    );

    document.getElementById('miniPlayIcon').style.display =
    'block';

    document.getElementById('miniPauseIcon').style.display =
    'none';

});

/* =========================
   BOTON MINI PLAYER
========================= */

function miniToggle(){

    if(audio.paused){

        audio.play().catch(() => {});

    }else{

        audio.pause();

    }

}

/* =========================
   TOAST
========================= */

const toast =
document.getElementById('music-toast');

if(!localStorage.getItem('skynet-music-choice')){

    setTimeout(() => {

        toast.style.display = 'flex';

        toast.classList.add('show');

    }, 1500);

}

document.getElementById('toastYes')
.addEventListener('click', () => {

    audio.play().catch(() => {});

    localStorage.setItem(
        'skynet-music-choice',
        'yes'
    );

    cerrarToast();

});

document.getElementById('toastNo')
.addEventListener('click', () => {

    localStorage.setItem(
        'skynet-music-choice',
        'no'
    );

    cerrarToast();

});

function cerrarToast(){

    toast.classList.remove('show');

    toast.classList.add('hide');

    setTimeout(() => {

        toast.style.display = 'none';

    }, 350);

}

setTimeout(() => {

    if(toast.style.display === 'flex'){

        cerrarToast();

    }

}, 12000);

</script>



<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="sidebar-dots">
        <span></span><span></span><span></span>
    </div>

    <div class="sidebar-avatar">
        <div class="avatar-circle">Z</div>
        <div class="avatar-info">
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
        <a href="productos" class="nav-link-s">Explorar</a>
        <a href="productos?categoria=tecnologia" class="nav-link-s">Tecnologia</a>
        <a href="productos?categoria=electrodomestico" class="nav-link-s">Electrodomesticos</a>
    </div>

    <div class="sidebar-bottom">
        <a href="music/cassette.jsp" class="skynet-fm-btn">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 18V5l12-2v13"/>
                <circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>
            </svg>
            Skynet FM
        </a>
    </div>
</aside>

<!-- MAIN -->
<div class="main-content">

    <!-- TOPBAR -->
    <div class="topbar">
        <a href="productos" class="search-bar">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
            Buscar productos...
        </a>
        <div class="topbar-right">
            <a href="music/cassette.jsp" class="icon-btn" title="Reproductor">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 18V5l12-2v13"/>
                    <circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>
                </svg>
            </a>
            <a href="productos" class="icon-btn" title="Tienda">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                </svg>
            </a>
        </div>
    </div>

    <!-- HERO -->
    <div class="hero-section" id="inicio">
        <div class="hero-featured">
            <div style="position:relative; z-index:1;">
                <div class="hero-label">Bienvenido a</div>
                <div class="hero-title-main">Tienda Skynet</div>
                <div class="hero-subtitle">productos a buen precio</div>
                <div class="hero-quote-small">
                    "Que las estrellas nos iluminen aunque hayan muerto hace millones de años"
                </div>
                <a href="/productos.jsp" class="btn-play">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <polygon points="5 3 19 12 5 21 5 3"/>
                    </svg>
                    Explorar tienda
                </a>
            </div>
            <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=600&auto=format&fit=crop"
                 class="hero-img" alt="Tech">
        </div>
    </div>

    <!-- CATEGORIAS -->
    <div class="cards-section" id="categorias">
        <div class="section-title-s">Categorias destacadas</div>
        <div class="product-cards">
            <a href="productos?categoria=tecnologia" class="product-card">
                <div class="product-card-img-placeholder">&#128187;</div>
                <div class="product-card-info">
                    <div class="product-card-name">Tecnologia</div>
                    <div class="product-card-cat">Celulares, laptops y mas</div>
                </div>
            </a>
            <a href="productos?categoria=electrodomestico" class="product-card">
                <div class="product-card-img-placeholder">&#127968;</div>
                <div class="product-card-info">
                    <div class="product-card-name">Electrodomesticos</div>
                    <div class="product-card-cat">Para el hogar</div>
                </div>
            </a>
            <a href="productos" class="product-card">
                <div class="product-card-img-placeholder">&#9889;</div>
                <div class="product-card-info">
                    <div class="product-card-name">Novedades</div>
                    <div class="product-card-cat">Lo mas reciente</div>
                </div>
            </a>
            <a href="music/cassette.jsp" class="product-card">
                <div class="product-card-img-placeholder">&#127925;</div>
                <div class="product-card-info">
                    <div class="product-card-name">Skynet FM</div>
                    <div class="product-card-cat">Musica de fondo</div>
                </div>
            </a>
        </div>
    </div>

    <!-- SOBRE MI -->
    <div class="cards-section" id="sobre-mi" style="padding-bottom:28px;">
        <div class="section-title-s">El creador</div>
        <div class="about-strip">
            <div class="about-avatar-big">Z</div>
            <div class="about-info">
                <div class="about-name-s">Zack</div>
                <div class="about-role-s">Estudiante de Ingenieria de Sistemas</div>
                <div class="about-quote-s">
                    "Que las estrellas nos iluminen aunque hayan muerto hace millones de anos"
                </div>
                <div class="about-tags-s">
                    <span class="about-tag-s">Ingenieria de Sistemas</span>
                    <span class="about-tag-s">JSP + Java</span>
                    <span class="about-tag-s">Diseno UI</span>
                    <span class="about-tag-s">2do semestre</span>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- MINI PLAYER -->
<div class="mini-player">
    <div class="mini-song-info">
        <div class="mini-thumb">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 18V5l12-2v13"/>
                <circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>
            </svg>
        </div>
        <div>
            <div class="mini-title">Hope Is The Thing</div>
            <div class="mini-artist">SKYNET FM</div>
        </div>
    </div>
    <div class="mini-controls">
        <button class="mini-play-btn" onclick="miniToggle()" id="miniPlayBtn">
            <svg id="miniPlayIcon" viewBox="0 0 24 24" fill="currentColor">
                <polygon points="5 3 19 12 5 21 5 3"/>
            </svg>
            <svg id="miniPauseIcon" viewBox="0 0 24 24" fill="currentColor" style="display:none;">
                <rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/>
            </svg>
        </button>
    </div>
    <div class="mini-right">
        <a href="music/cassette.jsp" class="mini-go-btn">Abrir reproductor</a>
    </div>
</div>

<!-- TOAST -->
<div id="music-toast">
    <div class="toast-icon-s">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M9 18V5l12-2v13"/>
            <circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>
        </svg>
    </div>
    <div class="toast-text-s">
        <div class="toast-label-s">Musica de fondo</div>
        <div class="toast-song-s" id="toastSongName">Hope Is The Thing</div>
        <div class="toast-artist-s" id="toastArtistName">SKYNET FM</div>
    </div>
    <div class="toast-btns-s">
        <button class="tbtn y" id="toastYes">&#10003;</button>
        <button class="tbtn n" id="toastNo">&#10005;</button>
    </div>
</div>

<script>
/* MINI PLAYER */
function miniToggle() {
    if (audioEl.paused) {
        audioEl.play().catch(() => {});
    } else {
        audioEl.pause();
    }
}

audioEl.addEventListener('play', () => {
    document.getElementById('miniPlayIcon').style.display  = 'none';
    document.getElementById('miniPauseIcon').style.display = 'block';
});

audioEl.addEventListener('pause', () => {
    document.getElementById('miniPlayIcon').style.display  = 'block';
    document.getElementById('miniPauseIcon').style.display = 'none';
});

/* Actualizar nombre en mini player y toast si hay cancion guardada */
window.addEventListener('DOMContentLoaded', () => {
    const savedSong = localStorage.getItem('skynet-song');
    if (savedSong) {
        try {
            const song = JSON.parse(savedSong);
            document.querySelector('.mini-title').textContent  = song.title;
            document.querySelector('.mini-artist').textContent = song.artist;
            document.getElementById('toastSongName').textContent  = song.title;
            document.getElementById('toastArtistName').textContent = song.artist;
        } catch(e) {}
    }
});

/* TOAST */
const toast = document.getElementById('music-toast');

if (!localStorage.getItem('skynet-music-choice')) {
    setTimeout(() => {
        toast.style.display = 'flex';
        toast.classList.add('show');
    }, 1500);
}

document.getElementById('toastYes').addEventListener('click', () => {
    audioEl.play().catch(() => {});
    localStorage.setItem('skynet-music-choice', 'yes');
    cerrarToast();
});

document.getElementById('toastNo').addEventListener('click', () => {
    localStorage.setItem('skynet-music-choice', 'no');
    cerrarToast();
});

function cerrarToast() {
    toast.classList.remove('show');
    toast.classList.add('hide');
    setTimeout(() => { toast.style.display = 'none'; }, 350);
}

setTimeout(() => {
    if (toast.style.display === 'flex') cerrarToast();
}, 12000);
</script>

</body>
</html>
