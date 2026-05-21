<%@page import="java.util.List"%>
<%@page import="model.Producto"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Productos - Skynet</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
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

        .sidebar-logo {
            font-size: 18px;
            font-weight: 800;
            color: var(--cyan);
            text-decoration: none;
            margin-bottom: 28px;
            display: block;
        }

        .nav-group { margin-bottom: 22px; }

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

        .nav-link-s:hover,
        .nav-link-s.active { color: white; background: rgba(255,255,255,0.05); }

        .sidebar-bottom { margin-top: auto; }

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
            transition: 0.2s;
        }

        .skynet-fm-btn:hover { background: rgba(0,242,255,0.12); color: white; }
        .skynet-fm-btn svg { width: 15px; height: 15px; }

        /* MAIN */
        .main-content {
            flex: 1;
            height: 100vh;
            overflow-y: auto;
            overflow-x: hidden;
            background: var(--bg);
            padding-bottom: 64px;
        }

        .main-content::-webkit-scrollbar { width: 4px; }
        .main-content::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.08); border-radius: 4px; }

        /* TOPBAR */
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
            gap: 16px;
        }

        .search-form {
            display: flex;
            align-items: center;
            gap: 8px;
            flex: 1;
            max-width: 340px;
        }

        .search-input {
            flex: 1;
            background: rgba(255,255,255,0.05);
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 8px 16px;
            color: white;
            font-size: 13px;
            font-family: 'Inter', sans-serif;
            outline: none;
            transition: 0.2s;
        }

        .search-input::placeholder { color: var(--muted); }
        .search-input:focus { border-color: rgba(0,242,255,0.3); }

        .search-btn {
            background: rgba(0,242,255,0.1);
            border: 1px solid rgba(0,242,255,0.2);
            border-radius: 10px;
            padding: 8px 16px;
            color: var(--cyan);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            font-family: 'Inter', sans-serif;
        }

        .search-btn:hover { background: rgba(0,242,255,0.18); color: white; }

        .topbar-right { display: flex; align-items: center; gap: 10px; }

        .icon-btn {
            display: flex;
            align-items: center;
            gap: 7px;
            height: 34px;
            border-radius: 8px;
            background: rgba(255,255,255,0.05);
            border: 1px solid var(--border);
            padding: 0 12px;
            cursor: pointer;
            transition: 0.2s;
            color: var(--soft);
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
        }

        .icon-btn:hover { background: rgba(255,255,255,0.1); color: white; }
        .icon-btn i { font-size: 15px; }

        /* PRODUCTOS */
        .productos-wrap { padding: 28px; }

        .productos-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .productos-title { font-size: 20px; font-weight: 700; }
        .productos-count { font-size: 13px; color: var(--muted); }

        .productos-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        /* CARD */
        .product-card {
            background: var(--bg2);
            border: 1px solid var(--border);
            border-radius: 14px;
            overflow: hidden;
            transition: 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-4px);
            border-color: rgba(0,242,255,0.2);
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }

        .product-card.oferta { border-color: rgba(239,68,68,0.35); box-shadow: 0 0 20px rgba(239,68,68,0.1); }
        .product-card.oferta:hover { box-shadow: 0 10px 30px rgba(239,68,68,0.2); }

        .badge-oferta {
            position: absolute;
            top: 12px; right: 12px;
            background: #ef4444;
            color: white;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border-radius: 50px;
            z-index: 1;
            animation: pulse 1.5s ease-in-out infinite;
        }

        .product-img {
            height: 180px;
            overflow: hidden;
            background: var(--bg3);
            border-bottom: 1px solid var(--border);
        }

        .product-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s ease;
        }

        .product-card:hover .product-img img { transform: scale(1.06); }

        .product-img-fallback {
            height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--bg3);
            border-bottom: 1px solid var(--border);
        }

        .product-img-fallback i { font-size: 56px; color: rgba(0,242,255,0.4); }

        .product-info {
            padding: 16px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .product-name { font-size: 14px; font-weight: 700; color: white; line-height: 1.3; }
        .product-price { font-size: 20px; font-weight: 800; color: var(--cyan); }
        .product-price-oferta { font-size: 20px; font-weight: 800; color: #f87171; }
        .product-price-old { font-size: 13px; color: var(--muted); text-decoration: line-through; }
        .product-oferta-label { font-size: 11px; color: #f87171; font-weight: 600; }

        .product-cat {
            display: inline-block;
            background: rgba(37,99,235,0.2);
            border: 1px solid rgba(37,99,235,0.3);
            color: #60a5fa;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 50px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .product-sub { font-size: 12px; color: var(--muted); }

        .btn-agregar {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            background: linear-gradient(45deg, #00f2ff, #0ea5e9);
            border: none;
            color: #020617;
            font-weight: 700;
            font-size: 13px;
            padding: 10px;
            border-radius: 10px;
            text-decoration: none;
            transition: 0.25s;
            margin-top: auto;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
        }

        .btn-agregar:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,242,255,0.3);
            color: #020617;
        }

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: var(--muted);
            grid-column: 1 / -1;
        }

        .empty-state i { font-size: 48px; margin-bottom: 16px; display: block; }
        .empty-state p { font-size: 16px; }

        /* MINI PLAYER */
        .mini-player {
            position: fixed;
            bottom: 0;
            left: var(--sidebar-w);
            right: 0;
            height: 62px;
            background: rgba(13,13,26,0.97);
            border-top: 1px solid var(--border);
            backdrop-filter: blur(20px);
            display: flex;
            align-items: center;
            padding: 0 24px;
            gap: 20px;
            z-index: 50;
        }

        .mini-song-info { display: flex; align-items: center; gap: 12px; flex: 1; min-width: 0; }

        .mini-thumb {
            width: 38px; height: 38px;
            border-radius: 8px;
            background: rgba(0,242,255,0.08);
            border: 1px solid var(--border);
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }

        .mini-thumb svg { width: 15px; height: 15px; color: var(--cyan); }
        .mini-title { font-size: 13px; font-weight: 600; }
        .mini-artist { font-size: 11px; color: var(--muted); }

        .mini-controls { display: flex; align-items: center; gap: 14px; }

        .mini-play-btn {
            width: 34px; height: 34px;
            border-radius: 50%;
            background: white; color: #0d0d1a;
            border: none; cursor: pointer;
            display: flex; align-items: center; justify-content: center;
            transition: 0.2s;
        }

        .mini-play-btn:hover { background: var(--cyan); }
        .mini-play-btn svg { width: 14px; height: 14px; }

        .mini-right { display: flex; align-items: center; justify-content: flex-end; flex: 1; }

        .mini-go-btn {
            font-size: 12px; color: var(--cyan);
            text-decoration: none;
            border: 1px solid rgba(0,242,255,0.2);
            border-radius: 8px;
            padding: 5px 12px;
            transition: 0.2s; font-weight: 500;
        }

        .mini-go-btn:hover { background: rgba(0,242,255,0.08); color: white; }

        /* ANIMACIONES */
        @keyframes pulse {
            0%,100% { transform: scale(1); }
            50% { transform: scale(1.06); }
        }

        @keyframes toastIn {
            from { opacity: 0; transform: translateY(16px) scale(0.95); }
            to   { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes toastOut {
            from { opacity: 1; transform: translateY(0); }
            to   { opacity: 0; transform: translateY(10px); }
        }

        /* RESPONSIVE */
        @media (max-width: 860px) {
            body { flex-direction: column; overflow: auto; height: auto; }
            .sidebar { display: none; }
            .main-content { height: auto; overflow: visible; padding-bottom: 80px; }
            .mini-player { left: 0; }
            .productos-grid { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 500px) {
            .productos-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>

<!-- AUDIO GLOBAL -->
<audio id="globalAudio" hidden></audio>

<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <div class="sidebar-dots">
        <span></span><span></span><span></span>
    </div>

    <a href="index.jsp" class="sidebar-logo">Skynet</a>

    <div class="nav-group">
        <div class="nav-group-label">Categorias</div>
        <a href="productos" class="nav-link-s">Todos</a>
        <a href="productos?categoria=tecnologia" class="nav-link-s">Tecnologia</a>
        <a href="productos?categoria=electrodomestico" class="nav-link-s">Electrodomesticos</a>
    </div>

    <div class="nav-group">
        <div class="nav-group-label">Subcategorias</div>
        <a href="productos?sub=celulares" class="nav-link-s">Celulares</a>
        <a href="productos?sub=computadores" class="nav-link-s">Computadores</a>
        <a href="productos?sub=tablets" class="nav-link-s">Tablets</a>
        <a href="productos?sub=accesorios" class="nav-link-s">Accesorios</a>
        <a href="productos?sub=refrigeradores" class="nav-link-s">Refrigeradores</a>
        <a href="productos?sub=licuadoras" class="nav-link-s">Licuadoras</a>
    </div>

    <div class="sidebar-bottom">
        <a href="music/cassette.jsp" class="skynet-fm-btn">
            <svg viewBox="0 0 24 24"
                 fill="none"
                 stroke="currentColor"
                 stroke-width="2">
                <path d="M9 18V5l12-2v13"/>
                <circle cx="6" cy="18" r="3"/>
                <circle cx="18" cy="16" r="3"/>
            </svg>

            Skynet FM
        </a>
    </div>
</aside>

<!-- MAIN -->
<div class="main-content">

    <!-- TOPBAR -->
    <div class="topbar">

        <form class="search-form"
              action="productos"
              method="get">

            <input class="search-input"
                   type="search"
                   name="buscar"
                   placeholder="Buscar productos..."
                   value="${param.buscar}">

            <button type="submit"
                    class="search-btn">

                Buscar

            </button>

        </form>

        <div class="topbar-right">

            <a href="index.jsp" class="icon-btn">
                <i class="bi bi-house"></i>
                Inicio
            </a>

            <a href="CarritoServlet" class="icon-btn">
                <i class="bi bi-cart-fill"></i>
                Carrito
            </a>

            <a href="music/cassette.jsp" class="icon-btn">
                <i class="bi bi-music-note-beamed"></i>
            </a>

        </div>

    </div>

    <!-- PRODUCTOS -->
    <div class="productos-wrap">

        <div class="productos-header">

            <span class="productos-title">
                Explorar Productos
            </span>

            <span class="productos-count"
                  id="contadorProductos">
            </span>

        </div>

        <div class="productos-grid">

            <%
            List<Producto> lista =
                    (List<Producto>) request.getAttribute("lista");

            if (lista != null && !lista.isEmpty()) {

                for (Producto p : lista) {

                    double precioOriginal =
                            p.getPrecio();

                    double precioFinal =
                            precioOriginal -
                            (precioOriginal *
                            p.getDescuento() / 100);

                    String imagen =
                            p.getImagen();
            %>

            <div class="product-card <%= p.getDescuento() > 0 ? "oferta" : "" %>">

                <% if (p.getDescuento() > 0) { %>

                    <span class="badge-oferta">
                        -<%= (int)p.getDescuento() %>% OFF
                    </span>

                <% } %>

                <% if (imagen != null && !imagen.isEmpty()) { %>

                    <div class="product-img">

                        <img src="<%= imagen %>"
                             alt="<%= p.getNombre() %>"

                             onerror="this.parentElement.outerHTML='<div class=\'product-img-fallback\'><i class=\'bi bi-box\'></i></div>'">

                    </div>

                <% } else { %>

                    <div class="product-img-fallback">

                        <i class="bi bi-box"></i>

                    </div>

                <% } %>

                <div class="product-info">

                    <div class="product-name">

                        <%= p.getNombre() %>

                    </div>

                    <% if (p.getDescuento() > 0) { %>

                        <div class="product-price-old">

                            $<%= String.format("%,.0f", precioOriginal) %>

                        </div>

                        <div class="product-price-oferta">

                            $<%= String.format("%,.0f", precioFinal) %>

                        </div>

                        <div class="product-oferta-label">

                            Oferta por tiempo limitado

                        </div>

                    <% } else { %>

                        <div class="product-price">

                            $<%= String.format("%,.0f", precioOriginal) %>

                        </div>

                    <% } %>

                    <span class="product-cat">

                        <%= p.getCategoria() %>

                    </span>

                    <span class="product-sub">

                        <%= p.getSubcategoria() %>

                    </span>

                    <a href="CarritoServlet?action=add&id=<%= p.getId() %>"
                       class="btn-agregar">

                        <i class="bi bi-cart-plus"></i>

                        Agregar al carrito

                    </a>

                </div>

            </div>

            <%
                }

            } else {
            %>

            <div class="empty-state">

                <i class="bi bi-search"></i>

                <p>No se encontraron productos</p>

            </div>

            <%
            }
            %>

        </div>

    </div>

</div>

<!-- MINI PLAYER -->

<div class="mini-player">

    <div class="mini-song-info">

        <div class="mini-thumb">

            <svg viewBox="0 0 24 24"
                 fill="none"
                 stroke="currentColor"
                 stroke-width="2">

                <path d="M9 18V5l12-2v13"/>

                <circle cx="6" cy="18" r="3"/>

                <circle cx="18" cy="16" r="3"/>

            </svg>

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

        <button class="mini-play-btn"
                onclick="miniToggle()">

            <svg id="miniPlayIcon"
                 viewBox="0 0 24 24"
                 fill="currentColor">

                <polygon points="5 3 19 12 5 21 5 3"/>

            </svg>

            <svg id="miniPauseIcon"
                 viewBox="0 0 24 24"
                 fill="currentColor"
                 style="display:none;">

                <rect x="6" y="4" width="4" height="16"/>

                <rect x="14" y="4" width="4" height="16"/>

            </svg>

        </button>

    </div>

    <div class="mini-right">

        <a href="music/cassette.jsp"
           class="mini-go-btn">

            Abrir reproductor

        </a>

    </div>

</div>

<script>

/* =========================
   AUDIO GLOBAL
========================= */

const audioEl =
    document.getElementById("globalAudio");

/* =========================
   CANCION POR DEFECTO
========================= */

const defaultSong = {

    src: "audio/hope_is_the_thing.mp3",

    title: "Hope Is The Thing",

    artist: "SKYNET FM"
};

/* =========================
   CARGAR CANCION
========================= */

let savedSong =
    JSON.parse(localStorage.getItem("skynet-song"));

if (!savedSong) {

    savedSong = defaultSong;
}

audioEl.src =
    savedSong.src;

/* =========================
   ACTUALIZAR MINI PLAYER
========================= */

document.querySelector(".mini-title").textContent =
    savedSong.title;

document.querySelector(".mini-artist").textContent =
    savedSong.artist;

/* =========================
   RESTAURAR TIEMPO
========================= */

const savedProgress =
    localStorage.getItem("skynet-progress");

audioEl.addEventListener("loadedmetadata", () => {

    if (savedProgress) {

        audioEl.currentTime =
            parseFloat(savedProgress);
    }

    const wasPlaying =
        localStorage.getItem("skynet-playing");

    if (wasPlaying === "true") {

        audioEl.play().catch(() => {});
    }
});

/* =========================
   PLAY / PAUSE
========================= */

function miniToggle() {

    if (audioEl.paused) {

        audioEl.play();

    } else {

        audioEl.pause();
    }
}

/* =========================
   ICONOS
========================= */

audioEl.addEventListener("play", () => {

    localStorage.setItem(
        "skynet-playing",
        "true"
    );

    document.getElementById("miniPlayIcon").style.display =
        "none";

    document.getElementById("miniPauseIcon").style.display =
        "block";
});

audioEl.addEventListener("pause", () => {

    localStorage.setItem(
        "skynet-playing",
        "false"
    );

    document.getElementById("miniPlayIcon").style.display =
        "block";

    document.getElementById("miniPauseIcon").style.display =
        "none";
});

/* =========================
   GUARDAR PROGRESO
========================= */

audioEl.addEventListener("timeupdate", () => {

    localStorage.setItem(
        "skynet-progress",
        audioEl.currentTime
    );
});

/* =========================
   CONTADOR PRODUCTOS
========================= */

const cards =
    document.querySelectorAll(".product-card");

const contador =
    document.getElementById("contadorProductos");

if (cards.length > 0) {

    contador.textContent =
        cards.length + " productos";
}

/* =========================
   NOTIFICACION CARRITO
========================= */

const params =
    new URLSearchParams(window.location.search);

if (params.get("agregado")) {

    const notif =
        document.createElement("div");

    notif.style.cssText = `
        position:fixed;
        bottom:80px;
        right:24px;
        background:rgba(19,19,31,0.97);
        border:1px solid rgba(0,242,255,0.25);
        border-radius:14px;
        padding:14px 18px;
        display:flex;
        align-items:center;
        gap:12px;
        font-family:Inter,sans-serif;
        font-size:14px;
        font-weight:600;
        color:white;
        z-index:9999;
        box-shadow:0 8px 30px rgba(0,0,0,0.5);
    `;

    notif.innerHTML = `
        <div style="
            width:32px;
            height:32px;
            border-radius:50%;
            background:#00f2ff;
            display:flex;
            align-items:center;
            justify-content:center;
            flex-shrink:0;
        ">
            <svg width="16"
                 height="16"
                 viewBox="0 0 24 24"
                 fill="none"
                 stroke="#020617"
                 stroke-width="3">

                <polyline points="20 6 9 17 4 12"/>

            </svg>
        </div>

        Producto agregado al carrito
    `;

    document.body.appendChild(notif);

    setTimeout(() => {

        notif.remove();

    }, 2500);

    window.history.replaceState(
        {},
        '',
        'productos'
    );
}

</script>

</body>
</html>