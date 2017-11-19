package com.sqfs.provider;

import org.apache.ibatis.jdbc.SQL;

import com.sqfs.beans.MoneyRecord;
/**
 * 
* @Description: 个人中心动态SQL查询 
* @author 丁振兴
 */
public class PersonalCenterProvider {
	/**
	 * 
	 * @Description 动态资金记录查询
	 * @param MoneyRecord moneyRecord
	 * @return String
	 *
	 */
	public String getMoneyRecordByUserId(final MoneyRecord moneyRecord){
		
		
		return new SQL(){
            {
                SELECT("money_record_id,user_id,trade_type,trade_money,balance,trade_date,remark ");
                FROM("money_record");
                WHERE("user_id = #{user_id}");
                if (moneyRecord.getTrade_type() != null && moneyRecord.getTrade_type().trim() != "")
                {
                    WHERE("trade_type = #{trade_type}");
                }
                if (moneyRecord.getTrade_date() != null){
                	WHERE("trade_date > #{trade_date}");
                }
                if(moneyRecord.getStartNum() != 0){
                	ORDER_BY("trade_date desc limit #{startNum},#{showRows}");
                }else{
                	ORDER_BY("trade_date limit #{startNum},#{showRows}");
                }
            }
        }.toString();
	}
	/**
	 * 
	 * @Description 根据用户id获取用户资金记录的条数
	 * @param MoneyRecord moneyRecord 资金对象
	 * @return  MoneyRecord moneyRecord
	 *
	 */
	public String getMoneyRecordTotalNum(final MoneyRecord moneyRecord){
		return new SQL(){
			{
				SELECT("count(*)");
				FROM("money_record");
				WHERE("user_id = #{user_id}");
				if (moneyRecord.getTrade_type() != null && moneyRecord.getTrade_type().trim() != "")
                {
                    WHERE("trade_type = #{trade_type}");
                }
                if (moneyRecord.getTrade_date() != null){
                	WHERE("trade_date > #{trade_date}");
                }
			}
		}.toString();
	}
	public String a(){
		
		return new SQL(){{}}.toString();
	}
}
