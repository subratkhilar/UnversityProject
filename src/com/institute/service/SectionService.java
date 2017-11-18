package com.institute.service;

import java.util.List;

import com.institute.bean.Section;

public interface SectionService {
	public int createSection(Section section);

	public List<Section> getAllSetion(String collegeId,String branchId);

}
