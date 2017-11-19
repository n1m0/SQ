package com.sqfs.provider;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sqfs.beans.LikeResearch;


/**
 * 分页模糊查询订单信息
 * @author csh
 * @param Map (数据用map封装)
 * @return Loan (返回集合对象)
 * */
@Mapper
public class QueryOrderProvider {
	//分页模糊查询
	public String queryOrders(final Map<String,Object> orderInfo){
		final LikeResearch likeResearch=(LikeResearch) orderInfo.get("likeResearch");
		@SuppressWarnings("unchecked")
		final List<String> list=(List<String>) orderInfo.get("orders");
		StringBuffer sql=new StringBuffer();
		sql.append("select ld.loan_dd_id,ld.taskid,sq.t_name,ld.loan_money,"
						+ "ld.loan_name,ld.loan_date,"
						+ "ld.hk_type,ld.loan_use,ld.sh_level,"
						+ "ld.dd_state,ld.sp_time1,ld.sp_time2,ld.g_id,ld.g_id2,"
						+ "ld.remark1,ld.remark2,ld.release_date,ld.commencement_date from loan_dd ld left join sq_user sq on ld.user_id=sq.user_id "
						+ "where ld.loan_dd_id  in (");
				
				for(int i=0;i<list.size();i++){
					sql.append("'");
					sql.append(list.get(i));
					sql.append("'");
					if(i<list.size()-1){
						sql.append(",");
					}else{
						sql.append(")");
					}
				}		
                if (likeResearch.getStartTime()!=null&&!"".equals(likeResearch.getStartTime()))
                {
                    sql.append("and ld.loan_date >= #{likeResearch.startTime} ");
                }
                if (likeResearch.getEndTime()!=null&&!"".equals(likeResearch.getEndTime()))
                {
                	sql.append(" and ld.loan_date <= #{likeResearch.endTime} ");
                }
                if(likeResearch.getComment()!=null&&!"".equals(likeResearch.getComment()))
                {
                	sql.append(" and ld.dd_state = #{likeResearch.comment} ");
                }
                if(likeResearch.getLikeorderid()!=null&&!"".equals(likeResearch.getLikeorderid()))
                {
                	sql.append(" and sq.t_name like concat(concat('%',#{likeResearch.likeorderid}),'%')");
                }
				sql.append(" order by  ld.loan_date ");
                sql.append(" limit "+orderInfo.get("startSize")+","+orderInfo.get("pageSize"));	
				
				return sql.toString();	
	}
	
	//查询符合条件的订单数量
	public String getCount(final Map<String,Object> orderInfo){
		final LikeResearch likeResearch=(LikeResearch) orderInfo.get("likeResearch");
		@SuppressWarnings("unchecked")
		final List<String> list=(List<String>) orderInfo.get("orders");
		StringBuffer sql=new StringBuffer();
		sql.append("select count(1) from loan_dd ld , sq_user sq "
						+ "where ld.loan_dd_id=sq.t_name and  ld.loan_dd_id  in (");
				
				for(int i=0;i<list.size();i++){
					sql.append("'");
					sql.append(list.get(i));
					sql.append("'");
					if(i<list.size()-1){
						sql.append(",");
					}else{
						sql.append(")");
					}
				}		
                if (likeResearch.getStartTime()!=null&&!"".equals(likeResearch.getStartTime()))
                {
                    sql.append("and ld.loan_date >= #{likeResearch.startTime} ");
                }
                if (likeResearch.getEndTime()!=null&&!"".equals(likeResearch.getEndTime()))
                {
                	sql.append(" and ld.loan_date <= #{likeResearch.endTime} ");
                }
                if(likeResearch.getComment()!=null&&!"".equals(likeResearch.getComment()))
                {
                	sql.append(" and ld.dd_state =#{likeResearch.comment} ");
                }
                if(likeResearch.getLikeorderid()!=null&&!"".equals(likeResearch.getLikeorderid()))
                {
                	sql.append(" and sq.t_name like concat(concat('%',#{likeResearch.likeorderid}),'%') ");
                }				
				return sql.toString();	
	}		
}
