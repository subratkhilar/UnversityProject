package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.LibrarianBean;
import com.institute.dao.LibrarianDao;
import com.institute.service.LibrarianService;
@Service("librarianService")
public class LibrarianServiceImpl implements LibrarianService {
	@Autowired
	private LibrarianDao librarianDao;

	public int createLibrarian(LibrarianBean libBean) {

		return librarianDao.createLibrarian(libBean);
	}

	public List<LibrarianBean> getAllLibrarian(String collegeId) {
		return librarianDao.getAllLibrarian(collegeId);
	}

	public LibrarianBean getLibrianById(int id) {
		return librarianDao.getLibrianById(id);
	}

	public int deletelibraian(int id) {
		return librarianDao.deletelibraian(id);
	}

}
