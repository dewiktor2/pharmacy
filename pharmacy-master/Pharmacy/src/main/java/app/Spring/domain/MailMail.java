package app.Spring.domain;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;



public class MailMail {

	
	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	@Async
	public void sendMail(String from, String to, String subject, String msg,User user,CustomerOrder order) {

	
	
        Properties properties = createConfiguration();

        SmtpAuthenticator authentication = new SmtpAuthenticator();

        Session session = Session.getDefaultInstance(properties, authentication);

        try {

            MimeMessage message2 = new MimeMessage(session);
            message2.setFrom(new InternetAddress(from));
            message2.addRecipient(Message.RecipientType.TO,
                new InternetAddress(user.getEmail()));

            message2.setSubject("Zakupy w naszej aptece");


            
            
            message2.setContent(msg, "text/html");

           // Send message
           Transport.send(message2);

           System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
           mex.printStackTrace();
     }
	}

 private static Properties createConfiguration() {
    return new Properties() {
        {
            put("mail.smtp.auth", "true");
            put("mail.smtp.host", "smtp.gmail.com");
            put("mail.smtp.port", "587");
            put("mail.smtp.starttls.enable", "true");
        }
    };
 }

 private static class SmtpAuthenticator extends Authenticator {

        private String username = "adammalysz92@gmail.com";
        private String password = "adammalysz-1";

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    }
}
	
	

	
	
