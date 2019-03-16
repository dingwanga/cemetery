package cn.tiantong.service;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.KzcxDao;
import cn.tiantong.entity.Kzcx;

@Service("kzcxService")
public class KzcxServiceImpl implements KzcxService {
	
	@Resource(name="kzcxDao")
	private KzcxDao kzcxDao;

	public Kzcx getCount(Map<String, Object> map) {
		return kzcxDao.getCount(map);
	}


}
