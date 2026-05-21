<%@page import="model.Carrito"%>
<%@page import="java.util.List"%>

<%
List<Carrito> carrito =
(List<Carrito>) session.getAttribute("carrito");

if(carrito == null){
    carrito = new java.util.ArrayList<>();
}

double total = 0;
%>

<!DOCTYPE html>
<html>

<head>

    <title>Carrito de Compras</title>

    <!-- Bootstrap -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <style>

        body{
            background:#f3f4f6;
        }

        .contenedor{
            display:flex;
            gap:30px;
            align-items:flex-start;
        }

        .tabla-carrito{
            flex:2;
        }

        .tabla-card{
            border:none;
            border-radius:20px;
            overflow:hidden;
        }

        .table{
            margin:0;
        }

        .table thead{
            background:#111827;
            color:white;
        }

        .producto-info{
            display:flex;
            align-items:center;
            gap:15px;
        }

        .sidebar{
            flex:1;
            background:white;
            border-radius:20px;
            padding:25px;
            box-shadow:0 4px 15px rgba(0,0,0,0.08);
            position:sticky;
            top:20px;
        }

        .sidebar h4{
            margin-bottom:20px;
        }

        .precio-total{
            font-size:35px;
            font-weight:bold;
            color:#111827;
        }

        .btn-comprar{
            width:100%;
            padding:15px;
            border:none;
            border-radius:15px;
            background:#111827;
            color:white;
            font-size:18px;
            margin-top:25px;
            transition:0.3s;
            text-decoration:none;
            display:block;
            text-align:center;
        }

        .btn-comprar:hover{
            background:#1f2937;
            transform:translateY(-2px);
            color:white;
        }

        .vacio{
            background:white;
            padding:60px;
            border-radius:20px;
            text-align:center;
            box-shadow:0 4px 15px rgba(0,0,0,0.08);
        }

        .descuento-row{
            background:#fff5f5 !important;
        }

    </style>

</head>

<!-- AUDIO -->

<audio id="globalAudio" loop hidden>
    <source id="globalSource" src="audio/hope_is_the_thing.mp3" type="audio/mp3">
</audio>



<script>

const audio = document.getElementById('globalAudio');
const source = document.getElementById('globalSource');

const savedSong =
localStorage.getItem('skynet-song');

if(savedSong){

    try{

        const song =
        JSON.parse(savedSong);

        source.src = song.src;

        const savedProgress =
        localStorage.getItem('skynet-progress');

        audio.addEventListener('canplay', () => {

            if(savedProgress){

                audio.currentTime =
                parseFloat(savedProgress);

            }

            const wasPlaying =
            localStorage.getItem('skynet-playing');

            if(wasPlaying === 'true'){

                audio.play().catch(() => {});
            }

        }, { once:true });

        audio.load();

    }catch(e){}
}

audio.addEventListener('timeupdate', () => {

    localStorage.setItem(
        'skynet-progress',
        audio.currentTime
    );

});

audio.addEventListener('play', () => {

    localStorage.setItem(
        'skynet-playing',
        'true'
    );

});

audio.addEventListener('pause', () => {

    localStorage.setItem(
        'skynet-playing',
        'false'
    );

});


</script>

<body>

<%
String comprado = request.getParameter("comprado");

if ("true".equals(comprado)) {
%>

<div style="
    background:#d1fae5;
    border:1px solid #10b981;
    color:#065f46;
    padding:14px;
    border-radius:12px;
    margin:20px auto;
    width:90%;
    font-weight:bold;
    text-align:center;
">
    Compra realizada con exito.
</div>

<%
}
%>

<div class="container mt-5">

    <h2 class="text-center mb-4">
        <i class="bi bi-cart-fill"></i>
        Carrito de Compras
    </h2>

    <div class="mb-4">

        <a href="productos" class="btn btn-secondary">

            <i class="bi bi-arrow-left"></i>
            Volver a productos

        </a>

    </div>

    <% if(carrito.isEmpty()){ %>

        <div class="vacio">

            <h3>Tu carrito está vacío</h3>

            <p class="mt-3">
                Agrega un producto.
            </p>

        </div>

    <% } else { %>

    <div class="contenedor">

        <!-- TABLA -->

        <div class="tabla-carrito">

            <div class="card tabla-card shadow">

                <table class="table table-hover align-middle">

                    <thead>

                        <tr>

                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Subtotal</th>
                            <th>Eliminar</th>

                        </tr>

                    </thead>

                    <tbody>

                    <%
                    for(Carrito item : carrito){

                        double precioOriginal =
                        item.getProducto().getPrecio();

                        double precioFinal =
                        precioOriginal -
                        (precioOriginal *
                        item.getProducto().getDescuento()/100);

                        double subtotal =
                        precioFinal * item.getCantidad();

                        total += subtotal;
                    %>

                        <tr class="<%= item.getProducto().getDescuento() > 0 ? "descuento-row" : "" %>">

                            <td>

                                <div class="producto-info">

                                    <div class="bg-secondary text-white d-flex justify-content-center align-items-center"
                                         style="width:80px;height:80px;border-radius:15px;">

                                        <i class="bi bi-bag-fill fs-2"></i>

                                    </div>

                                    <div>

                                        <strong>
                                            <%= item.getProducto().getNombre() %>
                                        </strong>

                                        <% if(item.getProducto().getDescuento() > 0){ %>

                                            <br>

                                            <span class="badge bg-danger mt-2">

                                                -<%= (int)item.getProducto().getDescuento() %>% OFF

                                            </span>

                                        <% } %>

                                    </div>

                                </div>

                            </td>

                            <td>

                                <%= item.getCantidad() %>

                            </td>

                            <td>

                                <strong>

                                    $<%= String.format("%,.0f", precioFinal) %>

                                </strong>

                            </td>

                            <td>

                                <strong class="text-success">

                                    $<%= String.format("%,.0f", subtotal) %>

                                </strong>

                            </td>

                            <td>

                                <a href="CarritoServlet?action=delete&id=<%= item.getProducto().getId() %>"
                                   class="btn btn-danger">

                                    <i class="bi bi-trash"></i>

                                </a>

                            </td>

                        </tr>

                    <%
                    }
                    %>

                    </tbody>

                </table>

            </div>

        </div>

        <!-- SIDEBAR -->

        <div class="sidebar">

            <%
            Carrito primero = carrito.get(0);
            %>

            <div class="bg-dark text-white d-flex justify-content-center align-items-center mb-4"
                 style="height:220px;border-radius:20px;">

                <i class="bi bi-cart-fill"
                   style="font-size:70px;"></i>

            </div>

            <h4>

                <%= primero.getProducto().getNombre() %>

            </h4>

            <p class="text-muted">
                Producto destacado del carrito
            </p>

            <hr>

            <p>Total del pedido</p>

            <div class="precio-total">

                $<%= String.format("%,.0f", total) %>

            </div>

            <a href="CarritoServlet?action=checkout"
               class="btn-comprar">

                Finalizar compra

            </a>

        </div>

    </div>

    <% } %>

</div>

</body>
</html>