package com.agrotravel;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String product = request.getParameter("product");
        String rating = request.getParameter("rating");
        String feedback = request.getParameter("feedback");

        if (name == null || name.trim().isEmpty()) name = "Anonymous Visitor";
        if (email == null) email = "";
        if (product == null) product = "General Farm Visit";
        if (rating == null || rating.trim().isEmpty()) rating = "5";
        if (feedback == null) feedback = "Wonderful experience!";

        try {

            String filePath = getServletContext()
                    .getRealPath("/feedbacks.xml");

            File xmlFile = new File(filePath);

            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();

            DocumentBuilder builder =
                    factory.newDocumentBuilder();

            Document document;
            Element root;

            if (xmlFile.exists() && xmlFile.length() > 0) {
                document = builder.parse(xmlFile);
                root = document.getDocumentElement();
            } else {
                document = builder.newDocument();
                root = document.createElement("feedbacks");
                root.setAttribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
                root.setAttribute("xsi:noNamespaceSchemaLocation", "feedbackSchema.xsd");
                document.appendChild(root);
            }

            Element feedbackElement =
                    document.createElement("feedback");

            Element nameElement =
                    document.createElement("name");
            nameElement.setTextContent(name);

            Element emailElement =
                    document.createElement("email");
            emailElement.setTextContent(email);

            Element productElement =
                    document.createElement("product");
            productElement.setTextContent(product);

            Element ratingElement =
                    document.createElement("rating");
            ratingElement.setTextContent(rating);

            Element commentElement =
                    document.createElement("comment");
            commentElement.setTextContent(feedback);

            feedbackElement.appendChild(nameElement);
            feedbackElement.appendChild(emailElement);
            feedbackElement.appendChild(productElement);
            feedbackElement.appendChild(ratingElement);
            feedbackElement.appendChild(commentElement);

            root.appendChild(feedbackElement);

            TransformerFactory transformerFactory =
                    TransformerFactory.newInstance();

            Transformer transformer =
                    transformerFactory.newTransformer();

            transformer.setOutputProperty(
                    OutputKeys.INDENT,
                    "yes"
            );
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");

            DOMSource source =
                    new DOMSource(document);

            StreamResult result =
                    new StreamResult(xmlFile);

            transformer.transform(source, result);

            // Also keep the source project feedbacks.xml in sync if possible
            try {
                File srcXml = new File("C:/Users/shrey/eclipse-workspace/AgroTravel1/src/main/webapp/feedbacks.xml");
                if (srcXml.exists()) {
                    transformer.transform(source, new StreamResult(srcXml));
                }
            } catch (Exception ex) {
                // Ignore sync errors
            }

            response.sendRedirect("feedbackSummary.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );

        }

    }

}