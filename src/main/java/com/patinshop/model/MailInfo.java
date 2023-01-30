package com.patinshop.model;

public class MailInfo {

	private String from;
	private String to;
	private String[] ppl;
	private String cc;
	private String bcc;
	private String subject;
	private String content;
	private String files;

	public MailInfo() {

	}

	public MailInfo(String from, String to, String subject, String content) {
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.content = content;
	}
	
	public MailInfo(String from, String[] to, String subject, String content) {
		this.from = from;
		this.ppl = to;
		this.subject = subject;
		this.content = content;
	}

	public MailInfo(String from, String to, String cc, String bcc, String subject, String content, String files) {
		this.from = from;
		this.to = to;
		this.cc = cc;
		this.bcc = bcc;
		this.subject = subject;
		this.content = content;
		this.files = files;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getBcc() {
		return bcc;
	}

	public void setBcc(String bcc) {
		this.bcc = bcc;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public String[] getPpl() {
		return ppl;
	}

	public void setPpl(String[] ppl) {
		this.ppl = ppl;
	}
	
}
