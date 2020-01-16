package com.avio.controller;

import com.avio.domain.Ticket;
import com.avio.service.TicketPDFGenerator;
import com.avio.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;


@Controller
public class TicketExportController {
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TicketPDFGenerator ticketPdfGenerator;

    @RequestMapping("/reserve/preview/ticket/download/{ticketId}")
    public void downloadPDF(@PathVariable Integer ticketId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Ticket ticket = ticketService.getById(ticketId);

        final ServletContext servletContext = request.getSession().getServletContext();
        final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        final String temperotyFilePath = tempDirectory.getAbsolutePath();

        String fileName = "ticket-" + ticket.getFirstName() + "-" + ticket.getLastName() +".pdf";
        response.setContentType("application/pdf");
        response.setHeader("Content-disposition", "attachment; filename="+ fileName);

        try {
            ticketPdfGenerator.createPDF(temperotyFilePath+"\\"+fileName, ticket);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            baos = convertPDFToByteArrayOutputStream(temperotyFilePath+"\\"+fileName);
            OutputStream os = response.getOutputStream();
            baos.writeTo(os);
            os.flush();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }


    private ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {
        InputStream inputStream = null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {

            inputStream = new FileInputStream(fileName);
            byte[] buffer = new byte[1024];
            baos = new ByteArrayOutputStream();

            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                baos.write(buffer, 0, bytesRead);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return baos;
    }
}
