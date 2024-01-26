package com.example.xtravision;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "controller", urlPatterns = {"/controller"})
public class Controller extends HttpServlet {

    //Get a request and process it into different pages
    //Make sure to check if user is logged in for specific pages, and check membership status and admin status
    //--------------FIRST DRAFT LIST OF COMMANDS-----------

    //LoginCommand
    //RegisterCommand
    //List displays of Movies, Tv Shows and Games
    //Add more
}