package com.institute.dao;

import java.util.List;

import com.institute.bean.Section;

public interface SectionDao {
	public int createSection(Section section);

	public List<Section> getAllSetion(String collegeId,String branchId);

}
