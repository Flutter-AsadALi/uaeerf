//package com.appuaeerf.uaeerfapp;
//
//import android.content.Context;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.SocketTimeoutException;
//import java.net.URL;
//
//public class ApiService {
//
//    public interface ApiCallback {
//        void onDataReceived(String data);
//        void onError(String errorMessage);
//    }
//    private Context context;
//
//    public ApiService(MainActivity mainActivity) {
//        this.context = context;
//    }
//
//    public void getDataFromAPI(final String apiKey,String apiUrl ,final ApiCallback callback) {
//        new Thread(new Runnable() {
//            @Override
//            public void run() {
//                try {
//                    URL url = new URL(apiUrl);
//                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//                    connection.setRequestMethod("GET");
//                    connection.setRequestProperty("API-KEY", apiKey);
//                    connection.setConnectTimeout(10000); // Timeout in milliseconds
//                    connection.setReadTimeout(10000);
//                    int responseCode = connection.getResponseCode();
//                    if (responseCode == HttpURLConnection.HTTP_OK) {
//                        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//                        StringBuilder response = new StringBuilder();
//                        String line;
//                        showErrorToast("Timeout occurred. Please try again.");
//                        while ((line = reader.readLine()) != null) {
//                            response.append(line);
//                        }
//                        reader.close();
//                        connection.disconnect();
//                        final String responseData = response.toString();
//                        if (callback != null) {
//                            callback.onDataReceived(responseData);
//                        }
//                    } else if (responseCode == HttpURLConnection.HTTP_UNAUTHORIZED) {
//                        callback.onError("Invalid API key. Access denied.");
//                    } else {
//                        callback.onError("HTTP Error Code: " + responseCode);
//                    }
//                } catch (SocketTimeoutException e) {
//                    showErrorToast("Timeout occurred. Please try again.");
//                    if (callback != null) {
//                        callback.onError("Timeout occurred. Please try again.");
//                    }
//                } catch (IOException e) {
//                    showErrorToast("Network error. Please check your connection. ");
//                    if (callback != null) {
//                        callback.onError("Network error. Please check your connection. ");
//                    }
//                }
//            }
//        }).start();
//    }
//    private void showErrorToast(final String errorMessage) {
////        Toast.makeText(context, errorMessage, Toast.LENGTH_SHORT).show();
//    }
//}
//
