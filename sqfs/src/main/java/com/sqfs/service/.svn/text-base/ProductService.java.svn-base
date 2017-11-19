package com.sqfs.service;


import java.util.List;

import com.sqfs.beans.Invest;
import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;


public interface ProductService {
	
	List<Invest> getInvestsListByLoanId(Loan loan);
	
	Loan getLoansByLoanId(String loan_dd_id);
	
	void getYiTou(List<Loan> loanList);
	
	int add(Invest invest);
	
	int queryTotleList(Loan loan);
	
	List<Loan> queryProList(Loan loan);
	
	int getTotleInvestNum(String loan_dd_id);
	
	int updateDqye(SqUser sqUser);
	
	List<Loan> getProList();
}
