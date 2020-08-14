package loginProf;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.concurrent.Semaphore;

import loginProf.xmlMessageConvert.MessagesConverter;
import otherServerInfo.ServerInfo;

public class ClientServerProf {

	private String xmlProtocol = "";//string que envia msn server
	private String profName;
	private String host;
	private int port;
	private Socket socket;
	private BufferedReader in = null;
	private PrintWriter out = null;

	private String responseReceived;
	private Semaphore canWriteMutex;

	public ClientServerProf(String profName) {
		host = ServerInfo.DEFAULT_HOSTNAME;// Maquina onde reside a aplicacao servidora
		port = ServerInfo.DEFAULT_PORT; // Porto da aplicacao servidora
		createSocket();

		this.profName = profName;
		canWriteMutex = new Semaphore(1, true);
	}

	private void createSocket() {
		try {
			socket = new Socket(this.getHost(), this.getPort());

			out = new PrintWriter(socket.getOutputStream(), true);// Stream para escrita no socket
			in = new BufferedReader(
					new InputStreamReader(socket.getInputStream()));// Stream para leitura do socket

			checkInput();
			new Thread(new Runnable() {
				@Override
				public void run() {
					String inputLine;
					for (;;) {
						try {
							if ((inputLine = in.readLine()) != null) {
								System.out.println("Recebi P -> " + inputLine);
								if (inputLine.substring(0, 5).equals("<info")) {
									responseReceived = MessagesConverter
											.resultResponseProfInfo(inputLine);
								} else {
									responseReceived = inputLine;
								}
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}).start();

		} catch (IOException e) {
			System.err.println("Erro na ligacao " + e.getMessage());
		}
	}

	// fun��o para enviar mensagens para o server
	private void checkInput() {
		new Thread(new Runnable() {
			@Override
			public void run() {
				for (;;) {
					try {
						Thread.sleep(50);
						if (xmlProtocol != "") {
							out.println(xmlProtocol);
							xmlProtocol = "";
							canWriteMutex.release();
						}
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}).start();
	}

	public void sendXMLToServer(String messageXML) {
		try {
			canWriteMutex.acquire();
			this.xmlProtocol = messageXML;
		} catch (InterruptedException exception) {
			exception.printStackTrace();
		}
	}

	public String getResponseReceived() {
		return this.responseReceived;
	}

	public void resetResponseReceived() {
		this.responseReceived = null;
	}

	public void setProfName(String profName) {
		this.profName = profName;
	}

	public String getProfName() {
		return this.profName;
	}

	protected String getHost() {
		return this.host;
	}

	protected int getPort() {
		return this.port;
	}

	protected void setHost(String host) {
		this.host = host;
	}

	protected void setPort(int port) {
		this.port = port;
	}

}
