package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Carrito;
import model.Producto;
import repository.ProductoRepository;

@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // ======================================
        // OBTENER CARRITO
        // ======================================

        List<Carrito> carrito =
                (List<Carrito>) session.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // ======================================
        // ACCION
        // ======================================

        String action = request.getParameter("action");

        // ======================================
        // AGREGAR PRODUCTO
        // ======================================

        if ("add".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            Producto producto =
                    ProductoRepository.buscar(id);

            // VALIDAR PRODUCTO

            if (producto == null) {

                response.sendRedirect("productos");
                return;
            }

            boolean existe = false;

            for (Carrito item : carrito) {

                if (item.getProducto().getId() == id) {

                    item.setCantidad(
                            item.getCantidad() + 1
                    );

                    existe = true;
                    break;
                }
            }

            // SI NO EXISTE

            if (!existe) {

                carrito.add(
                        new Carrito(producto, 1)
                );
            }

            // GUARDAR SESION

           session.setAttribute("carrito", carrito);

response.sendRedirect("productos?agregado=" + id);
return;
        }

        // ======================================
        // ELIMINAR PRODUCTO
        // ======================================

        if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            carrito.removeIf(item ->
                    item.getProducto().getId() == id
            );

            session.setAttribute("carrito", carrito);

            response.sendRedirect("CarritoServlet");
            return;
        }

        
        
// ======================================
// FINALIZAR COMPRA
// ======================================

if ("checkout".equals(action)) {

    carrito.clear();

    session.setAttribute("carrito", carrito);

    response.sendRedirect("Carrito.jsp?comprado=true");
    return;
}
        
        
        // ======================================
        // CALCULAR TOTAL
        // ======================================

        double subtotal = 0;

        for (Carrito item : carrito) {

            double precio =
                    item.getProducto().getPrecio();

            int cantidad =
                    item.getCantidad();

            subtotal += precio * cantidad;
        }

        // ======================================
        // PRODUCTO DESTACADO
        // ======================================

        Producto destacado = null;

        if (!carrito.isEmpty()) {

            destacado =
                    carrito.get(0).getProducto();
        }

        // ======================================
        // ENVIAR DATOS AL JSP
        // ======================================

        request.setAttribute("subtotal", subtotal);
        request.setAttribute("destacado", destacado);

        
        // enviar carrito 

        request.setAttribute("carrito", carrito);

        // ======================================
        // MOSTRAR JSP
        // ======================================

        request.getRequestDispatcher("Carrito.jsp")
                .forward(request, response);
    }
}