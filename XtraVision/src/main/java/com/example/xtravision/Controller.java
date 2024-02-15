package com.example.xtravision;

import commands.Command;
import commands.CommandFactory;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    // DON'T LEAVE AS IO EXCEPTIONS HANDLE THEM CORRECTLY

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        Command c = CommandFactory.getCommand(action, request, response);
        String destination = c.execute();
        response.sendRedirect(destination);
    }




    //Get a request and process it into different pages
    //Make sure to check if user is logged in for specific pages, and check membership status and admin status
    //--------------FIRST DRAFT LIST OF COMMANDS-----------
    //List displays of Movies, Tv Shows and Games
    //Add more
}