package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Producto;
import repository.ProductoRepository;

@WebServlet(name = "ActualizarProductoServlet", urlPatterns = {"/actualizarProducto"})
public class ActualizarProductoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        String nombre =
                request.getParameter("nombre");

        String descripcion =
                request.getParameter("descripcion");

        double precio = Double.parseDouble(
                request.getParameter("precio")
        );

        String categoria =
                request.getParameter("categoria");

        String subcategoria =
                request.getParameter("subcategoria");

        String imagen =
                request.getParameter("imagen");

        // SI NO HAY IMAGEN

        if (imagen == null) {

            imagen = "";
        }

        Producto actualizado = new Producto(
                id,
                nombre,
                descripcion,
                precio,
                categoria,
                subcategoria,
                imagen
        );

        ProductoRepository.actualizar(actualizado);

        response.sendRedirect(
                request.getContextPath() + "/productos"
        );
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
}