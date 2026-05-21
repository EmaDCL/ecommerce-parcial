
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;
import repository.ProductoRepository;

/**
 *
 * @author Juan sebastian Ortiz
 */
@WebServlet(name = "AgregarProductoServlet", urlPatterns = {"/agregarProducto"})
public class AgregarProductoServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");
        String subcategoria = request.getParameter("subcategoria");
        
        Producto nuevo = new Producto(id, nombre, descripcion, precio, categoria, subcategoria, "");
        
        ProductoRepository.agregar(nuevo);
        
        response.sendRedirect("/productos");
        
    }

}
