package com.electronic.model;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Product extends AbstractModel {
    private static final long serialVersionUID = 1L;
    private String id, name, desc, slug, sku;
    private List<Image> images;
    private Category category;
    private Discount discount;
    private Inventory inventory;
    private BigDecimal price;

    public Product() {
        images = new ArrayList<Image>();
    }

    public Product(String id, String name, String desc, String slug, String sku, Category category, Discount discount, Inventory inventory, BigDecimal price) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.slug = slug;
        this.sku = sku;
        this.category = category;
        this.discount = discount;
        this.inventory = inventory;
        this.price = price;
        images = new ArrayList<Image>();
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", slug=" + slug +
                ", sku=" + sku +
                ", desc='" + desc + '\'' +
                ", images=" + images +
                ", category=" + category +
                ", discount=" + discount +
                ", inventory=" + inventory +
                ", price=" + price +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public void addImage(Image image) {
        images.add(image);
    }

    public void addImages(List<Image> images) {
        images.addAll(images);
    }
}
