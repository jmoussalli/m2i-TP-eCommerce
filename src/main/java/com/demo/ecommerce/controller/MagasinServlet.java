package com.demo.ecommerce.controller;

import com.demo.ecommerce.model.Produit;
import com.demo.ecommerce.model.Stock;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/magasin")
public class MagasinServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Produit> produits = Stock.getStock().getProduits();

        request.setAttribute("produits", produits);
        request.getRequestDispatcher("WEB-INF/magasin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
