package com.demo.ecommerce.controller;

import com.demo.ecommerce.model.LignePanier;
import com.demo.ecommerce.model.Produit;
import com.demo.ecommerce.model.Stock;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/panier")
public class PanierServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<LignePanier> panier = (ArrayList<LignePanier>) session.getAttribute("panier");
        if (panier == null) {
            panier = new ArrayList<>();
            session.setAttribute("panier", panier); // Fix: Set the session attribute for "panier"
        }

        request.setAttribute("panier", panier);
        request.getRequestDispatcher("WEB-INF/panier.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<LignePanier> panier = (ArrayList<LignePanier>) session.getAttribute("panier");
        if (panier == null) {
            panier = new ArrayList<>();
            session.setAttribute("panier", panier); // Fix: Set the session attribute for "panier"
        }

        int id = Integer.parseInt(request.getParameter("id"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        Produit produit = Stock.getStock().getProduits().get(id);
        LignePanier lignePanier = new LignePanier(produit, qty);
        panier.add(lignePanier);

        response.sendRedirect(request.getContextPath() + "/magasin");
    }
}
