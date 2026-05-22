<%@page import="model.Producto"%>

<%
Producto p = (Producto) request.getAttribute("producto");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="mb-4">Editar Producto</h3>

        <form action="${pageContext.request.contextPath}/actualizarProducto" method="post">

            <input type="hidden" name="id" value="<%= p.getId() %>">

            <div class="mb-3">
                <label>Nombre</label>
                <input type="text" name="nombre" value="<%= p.getNombre() %>" class="form-control">
            </div>

            <div class="mb-3">
                <label>Descripción</label>
                <input type="text" name="descripcion" value="<%= p.getDescripcion() %>" class="form-control">
            </div>

            <div class="mb-3">
                <label>Precio</label>
                <input type="number" step="0.01" name="precio" value="<%= p.getPrecio() %>" class="form-control">
            </div>

            <div class="mb-3">
                <label>Categoría</label>
                <input type="text" name="categoria" value="<%= p.getCategoria() %>" class="form-control">
            </div>

            <div class="mb-3">
                <label>Subcategoría</label>
                <input type="text" name="subcategoria" value="<%= p.getSubcategoria() %>" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a href="productos" class="btn btn-secondary">Cancelar</a>

        </form>
    </div>
</div>

</body>
</html>
