package com.sqfs.service;

import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;
import com.sqfs.beans.ZcInfo;

public interface LoanInfoService {
	
	/**
	 *	借贷时填写的个人信息,修改个人信息
	 * @param
	 * @return
	 * @exception
	 */
	int updateSqUser(SqUser sqUser);
	
	ZcInfo queryZcInfo(String zc_id);
	
	int insertZcId(ZcInfo zcInfo);
	
	
	/**
	 *	添加借贷订单(填写完,未审核的)
	 * @param
	 * @return
	 * @exception
	 */
	int addLoanProduct(Loan loan);
	
	
	/**
	 *	添加还款信息,单个产品的(在service层写逻辑,这里直接写sql语句)
	 * @param
	 * @return
	 * @exception
	 */
	int addRepayment(Loan loan);

}
