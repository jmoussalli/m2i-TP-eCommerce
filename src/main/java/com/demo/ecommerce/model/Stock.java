package com.demo.ecommerce.model;

import java.util.ArrayList;

public class Stock {

    private static Stock stock;
    private ArrayList<Produit> produits;

    private Stock() {
        produits = new ArrayList<>();
        init();
    }

    public static Stock getStock() {
        if (stock == null) {
            stock = new Stock();
        }
        return stock;
    }

    public void init() {
        Produit produit1 = new Produit("Produit 1", 10.99);
        Produit produit2 = new Produit("Produit 2", 15.99);
        Produit produit3 = new Produit("Produit 3", 8.99);

        addProduit(produit1);
        addProduit(produit2);
        addProduit(produit3);
    }

    public ArrayList<Produit> getProduits() {
        return produits;
    }

    public void addProduit(Produit produit) {
        this.produits.add(produit);
    }

    @Override
    public String toString() {
        return "Stock{" +
                "produits=" + produits +
                '}';
    }
}
