package com.institute.service;

import java.util.List;

import com.institute.bean.LibrarianBean;

public interface LibrarianService {
	public int createLibrarian(LibrarianBean libBean);

	public List<LibrarianBean> getAllLibrarian(String collegeId);

	public LibrarianBean getLibrianById(int id);

	public int deletelibraian(int id);

}
