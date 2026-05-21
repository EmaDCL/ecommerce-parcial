package repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import model.Producto;

public class ProductoRepository {

    private static final List<Producto> productos = new ArrayList<>();

    static {

        // ===============================
        // CELULARES
        // ===============================

        productos.add(new Producto(1, "Samsung Galaxy A14", "Gama media Samsung", 1200000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(2, "Samsung Galaxy A34", "Pantalla AMOLED", 2000000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(3, "Samsung Galaxy A54", "Alta gama accesible", 2400000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(4, "iPhone 11", "Apple clásico", 2800000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1574755393849-623942496936?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(5, "iPhone 12", "Diseño moderno", 3500000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1606041008023-472dfb5e530f?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(6, "iPhone 13", "Potente y rápido", 4200000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1632633173522-47456de71b76?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(7, "Xiaomi Redmi Note 12", "Económico potente", 1400000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(8, "Xiaomi Redmi Note 13", "Última versión", 1800000, "tecnologia", "celulares",
                "https://images.unsplash.com/photo-1585060544812-6b45742d762f?auto=format&fit=crop&w=400&q=80"));

        // ===============================
        // COMPUTADORES
        // ===============================

        productos.add(new Producto(9, "Laptop HP i3", "Uso básico", 2200000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(10, "Laptop HP i5", "Uso medio", 3200000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(11, "Laptop Lenovo i5", "Trabajo y estudio", 3100000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(12, "Laptop Asus i7", "Alto rendimiento", 5200000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(13, "PC Gamer Básico", "Gaming inicial", 4500000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1587202372775-e229f172b9d7?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(14, "PC Gamer Avanzado", "Gaming extremo", 7800000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1593640408182-31c228b07735?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(15, "MacBook Air M1", "Portátil Apple", 6500000, "tecnologia", "computadores",
                "https://images.unsplash.com/photo-1611186871525-b8b1e5c35aad?auto=format&fit=crop&w=400&q=80"));

        // ===============================
        // TABLETS
        // ===============================

        productos.add(new Producto(16, "iPad 9", "Tablet Apple", 2400000, "tecnologia", "tablets",
                "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(17, "iPad 10", "Nueva generación", 3200000, "tecnologia", "tablets",
                "https://images.unsplash.com/photo-1561154464-82e9adf32764?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(18, "Samsung Tab A8", "Tablet económica", 1500000, "tecnologia", "tablets",
                "https://images.unsplash.com/photo-1585790050230-5dd28404ccb9?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(19, "Samsung Tab S7", "Alta gama", 3900000, "tecnologia", "tablets",
                "https://images.unsplash.com/photo-1589739900266-43b2843f4c12?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(20, "Lenovo Tab M10", "Uso diario", 1300000, "tecnologia", "tablets",
                "https://images.unsplash.com/photo-1540291246-d7ad4a294f6a?auto=format&fit=crop&w=400&q=80"));

        // ===============================
        // REFRIGERADORES
        // ===============================

        productos.add(new Producto(21, "Refrigerador LG 300L", "Mediano eficiente", 3400000, "electrodomestico", "refrigeradores",
                "https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(22, "Refrigerador LG 400L", "Gran capacidad", 4500000, "electrodomestico", "refrigeradores",
                "https://images.unsplash.com/photo-1571175443880-49e1d25b2bc5?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(23, "Refrigerador Samsung 350L", "Moderno", 4100000, "electrodomestico", "refrigeradores",
                "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(24, "Refrigerador Samsung 500L", "Premium", 5900000, "electrodomestico", "refrigeradores",
                "https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?auto=format&fit=crop&w=400&q=80"));

        // ===============================
        // LICUADORAS
        // ===============================

        productos.add(new Producto(25, "Licuadora Oster", "3 velocidades", 280000, "electrodomestico", "licuadoras",
                "https://images.unsplash.com/photo-1622484212850-eb596d769edc?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(26, "Licuadora Oster Pro", "Alta potencia", 420000, "electrodomestico", "licuadoras",
                "https://images.unsplash.com/photo-1570222094114-d054a817e56b?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(27, "Licuadora Ninja", "Potente", 560000, "electrodomestico", "licuadoras",
                "https://images.unsplash.com/photo-1585515656973-6e2b1f2f9a1f?auto=format&fit=crop&w=400&q=80"));

        // ===============================
        // ACCESORIOS
        // ===============================

        productos.add(new Producto(28, "Mouse Logitech", "Ergonómico", 120000, "tecnologia", "accesorios",
                "https://images.unsplash.com/photo-1527814050087-3793815479db?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(29, "Teclado Mecánico", "RGB gamer", 350000, "tecnologia", "accesorios",
                "https://images.unsplash.com/photo-1541140532154-b024d705b90a?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(30, "Audífonos Gamer", "Sonido envolvente", 420000, "tecnologia", "accesorios",
                "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=400&q=80"));

        productos.add(new Producto(31, "Monitor 24 pulgadas", "Full HD", 980000, "tecnologia", "accesorios",
                "https://images.unsplash.com/photo-1527443224154-c4a573d03e77?auto=format&fit=crop&w=400&q=80"));

        actualizarDescuentos();
    }

    public static void actualizarDescuentos() {
        long tiempo = System.currentTimeMillis() / 600000;
        Random random = new Random(tiempo);

        for (Producto p : productos) {

            if (random.nextInt(100) < 35) {

                double descuento = 10 + random.nextInt(31);
                p.setDescuento(descuento);

            } else {

                p.setDescuento(0);

            }
        }
    }

    public static List<Producto> listar() {
        actualizarDescuentos();
        return productos;
    }

    public static void agregar(Producto p) {
        productos.add(p);
    }

    public static void eliminar(int id) {
        productos.removeIf(p -> p.getId() == id);
    }

    public static Producto buscar(int id) {

        actualizarDescuentos();

        for (Producto p : productos) {

            if (p.getId() == id) {
                return p;
            }
        }

        return null;
    }

    public static void actualizar(Producto productoActualizado) {

        for (Producto p : productos) {

            if (p.getId() == productoActualizado.getId()) {

                p.setNombre(productoActualizado.getNombre());
                p.setDescripcion(productoActualizado.getDescripcion());
                p.setPrecio(productoActualizado.getPrecio());
                p.setCategoria(productoActualizado.getCategoria());
                p.setSubcategoria(productoActualizado.getSubcategoria());
                p.setImagen(productoActualizado.getImagen());

                break;
            }
        }
    }
}