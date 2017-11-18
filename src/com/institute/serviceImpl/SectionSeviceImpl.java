package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.Section;
import com.institute.dao.SectionDao;
import com.institute.service.SectionService;

@Service("sectionService")
public class SectionSeviceImpl implements SectionService {
	@Autowired
	private SectionDao sectionDao;

	public int createSection(Section section) {
		return sectionDao.createSection(section);
	}

	public List<Section> getAllSetion(String collegeId,String branchId) {
		return sectionDao.getAllSetion(collegeId,branchId);
	}

}
