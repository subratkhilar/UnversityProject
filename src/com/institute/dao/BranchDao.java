package com.institute.dao;

import java.util.List;

import com.institute.bean.BranchBean;

public interface BranchDao {
	public List<BranchBean> getAllBranch(String collegeId);
	public void ceateBranch(BranchBean branchBean);

}
