package com.towasoftware.hospital.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class ConnectionHospital {
	private static final Logger logger = LoggerFactory.getLogger(ConnectionHospital.class);
	Connection connection = null;

	ConnectionHospital() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.info("Error de Conexión.");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			logger.info("Libreria no encontrada de MySQL.");
		}
	}
	
	Connection getConnection(){
		return this.connection;
	}
}
