package cn.tiantong.dao;

import java.util.Map;

import cn.tiantong.entity.Kzcx;

public interface KzcxDao {
	//查询总记录数
	Kzcx getCount(Map<String,Object> map);
}
