package com.patinshop.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.patinshop.model.MailInfo;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	public void send(MailInfo myMail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom(myMail.getFrom());
		if (myMail.getTo() != null)
			helper.setTo(myMail.getTo());
		else if (myMail.getPpl() != null)
			helper.setTo(myMail.getPpl());
		helper.setSubject(myMail.getSubject());
		helper.setText(myMail.getContent());

		if (myMail.getCc() != null) {
			helper.setFrom(myMail.getCc());
		}
		if (myMail.getBcc() != null) {
			helper.setFrom(myMail.getBcc());
		}
		if (myMail.getFiles() != null) {
			String[] paths = myMail.getFiles().split(";");
			for (String path : paths) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		mailSender.send(message);
	}
}
