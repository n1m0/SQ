package com.sqfs.service.impl;

import java.math.BigDecimal;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.alibaba.druid.support.logging.Log;
import com.sqfs.beans.Loan;
import com.sqfs.beans.Repayment;
import com.sqfs.beans.SqUser;
import com.sqfs.beans.ZcInfo;
import com.sqfs.mapper.LoanInfoMapper;
import com.sqfs.mapper.ProductMapper;
import com.sqfs.service.LoanInfoService;
import com.sqfs.utils.DateUtil;
import com.sqfs.utils.RedisRepository;
@Service
@Slf4j
public class LoanInfoServiceImpl implements LoanInfoService {
	
	@Autowired
	private LoanInfoMapper loanInfoMapper;
	
	@Autowired
	private Jedis jedis;
	
	public int updateSqUser(SqUser sqUser) {
		
		return loanInfoMapper.updateSqUser(sqUser);
	}

	

	/**
	 * 添加借贷订单
	 */
	public int addLoanProduct(Loan loan) {
		//先删除redis
		String s = "aa";//String变量 
		byte[] b = s.getBytes();//String转换为byte[] 
		RedisRepository.delInfo(b, jedis);
		String m = "bb";//String变量 
		byte[] a = s.getBytes();//String转换为byte[] 
		RedisRepository.delInfo(a, jedis);
		return loanInfoMapper.addLoanProduct(loan);
	}

	/**
	 * 还款信息,7个字段
	 */
	public int addRepayment(Loan loan) {
		BigDecimal rate=new BigDecimal(0.00);
		//新的还款信息对象
		Repayment repayment=new Repayment();
		//借款期限(年)
		double year=(Double.parseDouble(loan.getRate_id()))/12;
		BigDecimal monBigDecimal=new BigDecimal(year);
		
		//借款金额
		BigDecimal loanMoney=loan.getLoan_money();
		int dke=loanMoney.intValue();
		//借款期限()月
		int mon=Integer.parseInt(loan.getRate_id());
		
		
		//年利率
		Loan loan2=loanInfoMapper.queryRate(loan);
		BigDecimal lilv=loan2.getRate().getRate_num_l();
		
		double nll=lilv.doubleValue();
		double yl=nll/12;
		
		BigDecimal shuzi=new BigDecimal(12);
		BigDecimal shuzi1=new BigDecimal(1);
		BigDecimal shuzi0=new BigDecimal(0);
		//月利率
		//BigDecimal yll=lilv.divide(shuzi);
		
		//还款方式(2种等额本息,到期本息)
		String strType=loan.getHk_type();
		if ("到期还本付息".equals(strType)) {
			//到期本息的利息
			rate=((loanMoney.multiply(lilv)).multiply(monBigDecimal));
			
		}else {
	       double pay = (dke * yl * (Math.pow((1 + yl), mon)))/(Math.pow((1 + yl), mon)-1);
	       double rat=(pay*mon-dke);
			rate=new BigDecimal(rat);
		}
		//主键id
		repayment.setTran_id(loan.getTran_id());
		//期数
		repayment.setQishu(Integer.parseInt(loan.getRate_id()));
		//应还本金
		repayment.setYh_benjin(loanMoney);
		//应还利息
		repayment.setYh_lixi(rate);
		//还款状态
		repayment.setHk_state(loan.getDd_state());
		//已还本息
		repayment.setYh_bx(shuzi0);
		//待还本息
		repayment.setDh_bx(loanMoney.add(rate));
		
		return loanInfoMapper.addRepayment(repayment);
	}

	@Override
	public ZcInfo queryZcInfo(String zc_id) {
		// TODO Auto-generated method stub
		return loanInfoMapper.queryZcInfo(zc_id);
	}

	

	@Override
	public int insertZcId(ZcInfo zcInfo) {
		
		return loanInfoMapper.insertZcId(zcInfo);
	}

}
