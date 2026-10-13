package com.chat;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {
    private static final int PORT = 5000;

    public static void main(String[] args) {
        System.out.println("=========================================");
        System.out.println("Chat Server is starting on port " + PORT + "...");
        System.out.println("=========================================");

        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            System.out.println("Server listening on port " + PORT + ". Waiting for client to connect...");

            Socket clientSocket = serverSocket.accept();
            System.out.println("Client connected from: " + clientSocket.getRemoteSocketAddress());

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            BufferedReader consoleInput = new BufferedReader(new InputStreamReader(System.in));

            Thread readThread = new Thread(() -> {
                try {
                    String clientMsg;
                    while ((clientMsg = in.readLine()) != null) {
                        System.out.println("[Client]: " + clientMsg);
                        if ("bye".equalsIgnoreCase(clientMsg.trim())) {
                            System.out.println("Client has disconnected.");
                            break;
                        }
                    }
                } catch (Exception e) {
                    System.out.println("Connection ended with client.");
                }
            });
            readThread.start();

            String serverMsg;
            while ((serverMsg = consoleInput.readLine()) != null) {
                out.println(serverMsg);
                if ("bye".equalsIgnoreCase(serverMsg.trim())) {
                    System.out.println("Server closing session.");
                    break;
                }
            }

            clientSocket.close();
            System.out.println("Server shutdown successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
