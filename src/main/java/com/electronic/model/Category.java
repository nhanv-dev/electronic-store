package com.electronic.model;

public class Category extends AbstractModel {
    private String id, name, slug;
    private int numberOfProduct;

    public Category() {

    }

    public Category(String id, String name, String slug, int numberOfProduct) {
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.numberOfProduct = numberOfProduct;
    }

    @Override
    public String toString() {
        return "Category{" + "id='" + id + '\'' + ", name='" + name + '\'' + ", slug='" + slug + '\'' + '}';
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

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public int getNumberOfProduct() {
        return numberOfProduct;
    }

    public void setNumberOfProduct(int numberOfProduct) {
        this.numberOfProduct = numberOfProduct;
    }
}
