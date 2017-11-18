package com.institute.service;

import java.util.List;

import com.institute.bean.BranchBean;

public interface BranchService {
	public List<BranchBean> getAllBranch(String collegeId);
	public void ceateBranch(BranchBean branchBean);

}
