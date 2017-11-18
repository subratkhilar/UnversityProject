package com.institute.dao;

import java.util.List;

import com.institute.bean.LibrarianBean;

public interface LibrarianDao {
	public int createLibrarian(LibrarianBean libBean);

	public List<LibrarianBean> getAllLibrarian(String collegeId);

	public LibrarianBean getLibrianById(int id);

	public int deletelibraian(int id);

}
