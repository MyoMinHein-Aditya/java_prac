package com.chat;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ChatClient {
    private static final String SERVER_HOST = "localhost";
    private static final int SERVER_PORT = 5000;

    public static void main(String[] args) {
        System.out.println("=========================================");
        System.out.println("Connecting to Chat Server at " + SERVER_HOST + ":" + SERVER_PORT + "...");
        System.out.println("=========================================");

        try (Socket socket = new Socket(SERVER_HOST, SERVER_PORT)) {
            System.out.println("Connected to Chat Server successfully!");
            System.out.println("Type your messages and press Enter. Type 'bye' to exit.\n");

            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader consoleInput = new BufferedReader(new InputStreamReader(System.in));

            Thread readThread = new Thread(() -> {
                try {
                    String serverMsg;
                    while ((serverMsg = in.readLine()) != null) {
                        System.out.println("[Server]: " + serverMsg);
                        if ("bye".equalsIgnoreCase(serverMsg.trim())) {
                            System.out.println("Server has ended the chat.");
                            break;
                        }
                    }
                } catch (Exception e) {
                    System.out.println("Connection closed.");
                }
            });
            readThread.start();

            String userMsg;
            while ((userMsg = consoleInput.readLine()) != null) {
                out.println(userMsg);
                if ("bye".equalsIgnoreCase(userMsg.trim())) {
                    System.out.println("Disconnecting from server...");
                    break;
                }
            }

            socket.close();
            System.out.println("Chat client closed.");
        } catch (Exception e) {
            System.out.println("Error connecting to server: " + e.getMessage());
            System.out.println("Make sure ChatServer is running first!");
        }
    }
}
