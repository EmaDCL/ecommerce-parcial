
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;
import repository.ProductoRepository;

/**

 * @author Juan sebastian Ortiz
 */
@WebServlet(name = "EditarProductoServlet", urlPatterns = {"/editarProducto"})
public class EditarProductoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Producto producto = ProductoRepository.buscar(id);
        
        request.setAttribute("producto",producto);
        request.getRequestDispatcher("/formularioEditar.jsp").forward(request, response);
        
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
