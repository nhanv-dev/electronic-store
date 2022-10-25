package com.electronic.model;

public class Discount extends AbstractModel {
    private String id, name, desc;
    private float percent;
    private boolean active;

    public Discount() {
    }

    public Discount(String id, String name, String desc, float percent, boolean active) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.percent = percent;
        this.active = active;
    }

    @Override
    public String toString() {
        return "Discount{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", percent=" + percent +
                ", active=" + active +
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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public float getPercent() {
        return percent;
    }

    public void setPercent(float percent) {
        this.percent = percent;
    }

}
