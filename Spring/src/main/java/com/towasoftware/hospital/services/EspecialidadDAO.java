package com.towasoftware.hospital.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.towasoftware.hospital.models.Especialidad;

public class EspecialidadDAO {
	private static final Logger logger = LoggerFactory.getLogger(EspecialidadDAO.class);

	public Especialidad createEspecialidad(Especialidad especialidad) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			con = new ConnectionHospital().getConnection();
			
			StringBuffer sb = new StringBuffer("INSERT INTO ESPECIALIDAD (NOMBRE) ");
			sb.append("VALUES (?)");
			
			ps = con.prepareStatement(sb.toString());
			ps.setString(1, especialidad.getNombre());

			ps.executeUpdate();			
			
			st = con.createStatement();
			String sql = "SELECT MAX(ID_ESPECIALIDAD) FROM ESPECIALIDAD";

			ResultSet rs = st.executeQuery(sql);			

			if (rs.next())
				especialidad.setIdEspecialidad(rs.getInt(1));
			
			
		} catch (SQLException e) {			
			logger.info("Error en createEspecialidad" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}

			if (con != null) {
				con.close();
			}
			if (st != null) {
				st.close();
			}
		}

		return especialidad;
	}

	public Especialidad updateEspecialidad(Especialidad especialidad) throws SQLException {

		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			con = new ConnectionHospital().getConnection();
			
			StringBuffer sb = new StringBuffer("UPDATE ESPECIALIDAD SET NOMBRE = ? ");
			sb.append("WHERE ID_ESPECIALIDAD = ?");
			
			ps = con.prepareStatement(sb.toString());
			ps.setString(1, especialidad.getNombre());
			ps.setInt(2, especialidad.getIdEspecialidad());

			ps.executeUpdate();			
			
		} catch (SQLException e) {			
			logger.info("Error en createEspecialidad" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}

			if (con != null) {
				con.close();
			}
			if (st != null) {
				st.close();
			}
		}

		return especialidad;
	}

	public Especialidad getEspecialidadByID(Integer id) throws SQLException {

		Especialidad especialidad = null;
		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			con = new ConnectionHospital().getConnection();
			
			StringBuffer sb = new StringBuffer("SELECT ID_ESPECIALIDAD, NOMBRE FROM ESPECIALIDAD ");
			sb.append("WHERE ID_ESPECIALIDAD = ?");
			
			ps = con.prepareStatement(sb.toString());
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();			

			if (rs.next()){
				especialidad = new Especialidad();
				especialidad.setIdEspecialidad(rs.getInt("ID_ESPECIALIDAD"));
				especialidad.setNombre(rs.getString("NOMBRE"));
			}
			
		} catch (SQLException e) {			
			logger.info("Error en getEspecialidadByID" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}			
		}
		return especialidad;
	}

	public List<Especialidad> getAllEspecialidades() throws SQLException  {

		List<Especialidad> especialidades = new ArrayList<Especialidad>();
		Connection con = null;
		PreparedStatement ps = null;
		Statement st = null;
		try {
			con = new ConnectionHospital().getConnection();
			
			st = con.createStatement();
			String sql = "SELECT ID_ESPECIALIDAD, NOMBRE FROM ESPECIALIDAD";

			ResultSet rs = st.executeQuery(sql);			

			while (rs.next()){
				Especialidad esp = new Especialidad();
				esp.setIdEspecialidad(rs.getInt("ID_ESPECIALIDAD"));
				esp.setNombre(rs.getString("NOMBRE"));
				especialidades.add(esp);
			}
			
		} catch (SQLException e) {			
			logger.info("Error en getAllEspecialidades" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (st != null) {
				st.close();
			}
			if (con != null) {
				con.close();
			}
			
		}
		return especialidades;
	}
}
