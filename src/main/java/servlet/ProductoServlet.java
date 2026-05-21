package servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;
import repository.ProductoRepository;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/productos"})
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoria = request.getParameter("categoria");
        String sub = request.getParameter("sub"); // 🔥 NUEVO
        String buscar = request.getParameter("buscar");

        List<Producto> lista = ProductoRepository.listar();

        // 🔹 FILTRO POR CATEGORÍA
        if (categoria != null && !categoria.isEmpty()) {
            lista = lista.stream()
                    .filter(p -> p.getCategoria().equalsIgnoreCase(categoria))
                    .collect(Collectors.toList());
        }

        // 🔹 FILTRO POR SUBCATEGORÍA 
        if (sub != null && !sub.isEmpty()) {
            lista = lista.stream()
                    .filter(p -> p.getSubcategoria().equalsIgnoreCase(sub))
                    .collect(Collectors.toList());
        }

        // 🔹 FILTRO POR BÚSQUEDA
        if (buscar != null && !buscar.isEmpty()) {
            lista = lista.stream()
                    .filter(p -> p.getNombre().toLowerCase().contains(buscar.toLowerCase()))
                    .collect(Collectors.toList());
        }

        request.setAttribute("lista", lista);
        request.getRequestDispatcher("/productos.jsp").forward(request, response);
    }
}