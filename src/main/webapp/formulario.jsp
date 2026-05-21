<!DOCTYPE html>
<html>
<head>
    <title>Agregar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="mb-4">Agregar Producto</h3>

        <form action="${pageContext.request.contextPath}/agregarProducto" method="post">

            <div class="mb-3">
                <label>ID</label>
                <input type="number" name="id" class="form-control">
            </div>

            <div class="mb-3">
                <label>Nombre</label>
                <input type="text" name="nombre" class="form-control">
            </div>

            <div class="mb-3">
                <label>Descripción</label>
                <input type="text" name="descripcion" class="form-control">
            </div>

            <div class="mb-3">
                <label>Precio</label>
                <input type="number" step="0.01" name="precio" class="form-control">
            </div>

            <div class="mb-3">
                <label>Categoría</label>
                <input type="text" name="categoria" class="form-control">
            </div>

            <div class="mb-3">
                <label>Subcategoría</label>
                <input type="text" name="subcategoria" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="productos" class="btn btn-secondary">Volver</a>

        </form>
    </div>
</div>

</body>
</html>