package com.avio.service;

import com.avio.domain.Ticket;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;

@Service
public class TicketPDFGenerator {
    private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 18,Font.BOLD);
    private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

    public Document createPDF(String file, Ticket ticket) {

        Document document = null;

        try {
            document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(file));
            document.open();

            addMetaData(document);

            addTitlePage(document, ticket);

            document.close();

        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return document;

    }

    private static void addMetaData(Document document) {
        document.addTitle("Avio ticket");
        document.addSubject("Avio ticket");
        document.addAuthor("AvioCompany");
        document.addCreator("AvioCompany");
    }

    private static void addTitlePage(Document document, Ticket ticket)
            throws DocumentException {
        SimpleDateFormat sdfDate = new SimpleDateFormat("dd.MM.yyyy.");
        SimpleDateFormat sdfWithTime = new SimpleDateFormat("dd.MM.yyyy. HH:mm");

        Paragraph preface = new Paragraph();
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("AvioTicket no. " + ticket.getId() + ", passenger: " + ticket.getFirstName() + " " + ticket.getLastName(), TIME_ROMAN));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph(ticket.getReservation().getFlight().getAirportDepIata() + " - " + ticket.getReservation().getFlight().getAirportArrIata(), TIME_ROMAN));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Departure time: " + sdfWithTime.format(ticket.getReservation().getFlight().getTimeDep()), TIME_ROMAN_SMALL));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Arrival time: " + sdfWithTime.format(ticket.getReservation().getFlight().getTimeArr()), TIME_ROMAN_SMALL));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Price: " + ticket.getPrice(), TIME_ROMAN_SMALL));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Class type: " + ticket.getClassType().getName(), TIME_ROMAN_SMALL));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Gate: " + ticket.getReservation().getFlight().getGate(), TIME_ROMAN_SMALL));
        creteEmptyLine(preface, 1);

        preface.add(new Paragraph("Reservation date: "
                + sdfDate.format(ticket.getReservation().getDateCreated()), TIME_ROMAN_SMALL));
        document.add(preface);
    }

    private static void creteEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}
