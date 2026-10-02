<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.xml.transform.Transformer" %>
<%@ page import="javax.xml.transform.TransformerFactory" %>
<%@ page import="javax.xml.transform.stream.StreamSource" %>
<%@ page import="javax.xml.transform.stream.StreamResult" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.io.File" %>
<%
    try {
        String xmlPath = application.getRealPath("/feedbacks.xml");
        String xslPath = application.getRealPath("/feedbackSummary.xsl");
        TransformerFactory factory =
                TransformerFactory.newInstance();
        Transformer transformer =
                factory.newTransformer(
                    new StreamSource(new File(xslPath))
                );
        StringWriter writer = new StringWriter();
        transformer.transform(
            new StreamSource(new File(xmlPath)),
            new StreamResult(writer)
        );
        out.println(writer.toString());
    } catch (Exception e) {
        out.println("<h2>Error generating summary</h2>");
        out.println("<p>" + e.getMessage() + "</p>");
    }
%>