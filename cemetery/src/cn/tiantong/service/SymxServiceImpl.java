package cn.tiantong.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tiantong.dao.SymxDao;
import cn.tiantong.entity.Symx;
@Service("symxService")
public class SymxServiceImpl implements SymxService {
	@Resource(name="symxDao")
    private SymxDao symxDao;
	public List<Symx> getSymxCount(Map<String, Object> map) {
		List<Symx> symxs = symxDao.getSymxCount(map);
		return symxs;
	}

}
