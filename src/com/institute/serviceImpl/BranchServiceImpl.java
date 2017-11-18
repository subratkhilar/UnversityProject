package com.institute.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.institute.bean.BranchBean;
import com.institute.dao.BranchDao;
import com.institute.service.BranchService;
@Service("branchService")
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchDao branchDao;

	public List<BranchBean> getAllBranch(String collegeId) {
		
		return branchDao.getAllBranch(collegeId);
	}

	public void ceateBranch(BranchBean branchBean) {
		branchDao.ceateBranch(branchBean);
		
	}

}
