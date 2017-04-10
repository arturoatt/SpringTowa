package com.towasoftware.hospital.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.towasoftware.hospital.models.Especialidad;
import com.towasoftware.hospital.services.EspecialidadDAO;

@Controller
@RequestMapping(value = "/Especialidad", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
public class EspecialidadController {
	//private static final Logger logger = LoggerFactory.getLogger(Especialidad.class);
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody Especialidad createEspecialidad(@RequestBody Especialidad especialidad) throws SQLException {
		
		new EspecialidadDAO().createEspecialidad(especialidad);
		
		return especialidad;
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody Especialidad updateEspecialidad(@RequestBody Especialidad especialidad) {
		
		
		
		return especialidad;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public @ResponseBody Especialidad getEspecialidadByID(@PathVariable Integer id) throws SQLException {
		
		return new EspecialidadDAO().getEspecialidadByID(id);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody List<Especialidad> getAllEspecialidades() throws SQLException {		
		
		return new EspecialidadDAO().getAllEspecialidades();
		
	}
}
