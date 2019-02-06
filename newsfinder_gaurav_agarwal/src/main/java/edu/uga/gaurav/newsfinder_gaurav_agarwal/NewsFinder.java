/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * @author Gaurav Agarwal
 */
package edu.uga.gaurav.newsfinder_gaurav_agarwal;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

//----------------
import org.apache.http.client.ClientProtocolException;
import org.jboss.resteasy.client.ClientRequest;
import org.jboss.resteasy.client.ClientResponse;
import org.json.JSONObject;



/**
 * This class represents the news articles source
 * It interacts with the RESTful service newsapi.org.
 * API Key is necessary;  for low number of searches, it is free.
 * The below code is taken from Mykong - www.mkyong.com/webservices/jax-rs/restful-java-client-with-resteasy-client-framework/
 */
public class NewsFinder {

    public static final String BASE_URL = "https://newsapi.org/v2/everything";
    public static final String API_KEY = "244285c986764a3585922178706b83e9";

    public static String callWS(String query, String fromDate, String toDate) {
    	String		sortBy = "publishedAt";

            try {
                        String      ws_url = BASE_URL+"?q="+query+"&from="+fromDate+"&to="+toDate+"&sortBy="+sortBy+"&apiKey="+API_KEY;
//                        System.out.println(ws_url+"\n");
        		ClientRequest request = new ClientRequest(ws_url);
//                        ClientRequest request = new ClientRequest(
//        				"https://newsapi.org/v2/everything?q=modi&from=2019-01-15&to=&sortBy=publishedAt&apiKey=244285c986764a3585922178706b83e9");

        		request.accept("application/json");
        		ClientResponse<String> response = request.get(String.class);

        		if (response.getStatus() != 200) {
        			throw new RuntimeException("Failed : HTTP error code : "
        				+ response.getStatus());
//        			String ex = "{error:"+except.toString()+"}";
//        			return new JSONObject(ex);
        		}

        		BufferedReader br = new BufferedReader(new InputStreamReader(
        			new ByteArrayInputStream(response.getEntity().getBytes())));

        		String output, op="";
        		while ((output = br.readLine()) != null) {
        			op = op+output;
        		}
        		
        		return op;
//        		JSONObject jsonObj = new JSONObject(op);
//        		return jsonObj.toString();

        	  } catch (ClientProtocolException e) {

        		e.printStackTrace();

        	  } catch (IOException e) {

        		e.printStackTrace();

        	  } catch (Exception e) {

        		e.printStackTrace();

        	  }
			return null;
    }
    
//    public static void main( String[] args )
//    {
//    	String      query;
//    	Scanner     keyboard = null;
//    	String		fromDate = "2019-01-05";
//    	String		toDate = "";
//    	
//    	System.out.print( "Enter query terms: " );
//        keyboard = new Scanner( System.in );
//        query = keyboard.nextLine();
//        keyboard.close();
//        
//        System.out.println("Output from Web Service .... \n");
//    	System.out.println(callWS(query, fromDate, toDate));
//    }
}
