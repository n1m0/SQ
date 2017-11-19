package com.sqfs.provider;

import lombok.extern.slf4j.Slf4j;

import org.apache.ibatis.jdbc.SQL;

import com.sqfs.beans.Loan;
import com.sqfs.utils.PageUtil;
@Slf4j
public class ProductProvider {
	
	 /**
	 *	条件查询总投资订单数量
	 * @param
	 * @return
	 * @exception
	 */
	public String totleQuery(final Loan loan) {
		 final String rate_num=PageUtil.map.get("rate_num_i");
		final String time_num=PageUtil.map.get("rate_id");
	        return new SQL(){
	            {
	                SELECT("count(1)");
	                FROM(" loan_dd l,rate r");
	                WHERE("l.rate_id=r.rate_id and l.cd_state in ('筹款中','还款中','已结束')");
	                if (loan.getLoan_type()!= null){
	                  if (loan.getLoan_type().equals("不限")) {
						WHERE("1=1");
	                  }else {
	                	  WHERE("l.loan_type=#{loan_type}" );
	                  }
	                }
	                if (rate_num!=null) {
	                	if (rate_num.equals("rate0")) {
	                		 WHERE("1=1");
						}else if (rate_num.equals("rate1")) {
	    					 WHERE("r.rate_num_i <= 0.06");
	    				}else if (rate_num.equals("rate2")) {
	    					 WHERE("0.07 <= r.rate_num_i and r.rate_num_i <= 0.09");
						}else if (rate_num.equals("rate3")) {
							WHERE("0.10 <= r.rate_num_i and r.rate_num_i <= 0.11");
						}else{
							WHERE("r.rate_num_i >= 0.12");
						}
	    			}
	                if (time_num!=null) {
	                	if (time_num.equals("val0")) {
							WHERE("1=1");
						}else if (time_num.equals("val1")) {
	                		 WHERE("r.hk_time<=1");
	                	}else if (time_num.equals("val2")) {
	                		WHERE("r.hk_time in (2,3)");
	                	}else if (time_num.equals("val3")) {
	                		WHERE("r.hk_time in (4,5,6)");
	                	}else if(time_num.equals("val4")) {
	                		WHERE("r.hk_time in (7,8,9,10,11)");
	                	}else {
	                		WHERE("r.hk_time>=12");
						}
	                }
	            }
	        }.toString();
	    }
	
	/**
	 *	带条件分页查询
	 * @param
	 * @return
	 * @exception
	 */
	public String proListQuery(final Loan loan) {
		String order="DESC";
		final String rate_num=PageUtil.map.get("rate_num_i");
		final String time_num=PageUtil.map.get("rate_id");
		return new SQL(){
			{
				SELECT("l.loan_dd_id ,l.user_id ,l.loan_money ,l.loan_name ,l.loan_date ,l.loan_num ,"
			+ "l.daihuanbx ,l.loan_type,l.rate_id ,l.hk_type ,l.loan_use ,l.dd_state,l.cd_state,l.release_date,"
			+ "l.commencement_date,l.min_money,r.rate_id 'rate.rate_id',r.hk_time 'rate.hk_time',"
			+ "r.rate_num_l 'rate.rate_num_l',r.rate_num_i 'rate.rate_num_i',"
			+ "p.pro_id 'productType.pro_id',p.product_type 'productType.product_type'");
				FROM(" loan_dd l, loan_tz_pro p,rate r");
				WHERE("p.product_type=l.loan_type and l.rate_id=r.rate_id and l.cd_state in ('筹款中','还款中','已结束')");
				if (loan.getLoan_type()!= null){
					if (loan.getLoan_type().equals("不限")) {
						WHERE("1=1");
	                  }else {
	                	  WHERE("l.loan_type=#{loan_type}" );
	                  }
				}
				if (rate_num!=null) {
					if (rate_num.equals("rate0")) {
						WHERE("1=1");
					}else if (rate_num.equals("rate1")) {
						WHERE("r.rate_num_i <= 0.06");
					}else if (rate_num.equals("rate2")) {
						WHERE("0.07 <= r.rate_num_i and r.rate_num_i <= 0.09");
					}else if (rate_num.equals("rate3")) {
						WHERE("0.10 <= r.rate_num_i and r.rate_num_i <= 0.11");
					}else{
						WHERE("r.rate_num_i >= 0.12");
					}
				}
				if (time_num!=null) {
					if (time_num.equals("val0")) {
						WHERE("1=1");
					}else if (time_num.equals("val1")) {
                		 WHERE("r.hk_time<=1");
                	}else if (time_num.equals("val2")) {
                		WHERE("r.hk_time in (2,3)");
                	}else if (time_num.equals("val3")) {
                		WHERE("r.hk_time in (4,5,6)");
                	}else if(time_num.equals("val4")) {
                		WHERE("r.hk_time in (7,8,9,10,11)");
                	}else {
                		WHERE("r.hk_time>=12");
					}
				}
				ORDER_BY("l.loan_date");
			}
		}.toString()+" "+order+" limit "+(PageUtil.currentPage-1)*(PageUtil.pageSize)+","+PageUtil.pageSize;
		
	}
	
	/**
	 *	带条件分页查询投资人信息的列表(单个产品)
	 * @param
	 * @return
	 * @exception
	 */
	public String investList(String loan_dd_id) {
		String order="DESC";
		return new SQL(){
			{
				SELECT("t.tz_dd_id, t.user_id, t.tz_money, t.tz_time, t.loan_dd_id, t.dqye, "
				+ "t.tz_state,u.user_name 'sqUser.user_name'");
				FROM(" tz_dd t,loan_dd l,sq_user u");
				WHERE("t.user_id=u.user_id and l.loan_dd_id=t.loan_dd_id "
				+ "and t.loan_dd_id=#{loan_dd_id} ");
				ORDER_BY("t.tz_time");
			}
		}.toString()+" "+order+" limit "+(PageUtil.currentPage-1)*(PageUtil.pageSize)+","+PageUtil.pageSize;
		
	}
		
}
