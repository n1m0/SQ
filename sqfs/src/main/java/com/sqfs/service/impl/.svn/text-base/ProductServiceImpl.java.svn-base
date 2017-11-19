package com.sqfs.service.impl;

import java.math.BigDecimal;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.sqfs.beans.Invest;
import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;
import com.sqfs.mapper.ProductMapper;
import com.sqfs.service.ProductService;
import com.sqfs.utils.RedisRepository;
@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private Jedis jedis;

	/**
	 * 通过借贷订单得到用户投资list,单个产品的投标信息(多人投标,得到是list)
	 */
	public List<Invest> getInvestsListByLoanId(Loan loan) {
			SqUser sqUser=new  SqUser();
			//用于得到单个产品的投资金额的详情列表
			List<Invest>	invests=productMapper.getYiTou(loan.getLoan_dd_id());
			BigDecimal yitoujine =new BigDecimal(0.000);
			BigDecimal dangetouzi=new BigDecimal(0.000);
			for (Invest invest : invests) {
				dangetouzi=invest.getTz_money();
				yitoujine= yitoujine.add(dangetouzi);
			}
			double yitou=yitoujine.doubleValue();
			double zonge=loan.getLoan_money().doubleValue();
			
			if(yitou==zonge){
				//这里改变订单的投资状态(调用方法),并且给投资人转账
				int flag1=productMapper.updateState(loan.getLoan_dd_id());
				BigDecimal account_balance1=productMapper.getAccountBalance(loan.getUser_id());
				BigDecimal account_balance2=new BigDecimal(yitou);
				BigDecimal account_balance=account_balance1.add(account_balance2);
				sqUser.setAccount_balance(account_balance);
				sqUser.setUser_id(loan.getUser_id());
				if(flag1>0){
					productMapper.updateAccountBalance(sqUser);
				}
			}
			//给loan中的yitou属性设置值
			loan.setYitou(yitoujine);
			//返回一个用户投资详情的list集合
		return productMapper.getInvestsListByLoanId(loan.getLoan_dd_id());
	}

	/**
	 * 通过借贷订单id得到借贷订单详情,用户详情,利率详情,还款详情,对应资产详情
	 */
	public Loan getLoansByLoanId(String loan_dd_id) {
		productMapper.updateCkState();
		return productMapper.getLoansByLoanId(loan_dd_id);
	}

	/**
	 * 用于求已投总额,多个产品
	 */
	public void getYiTou(List<Loan> loanList) {
		for (Loan loan : loanList) {
			List<Invest>	invests=productMapper.getYiTou(loan.getLoan_dd_id());
			BigDecimal yitoujine =new BigDecimal(0.000);
			BigDecimal dangetouzi=new BigDecimal(0.000);
			for (Invest invest : invests) {
				dangetouzi=invest.getTz_money();
				yitoujine= yitoujine.add(dangetouzi);
			}
			loan.setYitou(yitoujine);
		}
	}

	
	/**
	 * 用于投资客户投标(添加操作)
	 */
	public int add(Invest invest) {
		
		return productMapper.add(invest);
	}

	/**
	 * 查询总的借贷订单
	 */
	public int queryTotleList(Loan loan) {
		return productMapper.queryTotleList(loan);
	}

	/**
	 * 按条件查询借贷订单list
	 */
	@SuppressWarnings("unchecked")
	public List<Loan> queryProList(Loan loan) {
		productMapper.updateCkState();
		String s = "aa";//String变量 
		byte[] b = s.getBytes();//String转换为byte[] 
		RedisRepository.delInfo(b, jedis);
		List<Loan> list2 = null;
		list2=(List<Loan>) RedisRepository.getInfo(b,jedis);
		if(list2==null){
			List<Loan> listLoans = productMapper.queryProList(loan);
			RedisRepository.setInfo(listLoans,b,true,jedis);
			list2=(List<Loan>) RedisRepository.getInfo(b,jedis);
		}
		return list2;
	}

	/**
	 * 查询单个借款订单的所有投资人,为了分页
	 */
	public int getTotleInvestNum(String loan_dd_id) {
		return productMapper.getTotleInvestNum(loan_dd_id);
	}

	/**
	 * 修改客户账户余额
	 */
	public int updateDqye(SqUser sqUser) {
		return productMapper.updateDqye(sqUser);
	}

	/**
	 * 用于求首页展示的产品
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Loan> getProList() {
		
		productMapper.updateCkState();
		String s = "bb";//String变量 
		byte[] b = s.getBytes();//String转换为byte[] 
		RedisRepository.delInfo(b, jedis);
		List<Loan> list2 = null;
		list2=(List<Loan>) RedisRepository.getInfo(b,jedis);
		if(list2==null){
			List<Loan> listLoans = productMapper.getProList();
			RedisRepository.setInfo(listLoans,b,true,jedis);
			list2=(List<Loan>) RedisRepository.getInfo(b,jedis);
		}
		return list2;
	}
}
