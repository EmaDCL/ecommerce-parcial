package model;
 
public class Producto {
 
    private int id;
    private String nombre;
    private String descripcion;
    private double precio;
    private String categoria;
    private String subcategoria;
    private double descuento;
    private String imagen;
 
    public Producto(int id, String nombre,
            String descripcion,
            double precio,
            String categoria,
            String subcategoria,
            String imagen) {
 
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
        this.subcategoria = subcategoria;
        this.descuento = 0;
        this.imagen = imagen;
    }
 
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
 
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
 
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
 
    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
 
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
 
    public String getSubcategoria() { return subcategoria; }
    public void setSubcategoria(String subcategoria) { this.subcategoria = subcategoria; }
 
    public double getDescuento() { return descuento; }
    public void setDescuento(double descuento) { this.descuento = descuento; }
 
    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }
}
 